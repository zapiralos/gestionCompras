module.exports = function(sequelize, dataTypes){


    let alias = "Protesis";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        gestion_proveedor: {
            type: dataTypes.DECIMAL(10,2)
        },
        gestion_medico: {
            type: dataTypes.DECIMAL(10,2)
        },
        gestion_prop_noaceptada: {
            type: dataTypes.DECIMAL(10,2)
        },
        id_proveedor: {
            type: dataTypes.INTEGER(11)
        }
    }

    let config = {
        tableName: "protesis",
        timestamps: false
    }

    let Protesis = sequelize.define(alias, cols, config);

    Protesis.associate = function(models) {
        Protesis.belongsTo(models.Gestion, {
            as: "gestionPro", 
            foreignKey: "id_protesis"
        });
        Protesis.hasMany(models.Proveedor, {
            as: "proveedores", 
            foreignKey: "id_proveedor"
        });
    }

    return Protesis;
}