var express = require("express");
var router = express.Router();
var prestadoresController = require("../../controllers/api/prestadoresController");


router.get("/", prestadoresController.listado);


module.exports = router;
