// MODIFICA DATI DEL PROFILO
async function modificaDati()
{
    // prendo i dati
    let params = getDatiModificati();

    // modifico i dati nel database
    let stato = await richiesta("../services/modificaDatiProfilo.php", params);

    alert(stato);

    if(stato == true)
        alert("Dati modificati");
    else
        alert("Errore! Dati non modificati");
}

// PRENDO I DATI MODIFICATI
function getDatiModificati()
{
    let par_nome = $("#nome").val();
    let par_cognome = $("#cognome").val();
    let par_mail = $("#mail").val();
    let par_username = $("#username").val();
    //let par_indirizzo = $("#indirizzo").val();

    return {nome: par_nome, cognome:par_cognome, mail:par_mail, username:par_username/*, indirizzo:par_indirizzo*/};
}