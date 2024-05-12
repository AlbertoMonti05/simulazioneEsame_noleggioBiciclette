// REGISTRAZIONE
async function doRegistrazione()
{
    // prendo i parametri
    let indirizzo = $("#indirizzo").val();

    // eseguo i controlli
    let stato = await doControlli(indirizzo);

    // controlli a buon fine
    if(stato == true)
        // richiestra di registrazione al db
        await callDB_registrazione({indirizzo: indirizzo});
    else
    {
        alert(stato);
        return;
    }
}

// RICHIESTA SERVIZIO
function richiesta(page, params)
{
    return new Promise(function(resolve)
    {
        $.get(page, params, function(phpData)
        {
            resolve(phpData);
        });
    });
}

// CONTROLLI SUI PARAMETRI IN INPUT
async function doControlli(indirizzo)
{
    // parametri mancanti
    if(indirizzo == "")
        return "ERRORE! Inserire l'indirizzo!";

    // tutto ok
    return true;
}

// CHIAMATA AL DB PER CONTROLLARE LA MAIL
async function callDB_registrazione(params)
{
    // chiamata al db
    let result = await richiesta("../../services/registrazione.php", params);

    if(result == "")
        result = true;

    // reindirizzo
    reindizzamento(result)
}

// REINDIRIZZAMENTO
function reindizzamento(isRegistred)
{
    // regitrazione effettuata
    if(isRegistred == true)
        window.location.href = "../login.php";
    else
        alert(isRegistred);
}