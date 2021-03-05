let db = require("../database/models");
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

    //crear: async (req, res) => {

    //    const analista = await Analista.findAll();
    //    const auditor = await Auditor.findAll();
    //    const estado = await Estado.findAll();
    //    const proveedor = await Proveedor.findAll();

    //    return res.render("formularioDeCarga", { analista, auditor, estado, proveedor });
    //}

    crear: function (req, res) {
        db.Gestion.findAll()
            .then(function(gestion){
                return res.render("crearGestion", {gestion:gestion});
            })
    }

}

module.exports = gestionesController;