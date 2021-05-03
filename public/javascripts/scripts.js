const url = ""
const contenedor = document.querySelector("tbody")
let resultado =""
const formularioPrestadores = document.querySelector("form")
const inputPrestador = document.querySelector("prest_seleccionado")



$(document).ready(function () {
    
    var tabla_prestador = $("#tabla_prestadores").DataTable({
        select: true,
        select: {
            styke: "single",
        },
        displayLength: 5,
        language: {
            lengthMenu: "Mostrar _MENU_ registros",
            zeroRecords: "No se encontraron resultados",
            info:
                "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            infoEmpty:
                "Mostrando registros del 0 al 0 de un total de 0 registros",
            infoFiltered: "(filtrado de un total de _MAX_ registros)",
            sSearch: "Buscar:",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior",
            },
            sProcessing: "Procesando...",
        },
    });

    tabla_prestador.on("select", function (e, dt, type, indexes) {
        if (type === "row") {
            data = tabla_prestador.rows(indexes).data();
        }
        console.log(data[0])
    
    inputPrestador.innerHTML = data[0]

    });



    var tabla_medicamento = $("#tabla_medicamentos").DataTable({
        select: true,
        select: {
            styke: "single",
        },
        displayLength: 5,
        language: {
            lengthMenu: "Mostrar _MENU_ registros",
            zeroRecords: "No se encontraron resultados",
            info:
                "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            infoEmpty:
                "Mostrando registros del 0 al 0 de un total de 0 registros",
            infoFiltered: "(filtrado de un total de _MAX_ registros)",
            sSearch: "Buscar:",
            oPaginate: {
                sFirst: "Primero",
                sLast: "Último",
                sNext: "Siguiente",
                sPrevious: "Anterior",
            },
            sProcessing: "Procesando...",
        },
        fixedColumns:true,
        //extension scroller
        deferRender: true,
        scroller: true,
        scrollCollapse: true,
        scrollY: 400,
        scrollX: true,
    });

        tabla_medicamento.on("select", function (e, dt, type, indexes) {
            if (type === "row") {
                var data = tabla_medicamento.rows(indexes).data();
            }
            console.log(data[0]);

            console.log(data[0][1]);
        });
});

document.getElementById("sel_pretador").onclick = (e) => {
    document.getElementById("prest_seleccionado").placeholder = data[0][1];
};