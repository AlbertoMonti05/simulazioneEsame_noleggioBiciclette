<?php
    // prendo la sessione
    session_start();

    // anche l'utente non loggato può visualizzare questa pagina
    // non controllo se l'utente è loggato perché non è un problema se non lo è

    // latitudine e longitudine non settate
    if(!isset($_GET["latitudine"]) || !isset($_GET["longitudine"]))
    {
        echo "Errore: latitudine e/o longitudine non settate";
        exit;
    }
    // else
        // rimango su questa pagina

    // metto latitudine e longitudine in sessione
    $_SESSION["latitudine"] = $_GET["latitudine"];
    $_SESSION["longitudine"] = $_GET["longitudine"];
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Stazione - BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../script/stazione.js"></script>

    </head>

    <body>
        <h1 id="h1"></h1>

        <h3 id="postiLiberi"></h3>
    </body>

</html>