// REGISTRAZIONE
async function avanti()
{
    // prendo i parametri
    let nome = $("#nome").val();
    let cognome = $("#cognome").val();

    // eseguo i controlli
    let stato = await doControlli(nome, cognome);

    // reindirizzo
    reindizzamento(stato);
}

// CONTROLLI SUI PARAMETRI IN INPUT
async function doControlli(nome, cognome)
{
    // parametri mancanti
    if(nome == "" || cognome == "")
        return "ERRORE! Inserire tutti i campi!";

    // tutto ok
    return true;
}

// REINDIRIZZAMENTO
function reindizzamento(stato)
{
    // controlli ok
    if(stato == true)
        window.location.href = "../registrazione/fase2.php";
    else
        alert(stato);
}