<?php
    // prendo la sessione
    if(!isset($_SESSION))
        session_start();

    // parametri non passati
    if(!isset($_GET["stazione_id"]))
    {
        echo "ERRORE! Parametri non passati";
        return;
    }

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $getStazioni;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($getStazioni);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result()->fetch_assoc();

    echo json_encode($stazioni["slot_liberi"]);
?>