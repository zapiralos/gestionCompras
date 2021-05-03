var express = require("express");
var router = express.Router();
var medicamentosController = require("../../controllers/api/medicamentosController");

//todos los medicamentos
router.get("/", medicamentosController.listado);

//medicamento por unidad
router.get("/:id", medicamentosController.detalleMedicamento);

module.exports = router;
