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
    },

    guardadoGestion: async (req, res) => {
        
        let gestion = await Gestion.create({

            gsc: req.body.gsc,
            ap: req.body.ap,
            socio: req.body.socio,
            fecha: req.body.fecha,
            id_prestador: req.body.id_prestador,
            id_auditor: req.body.auditor,
            id_analista: req.body.analista,
            id_medicamento: req.body.id_medicamento,
            id_protesis: req.body.id_protesis,
            detalle: req.body.nota,
        })
        

        
        console.log(gestion);
    },
    
    guardadoPrestado: async (req, res) => {
        
        let prestador = await Prestador.create({

            nombre: req.body.nombre,
            apellido: req.body.apellido,
            matricula: req.body.matricula,
            num_prestador_osde: req.body.num_prestador_osde,
            rating: req.body.rating,
            especialidad: req.body.especialidad
        })
        

        
        console.log(gestion);
    },


    vista: async (req, res) => {

    } 


}

module.exports = gestionesController;