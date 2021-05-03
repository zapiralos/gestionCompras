let db = require("../database/models");
const fs = require("fs");
const path = require("path");
let {
    Compras,
    Auditor,
    Estado,
    Gestion,
    Medicamento,
    Prestador,
    Proveedor,
    Protesis,
    Dmedicamento
} = require("../database/models");



let gestionesController = {
    gestion: async (req, res) => {
        try {
            const dmedicamento = await Dmedicamento.findAll();
            const compras = await Compras.findAll();
            const auditor = await Auditor.findAll();
            const estado = await Estado.findAll();
            const proveedor = await Proveedor.findAll();
            const prestador = await Prestador.findAll();

            return res.render("crearGestion", {
                compras,
                auditor,
                estado,
                proveedor,
                prestador,
                dmedicamento,
            });
        } catch (error) {
            return res.send(error);
        }
    },

    nuevoPrestador: async (req, res) => {
        try {
            const prestador = await Prestador.findAll();
            return res.render("crearPrestador", { prestador });
        } catch (error) {
            return res.send(error);
        }
    },

    nuevoProveedor: async (req, res) => {
        try {
            const proveedor = await Proveedir.findAll();
            return res.render("crearProveedor", { proveedor });
        } catch (error) {
            return res.send(error);
        }
    },

    guardarPrestador: async (req, res) => {
        try {
            /* creador de prestador */
            let prestador = await Prestador.create({
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                matricula: req.body.matricula,
                num_prestador_osde: req.body.num_prestador_osde,
                rating: req.body.rating,
                especialidad: req.body.especialidad,
                cuil: req.body.cuil,
            });
            console.log(prestador);
        } catch (error) {
            return res.send(error);
        }
    },

    guardarProveedor: async (req, res) => {
        try {
            /* creador de prestador */
            let prestador = await Prestador.create({
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                matricula: req.body.matricula,
                num_prestador_osde: req.body.num_prestador_osde,
                rating: req.body.rating,
                especialidad: req.body.especialidad,
                cuil: req.body.cuil,
            });
            console.log(prestador);
        } catch (error) {
            return res.send(error);
        }
    },

    guardar_gestion: async (req, res) => {
        try {
            const prestador = await Prestador.findAll();
            /* creador de gestion */
            let gestion = await Gestion.create({
                gsc: req.body.gsc,
                ap: req.body.ap,
                socio: req.body.socio,
                fecha: req.body.fecha,
                id_prestador: req.body.prestador, //falta implemtar el select
                id_auditor: req.body.auditor,
                id_compras: req.body.compras,
                tipo_de_gestion: req.body.tipo_gestion,
                detalle: req.body.nota,
            });

            console.log("el radio de gestion es:" + req.body.tipo_gestion);

            switch (req.body.tipo_gestion) {
                /* en caso que el tipo_gestion sea 1 - se crea medicamento */
                /* en caso que el tipo_gestion sea 2 - se crea protesis */

                case "1":
                    let medicamento = await Medicamento.create({
                        gestion_id: gestion.id,
                        nom_med: req.body.nom_med,
                        nom_gen_med: req.body.nom_gen_med,
                        nom_med_ofr: req.body.nom_med_ofr,
                        valor_med: req.body.valor_med,
                        valor_prop: req.body.valor_prop,
                        valor_noacep: req.body.valor_noacep,
                        valor_prop_sinstock: req.body.valor_prop_sinstock,
                        cantidad: req.body.cantidad,
                        id_estado: req.body.estado,
                        autorizado: req.body.autorizado,
                    });
                    console.log(medicamento);

                    return res.redirect("/gestiones"); //vista de todas las gestiones
                    break;

                case "2":
                    /* creador de protesis */
                    let protesis = await Protesis.create({
                        gestion_id: gestion.id,
                        protesis: req.body.protesis,
                        gestion_proveedor: req.body.gestion_proveedor,
                        gestion_medico: req.body.gestion_medico,
                        gestion_prop_noaceptada:req.body.gestion_prop_noaceptada,
                        id_proveedor: req.body.proveedor,
                    });
                    console.log(protesis);

                    return res.redirect("/gestiones"); //vista de todas las gestiones
                    break;

                default:
                    return res.redirect("/gestiones"); //vista de todas las gestiones
            }
        } catch (error) {
            return res.send(error);
        }
    },

    vistaGestiones: async (req, res) => {
        try {
            const gestiones = await Gestion.findAll({
                include: [
                    { association: "prestador" },
                    { association: "compras" },
                    { association: "auditor" },
                    { association: "medicamentos" },
                    { association: "protesis" },
                ],
            });

            return res.render("listadoGestiones", {
                gestiones,
            });
        } catch (error) {
            return res.send(error);
        }
    },
};

module.exports = gestionesController;