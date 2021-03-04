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
        Auditor.belongsTo(models.Gestion, {
            as: "gestionAuditor", 
            foreignKey: "id_auditor"
        });
    }
    
    return Auditor;
}