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
        //un estado de varias medicaciones
        Estado.hasMany(models.Medicamento, {
            as: "estadoMedicamentos", 
            foreignKey: "id_estado"
        });
        
    }

    return Estado;
}