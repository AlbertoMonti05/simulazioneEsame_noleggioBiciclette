// DOCUMENTO PRONTO
$(document).ready(function()
{
    // inserisco la mappa
    generaMappa();
});

// mappa
let mappa = null;

// FUNZIONE PER GENERARE LA MAPPA
async function generaMappa()
{
    // posizione iniziale della mappa
    var posIniziale = [45.468242296531756, 9.180818901720453]; // Esempio: MILANO

    // creo una nuova istanza di mappa Leaflet
    mappa = L.map('map-container').setView(posIniziale, 10); // 10 è il livello di zoom iniziale

    // aggiungo un layer di mappa
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Mappa fornita da <a href="https://www.openstreetmap.org/">OpenStreetMap</a>'
    }).addTo(mappa);

    // prendo tutti i parcheggi delle biciclette
    let parcheggi = await getParcheggi();

    // aggiungo i marker dei posteggi alla mappa
    aggiungiParcheggi(parcheggi);
}

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

// FUNZIONE PER PRENDERE I PARCHEGGI
async function getParcheggi()
{
    // chiamata al db
    let result = await richiesta("../services/getParcheggi.php");

    return result;
}

// FUNZIONE PER AGGIUNGERE I PARCHEGGI NELLA MAPPA
function aggiungiParcheggi(parcheggi)
{
    // per ogni parcheggio
    parcheggi.forEach(parcheggio => {
        // aggiungo il marker nella mappa
        aggiungiParcheggio(parcheggio);
    });
}

// FUNZIONE PER AGGIUNGERE IL MARKER DI UN PARCHEGGIO NELLA MAPPA
function aggiungiParcheggio(parcheggio)
{
    L.marker([parcheggio["latitudine"], parcheggio["longitudine"]]).addTo(mappa);
}