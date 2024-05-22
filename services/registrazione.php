<?php
    // prendo la sessione
    session_start();

    // parametri non passati
    if(!isset($_GET["nome"]) || !isset($_GET["cognome"]) 
    || !isset($_GET["username"]) || !isset($_GET["mail"]) || !isset($_GET["password"]) 
    || !isset($_GET["latitudine"]) || !isset($_GET["longitudine"]) 
    || !isset($_GET["indirizzo"]) || !isset($_GET["carta_credito_id"]))
    {
        echo "ERRORE! Parametri non passati";
        return;
    }

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
    $statement->bind_param("ssssssddi", $_GET["nome"], $_GET["cognome"], $_GET["username"], $_GET["mail"], $password, $_GET["indirizzo"], $_GET["latitudine"], $_GET["longitudine"], $_GET["carta_credito_id"]);

    // eseguo lo statement
    $statement->execute();

    // prendo il risultato
    $result = $statement->get_result();

    $return;

    // registrazione effettuata
    if ($result)
        $return = true;
    else
        $return = false;

    // chiudo connessione al database
    $connDB->close();

    echo $return;
?>