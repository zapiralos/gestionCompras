module.exports = function(sequelize, dataTypes){


    let alias = "Proveedor";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        nombre: {
            type: dataTypes.STRING(100)
        }
    }

    let config = {
        tableName: "proveedor",
        timestamps: false
    }

    let Proveedor = sequelize.define(alias, cols, config);

    Proveedor.associate = function(models) {
        Proveedor.belongsTo(models.Protesis, {
            as: "protesisProv", 
            foreignKey: "id_proveedor"
        });

    }
    
    return Proveedor;
}