<?php
    // prendo la sessione
    session_start();

    // utente in sessione
    if(isset($_SESSION['cliente_id']))
        header("Location: mappa.php");
    // else 
        // rimango su questa pagina
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Registrazione Fase 1 - BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../../script/registrazione/fase1.js"></script>

    </head>

    <body>
        <h1>REGISTRAZIONE</h1>

        <div>
            nome:<input type="text" id="nome">
            <br>
            cognome:<input type="text" id="cognome">
            <br>
            <button onclick="avanti()">AVANTI</button>
        </div>

    </body>

</html>