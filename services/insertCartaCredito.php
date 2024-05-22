<?php
    // prendo la sessione
    session_start();

    // parametri non passati
    if(!isset($_GET["nomeTitolareCarta"]) || !isset($_GET["cognomeTitolareCarta"]) 
    || !isset($_GET["numeroCarta"]) || !isset($_GET["scadenzaCarta"]) || !isset($_GET["cvvCarta"]))
    {
        echo "ERRORE! Parametri non passati";
        return;
    }

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $insertCartaCredito;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($insertCartaCredito);

    // parametri nello statement
    $statement->bind_param("ssidi", $_GET["nomeTitolareCarta"], $_GET["cognomeTitolareCarta"], $_GET["numeroCarta"], $_GET["scadenzaCarta"], $_GET["cvvCarta"]);

    // eseguo lo statement
    $statement->execute();

    echo $connDB->insert_id;
?>