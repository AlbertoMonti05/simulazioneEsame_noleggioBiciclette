// DOCUMENTO PRONTO
$(document).ready(async function()
{
    // prendo il parcheggio
    let parcheggio = await getParcheggio();

    // visualizzo i posti liberi
    visualizza(parcheggio);
});

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

// FUNZIONE PER PRENDERE IL PARCHEGGIO TRAMITE LATITUDINE E LONGITUDINE
async function getParcheggio()
{
    // chiamata al db
    let result = await richiesta("../services/getParcheggioLatLon.php");

    return result;
}

// FUNZIONE PER VISUALIZZARE IL PARCHEGGIO
function visualizza(parcheggio)
{
    $("#h1").text("PARCHEGGIO VIA: " + parcheggio["via"]);

    $("#postiLiberi").text("POSTI LIBERI NEL PARCHEGGIO: " + parcheggio["postiLiberi"]);
}