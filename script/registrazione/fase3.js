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
        // reindirizzamento
        window.location.href = "fase2.php";
    else
        // inserisco i dati  nella pagina
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

    if(stato == true)
    {
        let coordinate = getLatLonFromAddress(indirizzo);
    }

    reindizzamento(stato);
}

// FUNZIONE PER PRENDERE LATITUDINE E LONGITUDINE DALL'INDIRIZZO INSERIT
function getLatLonFromAddress()
{
    indirizzo = $("#indirizzo").val();

    let api_key = '3364281cf8284978864b8b201baeccdb';

    // forward geocoding example (address to coordinate)
    //let query = 'Philipsbornstr. 2, 30165 Hannover, Germany';
    // note: query needs to be URI encoded (see below)

    let query = indirizzo;

    let api_url = 'https://api.opencagedata.com/geocode/v1/json'

    let request_url = api_url
        + '?'
        + 'key=' + api_key
        + '&q=' + encodeURIComponent(query)
        + '&pretty=1'
        + '&no_annotations=1';

    // see full list of required and optional parameters:
    // https://opencagedata.com/api#required-params

    let request = new XMLHttpRequest();
    request.open('GET', request_url, true);

    request.onload = function() {
        // see full list of possible response codes:
        // https://opencagedata.com/api#codes

        if (request.status === 200)
        {
            // Success!
            let data = JSON.parse(request.responseText);
            alert("lat: " + data.results[0].geometry.lat + " -- lon: " + data.results[0].geometry.lng); // print the location
        }
        else if (request.status <= 500)
        {
            // We reached our target server, but it returned an error
            console.log("unable to geocode! Response code: " + request.status);
            let data = JSON.parse(request.responseText);
            console.log('error msg: ' + data.status.message);
        } 
        else 
            console.log("server error");
    };

    request.onerror = function() {
        // There was a connection error of some sort
        console.log("unable to connect to server");
    };

    request.send();  // make the request
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