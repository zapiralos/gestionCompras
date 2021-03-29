module.exports = function(sequelize, dataTypes){


    let alias = "Prestador";
    
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
        },
        matricula:{
            type: dataTypes.INTEGER(11)
        },
        num_prestador_osde: {
            type: dataTypes.INTEGER(11)
        },
        rating: {
            type: dataTypes.DECIMAL(3,1)
        },
        especialidad: {
            type: dataTypes.STRING(15)
        },
        cuil: {
            type: dataTypes.INTEGER(11)
        }
    }

    let config = {
        tableName: "prestador",
        timestamps: false
    }

    let Prestador = sequelize.define(alias, cols, config);

    Prestador.associate = function(models) {
        Prestador.belongsTo(models.Gestion, {
            as: "gestionPrestador", 
            foreignKey: "id_prestador"
        });
    }    

    return Prestador;
}