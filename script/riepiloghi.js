// PAGINA CARICATA
$(document).ready(async function()
{
    // prendo il riepilogo totale delle tratte del cliente
    let riepilogoTotale = await getRiepilogoTotaleCliente();

    // visualizzo il riepilogo totale delle tratte
    visualizzaRiepilogo(riepilogoTotale);

    // prendo tutte le tratte del cliente
    let tratte = await getTratte();

    // visualizzo le tratte tratte del cliente
    visualizzaTratte(tratte);
});

// PRENDO IL RIEPILOGO TOTALE DELLE TRATTE
async function getRiepilogoTotaleCliente()
{
    // chiamata al db
    let tratte = await richiestaJSON("../services/getRiepilogoTotaleCliente.php");

    return tratte;
}

// PRENDO LE TRATTE
async function getTratte()
{
    // chiamata al db
    let tratte = await richiestaJSON("../services/getTratteCliente.php");

    return tratte;
}

// VISUALIZZO LE TRATTE
async function visualizzaTratte(tratte)
{
    tratte.forEach(tratta => {
        visualizzaTratta(tratta);
    });
}

// FUNZIONE PER VISUALIZZARE IL RIEPILOGO TOTALE
async function visualizzaRiepilogo(riepilogoTotale)
{
    // inserisco dato nell'elemento
    $("#numeroTratteTotali").val(riepilogoTotale["numeroTratte"]);
    $("#chilometriTotali").val(riepilogoTotale["km_percorsi"]);
    $("#spesaTotale").val(riepilogoTotale["tariffa"]);
}

// FUNZIONE PER VISUALIZZARE UNA TRATTA
async function visualizzaTratta(tratta)
{
    // creo il div
    let div = $("<div></div>")

    // elemento per il tipo
    let tipo = $("<input type='text' readonly='readonly'>")
    tipo.val(tratta["tipo"]);
    div.append("tipo: ");
    div.append(tipo);
    div.append("<br>");

    // elemento per la data_ora
    let data_ora = $("<input type='text' readonly='readonly'>")
    data_ora.val(tratta["data_ora"]);
    div.append("data e ora: ");
    div.append(data_ora);
    div.append("<br>");

    // se è una riconsegna
    if(tratta["tipo"] == "riconsegna")
    {
        // elemento per i km fatti
        let km_percorsi = $("<input type='text' readonly='readonly'>")
        km_percorsi.val(tratta["km_percorsi"]);
        div.append("km percorsi: ");
        div.append(km_percorsi);
        div.append("<br>");

        // elemento per la tariffa
        let tariffa = $("<input type='text' readonly='readonly'>")
        tariffa.val(tratta["tariffa"]);
        div.append("tariffa: ");
        div.append(tariffa);
        div.append("<br>");
    }
    
    // elemento per la stazione
    let stazione = $("<input type='text' readonly='readonly'>")
    // prendo via stazione
    let datiStazione = await richiestaJSON("../services/getStazioni.php", {stazione_id: tratta["stazione_id"]});
    stazione.val(datiStazione[0]["via"]);
    div.append("stazione: ");
    div.append(stazione);
    div.append("<br>");


    $("#trattaPerTratta").append(div);
    $("#trattaPerTratta").append($("<br>"));
}