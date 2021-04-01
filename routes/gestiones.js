var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestion de medicamentos*/
router.get("/crearMedicamento" , gestionesController.medicamentos);

router.post("/crearMedicamento" , gestionesController.guardarMedicamento);

/* Creación de gestion de protesis*/
router.get("/crearProtesis" , gestionesController.protesis);

router.post("/crearProtesis" , gestionesController.guardarProtesis); 


/* vista de gestion */
router.get("/vista", gestionesController.vista);


module.exports = router;
