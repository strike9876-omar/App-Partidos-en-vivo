const conn=require('../bin/BDConnection')

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  conn.getConnection((err, conexion) => {
    if(err){
      console.log('Error de conexion de la bd')
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

router.get('/login', function(req, res, next) {
  res.render('login');
});
router.get('/master', function(req, res, next) {
  res.render('master');
});
router.get('/contact', (req, res, next) =>{
  res.render('contact');
});
module.exports = router;