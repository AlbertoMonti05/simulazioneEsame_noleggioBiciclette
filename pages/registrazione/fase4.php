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

        <title>Registrazione Fase 4- BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../../script/registrazione/fase2.js"></script>

    </head>

    <body>
        <h1>REGISTRAZIONE</h1>

        <div>
            nome titolare carta:<input type="text" id="nomeTitolareCarta">
            <br>
            cognome titolare carta:<input type="text" id="cognomeTitolareCarta">
            <br>
            numero carta:<input type="password" id="numeroCarta">
            <br>
            scadenza carta:<input type="month" id="scadenzaCarta">
            <br>
            cvv carta:<input type="text" id="cvvCarta">
            <br>
            <button onclick="doRegistrazione()">REGISTRAZIONE</button>
        </div>

    </body>

</html>