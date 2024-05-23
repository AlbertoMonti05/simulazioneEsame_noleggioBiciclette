<?php
    // prendo la sessione
    if(!isset($_SESSION))
        session_start();

    // non è admin
    if(!isset($_SESSION["isAdmin"]))
    {
        echo "ERRORE! Non sei autenticato";
        return;
    }

    // parametri non passati
    if(!isset($_SESSION["stazione_id"]) || !isset($_GET["via"]) || !isset($_GET["latitudine"]) || !isset($_GET["longitudine"]) || !isset($_GET["slotMax"]))
    {
        echo "ERRORE! Parametri non passati";
        return;
    }

    // credenziali del database
    include_once("../util/credDb.php");
    global $server, $cliente, $psw, $dbBiciclette;

    // query
    include_once("../util/query.php");
    global $modificaStazione;

    // connessione al database
    $connDB = new mysqli($server, $cliente, $psw, $dbBiciclette);

    // errore nella connessione al db
    if ($connDB->connect_error)
        die("Connessione con il database non riuscita: " . $connDB->connect_error);

    // statement
    $statement = $connDB->prepare($modificaStazione);

    // parametri nello statement
    $statement->bind_param("sddii", $_GET["via"], $_GET["latitudine"], $_GET["longitudine"], $_GET["slotMax"], $_SESSION["stazione_id"]);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result();

    // ritorno !result perche' get_result() ritorna false se non ci sono stati errori
    echo json_encode(!$result);
?>