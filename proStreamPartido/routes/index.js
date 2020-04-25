const conn=require('../bin/BDConnection')

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  conn.getConnection((err, conexion) => {
    if(err){
      console.log('Error de conexion')
      res.send('Error de conexion')
    }else{
      sql = 'SELECT * FROM tEquipo'
      conn.query(sql,(err, resultado) =>{
        if(err){
          console.log('Error de consulta')
          res.send('Error de consulta')
        }else{
          console.log(resultado)
          res.render('index',{title:'Desde la BD',datos:resultado})
        }
      })
    }
  })
});
router.get('/login', (req, res, next) => {
  res.render('login');
});

module.exports = router;