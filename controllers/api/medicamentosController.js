let {
    Dmedicamento,
} = require("../../database/models");

let medicamentosController = {
    listado: async (req, res) => {
        try {
            const medicamentos = await Dmedicamento.findAll();

            const plainMedicamentos = medicamentos.map((medicamento)=>{
                
                return {
                    id: medicamento.id,
                    medicamento: medicamento.medicamento,
                    presentacion: medicamento.presentacion,
                    laboratorio: medicamento.laboratorio,
                    monodroga: medicamento.monodroga,
                    accion: medicamento.accion,
                    forma: medicamento.forma,
                    potencia: medicamento.potencia,
                    tamaño: medicamento.tamanio,
                    unidad: medicamento.unidad,
                    via: medicamento.via,
                    troquel: medicamento.troquel,
                    precio: medicamento.precio
                };
                
            })

            return res.send({
                medicamentos: plainMedicamentos
            });

        } catch (error) {
            return res.send(error);
        }
    },

    detalleMedicamento: async (req,res) => {
        try {
            const medicamento = await Dmedicamento.findByPk(req.params.id);

            if (!medicamento) {
                return res
                    .status(404)
                    .json({ msg: "No se encontro el medicamento" });
            }

            const plainMedicamento = {
                id: medicamento.id,
                medicamento: medicamento.medicamento,
                presentacion: medicamento.presentacion,
                laboratorio: medicamento.laboratorio,
                monodroga: medicamento.monodroga,
                accion: medicamento.accion,
                forma: medicamento.forma,
                potencia: medicamento.potencia,
                tamaño: medicamento.tamanio,
                unidad: medicamento.unidad,
                via: medicamento.via,
                troquel: medicamento.troquel,
                precio: medicamento.precio,
            };

            return res.send(plainMedicamento);
        
        } catch (error) {
            return res.status(500).json({ error:true });
        }
    }
        

};

module.exports = medicamentosController;
