//conn = new Mongo();
//db = conn.getDB("myDatabase");

//db.adminCommand('listDatabases');

//db = db.getSiblingDB('test');
db.users.insert(
    {
        name: "sue",
        age: 26,
        status: "A"
    }
);

cursor = db.users.find();
while ( cursor.hasNext() ) {
   printjson( cursor.next() );
};
