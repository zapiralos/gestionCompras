module.exports = function(sequelize, dataTypes){


    let alias = "Medicamento";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        valor_med: {
            type: dataTypes.DECIMAL(10,2)
        },
        valor_prop: {
            type: dataTypes.DECIMAL(10,2)
        },
        valor_noacep: {
            type: dataTypes.DECIMAL(10,2)
        },
        valor_prop_sinstock: {
            type: dataTypes.DECIMAL(10,2)
        },
        cantidad: {
            type: dataTypes.INTEGER(11)
        },
        id_estado: {
            type: dataTypes.INTEGER(11)
        }
    }

    let config = {
        tableName: "medicamentos",
        timestamps: false
    }

    let Medicamento = sequelize.define(alias, cols, config);

    Medicamento.associate = function(models) {
        Medicamento.belongsTo(models.Gestion, {
            as: "gestionMed", 
            foreignKey: "id_medicamento"
        });
        Medicamento.hasMany(models.Estado, {
            as: "estados", 
            foreignKey: "id_estados"
        });
        
    }

    return Medicamento;
}