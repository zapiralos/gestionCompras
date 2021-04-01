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

    medicamentos: async (req, res) => {

        const analista = await Analista.findAll();
        const auditor = await Auditor.findAll();
        const estado = await Estado.findAll();
        
        return res.render("crearMedicamento", { analista , auditor , estado  });
    },

    guardarMedicamento: async (req, res) => {
        try {
            /* creador de prestador */
            let prestador = await Prestador.create({

                nombre: req.body.nombre,
                apellido: req.body.apellido,
                matricula: req.body.matricula,
                num_prestador_osde: req.body.num_prestador_osde,
                rating: req.body.rating,
                especialidad: req.body.especialidad,
                cuil: req.body.cuil
                })
            console.log(prestador);
            
            /* creador de medicamentos */
            let medicamento = await Medicamento.create({
                
                nom_med: req.body.nom_med, 
                nom_gen_med: req.body.nom_gen_med,
                nom_med_ofr: req.body.nom_med_ofr, 
                valor_med: req.body.valor_med,
                valor_prop: req.body.valor_prop,
                valor_noacep: req.body.valor_noacep,
                valor_prop_sinstock: req.body.valor_prop_sinstock,
                cantidad: req.body.cantidad,
                id_estado: req.body.estado,
                autorizado: req.body.autorizado
                })
            console.log(medicamento);

            
            /* creador de gestiones */
            let gestion = await Gestion.create({

                gsc: req.body.gsc,
                ap: req.body.ap,
                socio: req.body.socio,
                fecha: req.body.fecha,
                id_prestador: prestador.id,
                id_auditor: req.body.auditor,
                id_analista: req.body.analista,
                id_medicamento: medicamento.id,
                detalle: req.body.nota,
                })
                
            console.log(gestion);

            } catch (error) {
                return res.send(error);
            }
        
            res.redirect("/");
    },

    protesis: async (req, res) => {

        const analista = await Analista.findAll();
        const auditor = await Auditor.findAll();
        const proveedor = await Proveedor.findAll();
        
        return res.render("crearProtesis", { analista , auditor , proveedor });
     },


     guardarProtesis: async (req, res) => {
        try {
            /* creador de prestador */
            let prestador = await Prestador.create({
                
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                matricula: req.body.matricula,
                num_prestador_osde: req.body.num_prestador_osde,
                rating: req.body.rating,
                especialidad: req.body.especialidad,
                cuil: req.body.cuil
                })
            console.log(prestador);
            
            /* creador de proveedor */
            let proveedor = await Proveedor.create({
                
                nombre: req.body.nom_proveedor,
                telefono: req.body.telefono,
                email: req.body.email
                })
            console.log(proveedor);

            /* creador de protesis */
            let protesis = await Protesis.create({
                
                protesis: req.body.protesis,
                gestion_proveedor: req.body.proveedor,
                gestion_medico: req.body.medico,
                gestion_prop_noaceptada: req.body.noaceptada,
                id_proveedor: proveedor.id
                })
            console.log(protesis);

            /* creador de gestiones */
            let gestion = await Gestion.create({

                gsc: req.body.gsc,
                ap: req.body.ap,
                socio: req.body.socio,
                fecha: req.body.fecha,
                id_prestador: prestador.id,
                id_auditor: req.body.auditor,
                id_analista: req.body.analista,
                id_protesis: protesis.id,
                detalle: req.body.nota,
                })
                
            console.log(gestion);

            } catch (error) {
                return res.send(error);
            }
        
            res.redirect("/");
    }, 
    






    vista: async (req, res) => {
        // try {
        //     const gestion = await Gestion.findBypk(req.params.id, {
        //         include: [
        //             { association: "medicamentos"}, 
        //             { association: "protesis"},
        //             { association: "prestadores"},
        //             { association: "auditor"},
        //             { association: "analista"}
        //         ]
        //     })
        // } catch (error) {
        //     return res.send(error);
        // }
    } 


}

module.exports = gestionesController;