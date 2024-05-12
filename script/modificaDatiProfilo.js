// dati modificabili
let nome = "";
let cognome = "";
let mail = "";
let username = "";

// RICHIESTA SERVIZIO
function richiesta(page, params)
{
    return new Promise(function(resolve)
    {
        $.get(page, params, function(phpData)
        {
            resolve(phpData);
        }, "json");
    });
}

// PAGINA CARICATA
$(document).ready(async function()
{
    // prendo i dati del cliente
    let dati = await getDati();

    // carico i dati del cliente
    await caricaDati(dati);

    // prendo i dati attuali
    nome = $("#nome").val();
    cognome = $("#cognome").val();
    mail = $("#mail").val();
    username = $("#username").val();
});

// MODIFICA DATI DEL PROFILO
async function modificaDati()
{
    // modifico i dati nel database
    let stato = await richiesta("../services/modificaDatiProfilo.php", {nome: nome, cognome: cognome, mail: mail, username: username});

    if(stato == true)
        alert("Dati modificati");
    else
        alert("Errore! Dati non modificati");
}

// PRENDO I DATI
async function getDati()
{
    // chiamata al db
    let result = await richiesta("../services/getDatiCliente.php");

    return result;
}

// PRENDO LA MODIFICA DEL NOME
function modificaNome()
{
    nome = $("#nome").val();
}

// PRENDO LA MODIFICA DEL COGNOME
function modificaCognome()
{
    cognome = $("#cognome").val();
}

// PRENDO LA MODIFICA DELLA MAIL
function modificaMail()
{
    mail = $("#mail").val();
}

// PRENDO LA MODIFICA DELL'USERNAME
function modificaUsername()
{
    username = $("#username").val();
}