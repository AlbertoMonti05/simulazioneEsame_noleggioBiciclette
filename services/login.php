<?php
    // prendo la sessione
    session_start();

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $checkLogin;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbLogin);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($checkLogin);

    // password in md5
    $password = md5($_GET["password"]);

    // parametri nello statement
    $statement->bind_param("ss", $_GET["mail"], $password);

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
        echo true;
    }

    // chiudo connessione al database
    $connDB->close();

    // return
    echo false;
?>