const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const router = express.Router();


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

router.get('/perfiles', function (req, res) {

  console.log("Perfiles pedidos");

  var bajarPeso = { "id": 1, "nombre": "Perder Peso", "imagen": "perder-peso.png" };
  var ganaerPeso = { "id": 2, "nombre": "Ganar Peso", "imagen": "ganar-peso.png" };
  var ganarMusculo = { "id": 3, "nombre": "Ganar Músculos", "imagen": "ganar-musculo.png" };
  var holawenas = { "id": 4, "nombre": "Ganar Músculos", "imagen": "ganar-musculo.png" };
  var json = JSON.stringify([bajarPeso, ganarMusculo, ganaerPeso]);
  res.send(json);
});


router.get('/suscripciones', function (req, res) {

  console.log("Suscripciones pedidas");

  var json = JSON.stringify([
    {
      "id": 1,
      "nombre": "Basic",
      "precio": 15.0,
      "duracion": "1 semana",
      "cantidad": "7 comidas",
      "color": "0xffFFBA5C",
    },
    {
      "id": 2,
      "nombre": "Platino",
      "precio": 100.0,
      "duracion": "1 mes",
      "cantidad": "90 comidas",
      "color": "0xff00A6FF",
    },
    {
      "id": 3,
      "nombre": "Gold",
      "precio": 299.0,
      "duracion": "3 meses",
      "cantidad": "180 comidas",
      "color": "0xffF7F109",
    },
    {
      "id": 4,
      "nombre": "VIP",
      "precio": 360.0,
      "duracion": "3 meses + secret dish",
      "cantidad": "190 comidas + 10 secret dish",
      "color": "0xffF263C7",
    }
  ]);
  res.send(json);
});


router.post('/validacion', (req, res, err) => {

  if (req.body.nombre == "user" && req.body.contra == "pass") {
    res.send("User valido");
  } else {
    res.send(err);
  }

});


app.use('/', router)


app.listen(3000, function () {
  console.log('Aplicación ejemplo, escuchando el puerto 3000!');
});