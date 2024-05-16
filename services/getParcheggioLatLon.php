<?php
    // prendo la sessione
    if(!isset($_SESSION))
        session_start();

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $getParcheggioLatLon;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($getParcheggioLatLon);

    $statement->bind_param("dd", $_SESSION["latitudine"], $_SESSION["longitudine"]);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result();

    // parcheggio trovato
    if ($result->num_rows == 1) 
    {
        // prendo i dati del parcheggio
        $parcheggio = $result->fetch_assoc();

        // return
        echo json_encode($parcheggio);
    }
    else            
        echo json_encode(false);
?>