module.exports = function (sequelize, dataTypes) {
    let alias = "Dmedicamento";

    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true,
        },
        medicamento: {
            type: dataTypes.STRING(100),
        },
        presentacion: {
            type: dataTypes.STRING(100),
        },
        laboratorio: {
            type: dataTypes.STRING(100),
        },
        monodroga: {
            type: dataTypes.STRING(100),
        },
        accion: {
            type: dataTypes.STRING(100),
        },
        forma: {
            type: dataTypes.STRING(100),
        },
        potencia: {
            type: dataTypes.STRING(100),
        },
        tamanio: {
            type: dataTypes.STRING(100),
        },
        unidad: {
            type: dataTypes.STRING(100),
        },
        via: {
            type: dataTypes.STRING(100),
        },
        troquel: {
            type: dataTypes.INTEGER(11),
        },
        precio: {
            type: dataTypes.DOUBLE,
        },
    };

    let config = {
        tableName: "dmedicamentos",
        timestamps: false,
    };

    let Dmedicamento = sequelize.define(alias, cols, config);

    return Dmedicamento;
};
