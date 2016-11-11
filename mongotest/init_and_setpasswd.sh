#!/bin/bash

ADMIN=admin
export DATABASE=${MONGODB_DATABASE:-$ADMIN}

export USER=${MONGODB_USER:-$ADMIN}
export PASS=${MONGODB_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${MONGODB_PASS} ] && echo "preset" || echo "random" )

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo $ADMIN --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "=> Creating an ${USER} user with a ${_word} password in MongoDB"
mongo $ADMIN --eval "db.createUser({user: '$USER', pwd: '$PASS', roles:[{role:'root',db:$ADMIN}]});"

if [ "$DATABASE" != $ADMIN ]; then
    echo "=> Creating an ${USER} user with a ${_word} password in MongoDB"
    mongo $ADMIN -u $USER -p $PASS << EOF
use $DATABASE
db.createUser({user: '$USER', pwd: '$PASS', roles:[{role:'dbOwner',db:'$DATABASE'}]})
load('create.js')
EOF
fi

echo "=> Done!"
touch /data/db/.init_passwd_set

echo "========================================================================"
echo "You can now connect to this MongoDB server using:"
echo ""
echo "    mongo $DATABASE -u $USER -p $PASS --host <host> --port <port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
