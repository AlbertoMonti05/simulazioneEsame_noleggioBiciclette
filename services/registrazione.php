<?php
    // prendo la sessione
    session_start();

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $registrazione;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($registrazione);

    // password in md5
    $password = md5($_GET["password"]);

    // parametri nello statement
    $statement->bind_param("sssss", $_GET["nome"], $_GET["cognome"], $_GET["username"], $_GET["mail"], $password);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result();

    $return;

    // registrazione effettuata
    if ($result) 
    {
        // chiudo connessione al database
        $connDB->close();

        // return
        $return = true;
    }
    else
    {
        // chiudo connessione al database
        $connDB->close();

        // return
        $return = false;
    }

    echo $return;
?>