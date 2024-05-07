<?php
    // prendo la sessione
    session_start();

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $checkLoginCliente_Mail, $checkLoginCliente_Username;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // login con la mail
    if(doLogin($checkLoginCliente_Mail) == true)
        echo true;
    else // login con lo username
        echo doLogin($checkLoginCliente_Username);

    // LOGIN
    function doLogin($query)
    {
        // prendo i parametri
        $mail_username = $_GET["mail_username"];
        // password in md5
        $password = md5($_GET["password"]);

        // statement
        $statement = $connDB->prepare($query);

        // parametri nello statement
        $statement->bind_param("ss", $mail_username, $password);

        // eseguo lo statement
        $statement->execute();

        // prendo il risultato
        $result = $statement->get_result();

        // login corretta
        if ($result->num_rows == 1) 
        {
            // prendo i dati dell'utente
            $cliente = $result->fetch_assoc();

            // salvo id utente in sessione
            $_SESSION["cliente_id"] = $cliente["cliente_id"];
            //$_SESSION["Username_Utente"] = $cliente["username"];

            // chiudo connessione al database
            $connDB->close();

            // return
            return true;
        }
        else
        {
            // chiudo connessione al database
            $connDB->close();

            // return
            return false;
        }
    }
?>