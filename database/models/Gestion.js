module.exports = function(sequelize, dataTypes){


    let alias = "Gestion";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        gsc: {
            type: dataTypes.INTEGER(11)
        },
        ap: {
            type: dataTypes.INTEGER(11)
        },
        socio: {
            type: dataTypes.INTEGER(11)
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
        Gestion.hasMany(models.Medicamento, {
            as: "medicamentos", 
            foreignKey: "id_medicamento"
        });
        Gestion.hasMany(models.Protesis, {
            as: "protesis", 
            foreignKey: "id_protesis"
        });
        Gestion.hasMany(models.Prestador, {
            as: "prestadores", 
            foreignKey: "id_prestador"
        });
        Gestion.hasMany(models.Auditor, {
            as: "auditores", 
            foreignKey: "id_auditor"
        });
        Gestion.hasMany(models.Analista, {
            as: "analistas", 
            foreignKey: "id_analista"
        });
    }

    return Gestion;
}