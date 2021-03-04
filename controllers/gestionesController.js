const fs = require("fs");
const path = require("path");
let {
    Analista,
    Auditor,
    Estado,
    Gestion,
    Medicamento,
    Prestador,
    Proveedor,
    Protesis
} = require("../database/models");

let gestionesController = {

    crear: async (req, res) => {

        const analista = await Analista.findAll();
        const auditor = await Auditor.findAll();
        const estado = await Estado.findAll();
        const proveedor = await Proveedor.findAll();

        return res.render("formularioDeCarga", { analista, auditor, estado, proveedor });
    }

}

module.exports = gestionesController;