var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestiones */
router.get("/crearGestion" , gestionesController.crear);

module.exports = router;
