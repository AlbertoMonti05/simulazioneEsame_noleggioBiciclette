let nome = null;
let cognome = null;
let username = null;
let mail = null;
let password = null;
let indirizzo = null;
let nomeTitolareCarta = null;
let cognomeTitolareCarta = null;
let numeroCarta = null;
let scadenzaCarta = null;
let cvvCarta = null;

// REGISTRAZIONE
async function doRegistrazione()
{
    // prendo i parametri
    nomeTitolareCarta = $("#nomeTitolareCarta").val();
    cognomeTitolareCarta = $("#cognomeTitolareCarta").val();
    numeroCarta = $("#numeroCarta").val();
    scadenzaCarta = $("#scadenzaCarta").val();
    cvvCarta = $("#cvvCarta").val();

    // eseguo i controlli
    let stato = await doControlli();

    // controlli a buon fine
    if(stato == true)
    {
        // prendo i dati 
        let params = getDati();

        // richiestra di registrazione al db
        await callDB_registrazione(params);
    }
    else
    {
        alert(stato);
        return;
    }
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
    if(nomeTitolareCarta == "" || cognomeTitolareCarta == "" || numeroCarta == "" || scadenzaCarta == "" || cvvCarta == "")
        return "ERRORE! Inserire i dati richiesti!";

    // tutto ok
    return true;
}

// FUNZIONE PER PRENDERE I DATI
function getDati()
{
    nome = localStorage.getItem('nome');
    cognome = localStorage.getItem('cognome');
    username = localStorage.getItem('username');
    mail = localStorage.getItem('mail');
    password = localStorage.getItem('password');
    indirizzo = localStorage.getItem('indirizzo');

    return {nome: nome, cognome: cognome, username:username,mail:mail,password:password,indirizzo:indirizzo,nomeTitolareCarta:nomeTitolareCarta,cognomeTitolareCarta:cognomeTitolareCarta,numeroCarta:numeroCarta,scadenzaCarta:scadenzaCarta,cvvCarta,cvvCarta}
}

// CHIAMATA AL DB PER FARE LA REGISTRAZIONE
async function callDB_registrazione(params)
{
    // chiamata al db
    let result = await richiesta("../../services/registrazione.php", params);

    if(result == "")
        result = true;

    // reindirizzo
    reindizzamento(result)
}

// REINDIRIZZAMENTO
function reindizzamento(stato)
{
    // registrazione ok
    if(stato == true)
    {
        // reindirizzo
        window.location.href = "../login.php";
    }
    else
        alert(stato);
}