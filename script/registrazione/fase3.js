let nome = null;
let cognome = null;
let username = null;
let mail = null;
let password = null;

// DOCUMENTO CARICATO
$(document).ready(function()
{
    // controllo i dati della fase precedente
    getDatiFasePrecedente();

    // fase 2 non fatta
    if(username == null || username == null || password == null)
        // reindirizzamento alla fase 2
        window.location.href = "fase2.php";
    else
        // inserisco i dati della fase 2 nella pagina
        visualizzaDati();

});

// FUNZIONE PER PRENDERE I DATI DELLA FASE PRECEDENTE
function getDatiFasePrecedente()
{
    nome = localStorage.getItem('nome');
    cognome = localStorage.getItem('cognome');
    username = localStorage.getItem('username');
    mail = localStorage.getItem('mail');
    password = localStorage.getItem('password');
}

// FUNZIONE PER INSERIRE I DATI DELLA FASE PRECEDENTE NELLA PAGINA
function visualizzaDati()
{
    $("#nome").text("nome: " + nome);
    $("#cognome").text("cognome: " + cognome);
    $("#username").text("username: " + username);
    $("#mail").text("mail: " + mail);
}

let indirizzo = null;

// PROCEDO CON LA REGISTRAZIONE
async function avanti()
{
    // prendo i parametri
    indirizzo = $("#indirizzo").val();

    // eseguo i controlli
    let stato = await doControlli();

    reindizzamento(stato);
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
async function doControlli()
{
    // parametri mancanti
    if(indirizzo == "")
        return "ERRORE! Inserire l'indirizzo!";

    // tutto ok
    return true;
}

// REINDIRIZZAMENTO
function reindizzamento(stato)
{
    // controlli ok
    if(stato == true)
    {
        // salvo dati
        salvaDati();

        // reindirizzo
        window.location.href = "fase4.php";
    }
    else
        alert(stato);
}

// FUNZIONE PER SALVARE I DATI DELLA FASE
function salvaDati()
{
    localStorage.setItem('indirizzo', indirizzo);
}