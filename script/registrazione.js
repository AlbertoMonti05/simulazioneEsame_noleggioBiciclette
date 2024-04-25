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
    if(stato)
    {
        // richiestra di registrazione al db
        callDB_registrazione({nome: nome, cognome: cognome, username: username, mail: mail, password: password});
    }
    else
    {
        alert(stato);
        return;
    }
}

// CONTROLLI SUI PARAMETRI IN INPUT
function doControlli(nome, cognome, username, mail, password, confermaPassword)
{
    // parametri mancanti
    if(nome == "" || cognome == "" || username == "" || mail == "" || password == "" || confermaPassword == "")
        return "ERRORE! Inserire mail e password!";

    // password non corrispondono
    if(password != confermaPassword)
        return "ERRORE! Le password non corrispondono!";

    // username già utilizzato
    if(callDB_checkUsername({username: username}))
        return "ERRORE! Username già in uso da un altro utente!";

    // mail già utilizzata
    if(callDB_checkMail({mail: mail}))
        return "ERRORE! Mail già associata ad un account! Esegui la login!";

    // tutto ok
    return true;
}

// CHIAMATA AL DB PER CONTROLLARE LA MAIL
function callDB_checkMail(params)
{
    // chiamata al db
    $.get("../services/checkMail.php",params,function(isUsed)
    {
        return isUsed;
    });
}

// CHIAMATA AL DB PER CONTROLLARE L'USERNAME
function callDB_checkUsername(params)
{
    // chiamata al db
    $.get("../services/checkUsername.php",params,function(isUsed)
    {
        return isUsed;
    });
}

// CHIAMATA AL DB PER LA REGISTRAZIONE
function callDB_registrazione(params)
{
    // chiamata al db
    $.post("../services/registrazione.php",params,function(isRegistred)
    {
        // reindirizzamento
        reindizzamento(isRegistred);
    });
}

// REINDIRIZZAMENTO
function reindizzamento(isRegistred)
{
    // registrazione corretta
    if(isRegistred)
        window.location.href = "login.php";
    else
        alert("ERRORE! Registrazione non andata a buon fine!");
}