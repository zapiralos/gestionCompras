$(document).ready(function verificarCheck() {
    
    if (radio_medicamento.checked) {
        document.getElementById("check_med").style.display = "block";
    } else {
        document.getElementById("check_med").style.display = "none";
    }
    if (radio_protesis.checked) {
        document.getElementById("check_prot").style.display = "block";
    } else {
        document.getElementById("check_prot").style.display = "none";
    }
});
