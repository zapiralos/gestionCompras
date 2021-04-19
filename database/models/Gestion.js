module.exports = function(sequelize, dataTypes){


    let alias = "Gestion";
    
    let cols = {
        id: {
            type: dataTypes.INTEGER(11),
            primaryKey: true,
            autoIncrement: true
        },
        gsc: {
            type: dataTypes.STRING(15)
        },
        ap: {
            type: dataTypes.STRING(15)
        },
        socio: {
            type: dataTypes.STRING(15)
        },
        tipo_de_gestion: {
            type: dataTypes.INTEGER(11)
        },
        detalle: {
            type: dataTypes.STRING(999)
        },
        id_prestador: {
            type: dataTypes.INTEGER(11)
        },
        fecha: {
            type: dataTypes.DATE
        },
        id_analista: {
            type: dataTypes.INTEGER(11)
        },
        id_auditor: {
            type: dataTypes.INTEGER(11)
        }

    }
    let config = {
        tableName: "gestion",
        timestamps: false
    }

    let Gestion = sequelize.define(alias, cols, config);

    Gestion.associate = function(models) {
        //una gestión a un prestador
        Gestion.belongsTo(models.Prestador, {
            as: "prestador",
            foreignKey: "id_prestador",
        });
        //una gestión a un auditor
        Gestion.belongsTo(models.Auditor, {
            as: "auditor",
            foreignKey: "id_auditor",
        });
        //una gestión a un analista
        Gestion.belongsTo(models.Analista, {
            as: "analista",
            foreignKey: "id_analista",
        });
        //una gestion - muchas medicamentos
        Gestion.hasMany(models.Medicamento, {
            as: "medicamentos",
            foreignKey: "gestion_id",
            onDelete: "cascade",
        });
        //una gestion - muchas protesis
        Gestion.hasMany(models.Protesis, {
            as: "protesis",
            foreignKey: "gestion_id",
            onDelete: "cascade",
        })
    }

    return Gestion;
}