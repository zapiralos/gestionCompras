var express = require('express');
var router = express.Router();
var gestionesController = require("../controllers/gestionesController")


/* Creación de gestion de medicamentos*/
router.get("/crearGestion" , gestionesController.gestion);

router.post("/crearGestion" , gestionesController.guardar_gestion);

/* nuevo prestador */
router.get("/crearPrestador", gestionesController.nuevoPrestador);

router.post("/crearPrestador", gestionesController.guardarPrestador);

/* nuevo proveedor */
router.get("/crearProveedor", gestionesController.nuevoProveedor);

router.post("/crearProveedor", gestionesController.guardarProveedor);


/* vista de gestiones */
router.get("/" , gestionesController.vistaGestiones);




module.exports = router;
