let {
    Compras,
    Auditor,
    Estado,
    Gestion,
    Medicamento,
    Prestador,
    Proveedor,
    Protesis,
    Dmedicamento,
} = require("../../database/models");

let prestadoresController = {
    
    listado: async (req, res) => {
        try {
            const prestador = await Prestador.findAll();

            return res.json(prestador);

        } catch (error) {
            return res.send(error);
        }
    },

    



};

module.exports = prestadoresController;