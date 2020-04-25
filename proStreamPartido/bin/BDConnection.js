const mysql=require('mysql');
const pool = mysql.createPool({
    connectionLimit: 3,
    host: '127.0.0.1',
    user: 'root',
    password: 'oculto',
    database: 'bdPryStreamDep'
});
module.exports=pool;