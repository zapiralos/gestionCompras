module.exports = function(sequelize, dataTypes){


    let alias = "Compras";
    
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
        tableName: "compras",
        timestamps: false
    }

    let Compras = sequelize.define(alias, cols, config);

    Compras.associate = function(models) {
        Compras.hasMany(models.Gestion, {
            as: "gestionesCompras", 
            foreignKey: "id_compras"
        });
    }
    
    return Compras;
}