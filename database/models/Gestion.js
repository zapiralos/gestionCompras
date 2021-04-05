module.exports = function(sequelize, dataTypes){


    let alias = "Gestion";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        gsc: {
            type: dataTypes.STRING(15)
        },
        ap: {
            type: dataTypes.STRING(15)
        },
        socio: {
            type: dataTypes.STRING(15)
        },
        id_medicamento: {
            type: dataTypes.INTEGER(11)
        },
        id_protesis: {
            type: dataTypes.INTEGER(11)
        },
        detalle: {
            type: dataTypes.STRING(999)
        },
        id_prestador: {
            type: dataTypes.INTEGER(11)
        },
        fecha: {
            type: dataTypes.DATE
        },
        id_analista: {
            type: dataTypes.INTEGER(11)
        },
        id_auditor: {
            type: dataTypes.INTEGER(11)
        }

    }
    let config = {
        tableName: "gestion",
        timestamps: false
    }

    let Gestion = sequelize.define(alias, cols, config);

    Gestion.associate = function(models) {
        //una gestión puede tener varios medicamentos
        Gestion.hasMany(models.Medicamento, {
            as: "medicamentos", 
            foreignKey: "id_medicamento"
        });
        //una gestión puede tener varias prótesis
        Gestion.hasMany(models.Protesis, {
            as: "protesis", 
            foreignKey: "id_protesis"
        });
        //una gestión a un prestador
        Gestion.belongsTo(models.Prestador, {
            as: "prestador",
            foreignKey: "id_prestador",
        });
        //una gestión a un auditor
        Gestion.belongsTo(models.Auditor, {
            as: "auditor", 
            foreignKey: "id_auditor"
        });
        //una gestión a un analista
        Gestion.belongsTo(models.Analista, {
            as: "analista", 
            foreignKey: "id_analista"
        });
    }

    return Gestion;
}