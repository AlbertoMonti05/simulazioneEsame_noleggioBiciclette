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
    let posIniziale = [45.468242296531756, 9.180818901720453]; // Esempio: MILANO

    // creo una nuova istanza di mappa Leaflet
    mappa = L.map('map-container').setView(posIniziale, 10); // 10 è il livello di zoom iniziale

    // aggiungo un layer di mappa
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Mappa fornita da <a href="https://www.openstreetmap.org/">OpenStreetMap</a>'
    }).addTo(mappa);

/*
    // geosearch options
    let options = {
        key: 'oc_gs_SJqvrAWtCs2mcAvMs5f9yPs6LI1QcD',
        // you will need to become a customer to get a geosearch key

        position: 'topright',
        // see possible values: https://leafletjs.com/reference.html#control-position, default is 'topright'

        // placeholder: 'Type here to search for places', default is 'Search for places'

        // defaultZoomLevel: 10, // zoom level, default is 13

        // customMarkerOptions: {}, // Optional Leaflet Marker Options https://leafletjs.com/reference.html#marker-option
    };

    // add geosearch to the map
    let geosearchControl = L.Control.openCageGeosearch(options).addTo(map);
*/

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
    let result = await richiesta("http://localhost:5000/getStazioni");

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
    // marker
    let marker = L.marker([parcheggio["latitudine"], parcheggio["longitudine"]]).addTo(mappa);

    // popup
    let popupContent = `
        <b>Parcheggio ${parcheggio["via"]}</b><br>
        Posti liberi: ${parcheggio["postiLiberi"]}<br>
        <a href="../pages/parcheggio.php?latitudine=${parcheggio["latitudine"]}&longitudine=${parcheggio["longitudine"]}">Visualizza Dettagli</a>
    `;

    // Aggiungi il popup al marker
    marker.bindPopup(popupContent);

    // alla selezione del marker
    marker.on('click', function(e) {
        // Mostra il popup
        marker.openPopup();
    });
}