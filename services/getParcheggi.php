<?php
    // prendo la sessione
    if(!isset($_SESSION))
        session_start();

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $getParcheggi;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($getParcheggi);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result();

    // vettore per contenere i parcheggi
    $parcheggi = array();

    // per tutte le righe
    while ($row = $result->fetch_assoc())
    {
        // aggiungo la riga al vettore
        $parcheggi[] = $row;
    }

    // ritorno il vettore in json
    echo json_encode($parcheggi);
?>