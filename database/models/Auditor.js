module.exports = function(sequelize, dataTypes){


    let alias = "Auditor";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: dataTypes.STRING(100)
        },
        apellido: {
            type: dataTypes.STRING(100)
        }
    }

    let config = {
        tableName: "auditor",
        timestamps: false
    }

    let Auditor = sequelize.define(alias, cols, config);

    Auditor.associate = function(models) {
        //un auditor a varias gestiones
        Auditor.hasMany(models.Gestion, {
            as: "gestionesAuditor", 
            foreignKey: "id_auditor"
        });
    }
    
    return Auditor;
}