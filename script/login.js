// LOGIN
function doLogin()
{
    // prendo i parametri
    let mail = $("#mail").val();
    let password = $("#password").val();

    // errore parametri
    if(mail == "" || password == "")
    {
        alert("ERRORE! Inserire mail e password!");
        return;
    }

    // richiestra di login al db
    callDB_login({mail: mail, password: password});
}

// CHIAMATA AL DB PER
function callDB_login(params)
{
    // chiamata al db
    $.get("../services/login.php",params,function(isLogged)
    {
        // reindirizzamento
        reindizzamento(isLogged);
    });
}

// REINDIRIZZAMENTO
function reindizzamento(isLogged)
{
    // login corretta
    if(isLogged)
        window.location.href = "mappa.php";
    else
        alert("ERRORE! Mail e/o password errate!");
}