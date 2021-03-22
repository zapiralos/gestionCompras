var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestiones */
router.get("/crear" , gestionesController.crear);

router.post("/crear" , gestionesController.guardadoGestion);



/* vista de gestion */
router.get("/vista", gestionesController.vista);


module.exports = router;
