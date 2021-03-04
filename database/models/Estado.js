module.exports = function(sequelize, dataTypes){


    let alias = "Estado";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        estado: {
            type: dataTypes.STRING(100)
        }
    }

    let config = {
        tableName: "estado",
        timestamps: false
    }

    let Estado = sequelize.define(alias, cols, config);

    Estado.associate = function(models) {
        Estado.belongsTo(models.Gestion, {
            as: "gestionEstado", 
            foreignKey: "id_estado"
        });
    }

    return Estado;
}