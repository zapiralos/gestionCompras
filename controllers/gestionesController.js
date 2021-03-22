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

    crear: async (req, res) => {

       const analista = await Analista.findAll();
       const auditor = await Auditor.findAll();
       
       return res.render("crearGestion", { analista , auditor });
    }

    // crear: function (req, res) {
    //     db.Gestion.findAll()
    //     db.Analista.findAll()
    //     db.Auditor.findAll()
    //         .then(function(gestion){
    //             return res.render("crearGestion", {gestion});
    //         })
    // }

}

module.exports = gestionesController;