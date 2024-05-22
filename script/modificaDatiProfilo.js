// dati modificabili
let nome = "";
let cognome = "";
let mail = "";
let username = "";
//let indirizzo = "";

// PAGINA CARICATA
$(document).ready(async function()
{
    // prendo i dati del cliente
    let dati = await getDati();

    // carico i dati del cliente
    await caricaDati(dati);
});

// MODIFICA DATI DEL PROFILO
async function modificaDati()
{
    // modifico i dati nel database
    let stato = await richiestaJSON("../services/modificaDatiProfilo.php", {nome: nome, cognome: cognome, mail: mail, username: username/*, indirizzo: indirizzo*/});

    if(stato == true)
        alert("Dati modificati");
    else
        alert("Errore! Dati non modificati");
}

// CARICO I DATI
async function caricaDati(dati)
{
    $("#nome").val(dati["nome"]);
    $("#cognome").val(dati["cognome"]);
    $("#mail").val(dati["mail"]);
    $("#username").val(dati["username"]);
    //$("#indirizzo").val(dati["indirizzo"]);

    // prendo i dati attuali
    nome = $("#nome").val();
    cognome = $("#cognome").val();
    mail = $("#mail").val();
    username = $("#username").val();
    //indirizzo = $("#indirizzo").val();

    let indirizzo = await getIndirizzo({indirizzo_id: dati["indirizzo_id"]});
    $("#indirizzo").val(indirizzo);
    $("#indirizzo").attr("size", indirizzo.length);
}

// PRENDO I DATI
async function getDati()
{
    // chiamata al db
    let result = await richiestaJSON("../services/getDatiCliente.php");

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