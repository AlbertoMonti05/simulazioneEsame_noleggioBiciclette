// REGISTRAZIONE
function doRegistrazione()
{
    // prendo i parametri
    let nome = $("#nome").val();
    let cognome = $("#cognome").val();
    let username = $("#username").val();
    let mail = $("#mail").val();
    let password = $("#password").val();
    let confermaPassword = $("#confermaPassword").val();

    // eseguo i controlli
    let stato = doControlli(nome, cognome, username, mail, password, confermaPassword);

    // controlli a buon fine
    if(stato == true)
        // richiestra di registrazione al db
        callDB_registrazione({nome: nome, cognome: cognome, username: username, mail: mail, password: password});
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
async function doControlli(nome, cognome, username, mail, password, confermaPassword)
{
    // parametri mancanti
    if(nome == "" || cognome == "" || username == "" || mail == "" || password == "" || confermaPassword == "")
        return "ERRORE! Inserire mail e password!";

    // password non corrispondono
    if(password != confermaPassword)
        return "ERRORE! Le password non corrispondono!";





        

    //https://stackoverflow.com/questions/48708449/promise-pending-why-is-it-still-pending-how-can-i-fix-this







    // username già utilizzato
    let usernameUsed = await callDB_checkUsername({username: username});
    if(usernameUsed == true)
        return "ERRORE! Username già associato ad un altro account!";

    // mail già utilizzata
    let mailUsed = await callDB_checkMail({mail: mail});
    if(mailUsed == true)
        return "ERRORE! Mail già associata ad un altro account! Esegui la login!";

    // tutto ok
    return true;
}

// CHIAMATA AL DB PER CONTROLLARE L'USERNAME
async function callDB_checkUsername(params)
{
    // chiamata al db
    let result = await richiesta("../services/checkUsername.php", params);

    if(result == 1)
        return true;

    return false;
}

// CHIAMATA AL DB PER CONTROLLARE LA MAIL
async function callDB_checkMail(params)
{
    // chiamata al db
    let result = await richiesta("../services/checkMail.php", params);

    if(result == 1)
        return true;

    return false;
}

// CHIAMATA AL DB PER LA REGISTRAZIONE
async function callDB_registrazione(params)
{
    // chiamata al db
    let result = await richiesta("../services/registrazione.php", params);

    // reindirizzo l'utente
    reindizzamento(result);
}

// REINDIRIZZAMENTO
function reindizzamento(isRegistred)
{
    // registrazione corretta
    if(isRegistred == true)
        window.location.href = "../pages/login.php";
    else
        alert("ERRORE! Registrazione non andata a buon fine!");
}