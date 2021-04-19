var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestion de medicamentos*/
router.get("/crearGestion" , gestionesController.gestion);

router.post("/crearGestion" , gestionesController.guardar_gestion);



/* vista de gestiones */
router.get("/" , gestionesController.vistaGestiones);




module.exports = router;
