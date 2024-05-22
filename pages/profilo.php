<?php
    // prendo la sessione
    session_start();

    // utente non in sessione
    if(!isset($_SESSION['cliente_id']))
        header("Location: mappa.php");
    // else 
        // rimango su questa pagina
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Profilo cliente - BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../script/richiesta.js"></script>
        <script src="../script/profilo.js"></script>

    </head>

    <body>
        <h1>PROFILO CLIENTE</h1>

        <div>
            nome: <input type="text" id="nome" readonly="readonly">
            <br>
            cognome: <input type="text" id="cognome" readonly="readonly">
            <br>
            mail: <input type="text" id="mail" readonly="readonly">
            <br>
            username: <input type="text" id="username" readonly="readonly">
            <br>
            indirizzo: <input type="text" id="indirizzo" readonly="readonly">
            <br>
            <a href="modificaDatiProfilo.php">MODIFICA DATI</a>
        </div>

    </body>

</html>