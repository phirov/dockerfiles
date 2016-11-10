#!/bin/bash

DATABASE=${MONGODB_WORKDB:-"test"}

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "=> Creating an user work db ${DATABASE} in MongoDB"
mongo ${DATABASE} --eval "db.users.ensureIndex({name: 1})"
mongo ${DATABASE} --eval "db.users.insert({name: 'sue', age: 26, status: 'A'};"

if [ "${DATABASE}" != "test" ]; then
    echo "=> Creating an user work db ${DATABASE} in MongoDB"
    mongo ${DATABASE} -u ${MONGODB_USER} -p ${MONGODB_PASS} << EOF
use ${DATABASE}
db.users.ensureIndex({name: 1})
db.users.insert({name: 'sue', age: 26, status: 'A'};
EOF
fi

echo "=> Done!"
touch /data/db/.mongodb_init_set

echo "========================================================================"
echo "You can now connect to this MongoDB server using:"
echo ""
echo "    mongo ${DATABASE} -u ${MONGODB_USER} -p ${MONGODB_PASS} --host <host> --port <port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
