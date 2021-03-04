module.exports = function(sequelize, dataTypes){


    let alias = "Analista";
    
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
        tableName: "analista",
        timestamps: false
    }

    let Analista = sequelize.define(alias, cols, config);

    Analista.associate = function(models) {
        Analista.belongsTo(models.Gestion, {
            as: "gestionAnalista", 
            foreignKey: "id_analista"
        });
    }
    
    return Analista;
}