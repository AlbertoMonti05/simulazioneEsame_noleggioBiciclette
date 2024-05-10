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
});

// PRENDO I DATI
async function getDati()
{
    // chiamata al db
    let result = await richiesta("../services/getDatiCliente.php");

    return result;
}

// CARICO I DATI
async function caricaDati(dati)
{
    $("#nome").val(dati["nome"]);
    $("#cognome").val(dati["cognome"]);
    $("#mail").val(dati["mail"]);
    $("#username").val(dati["username"]);

    let indirizzo = getIndirizzo({indirizzo_id: dati["indirizzo_id"]});
    $("#indirizzo").val(indirizzo);
}

// PRENDO L'INDIRIZZO
async function getIndirizzo(params)
{
    // chiamata al db
    let result = await richiesta("../services/getIndirizzoCliente.php", params);

    alert(result);

    return result;
}