var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestiones */
router.get("/crear" , gestionesController.crear);

module.exports = router;
