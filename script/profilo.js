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

// PAGINA CARICATA
$(document).ready(async function()
{
    // prendo i dati del cliente
    let dati = await getDati(/*{cliente_id: cliente_id}*/);

    // carico i dati del cliente
    await caricaDati(dati);
});

// PRENDO I DATI
async function getDati(/*params*/)
{
    // chiamata al db
    let result = await richiesta("../services/getDatiCliente.php"/*, params*/);

    alert(result);

    return result;
}

// CARICO I DATI
async function caricaDati(dati)
{
    $("#nome").val(dati["nome"]);
    $("#cognome").val(dati["cognome"]);
    $("#mail").val(dati["mail"]);
    $("#username").val(dati["username"]);
    $("#indirizzo").val(dati["indirizzo"]);
}