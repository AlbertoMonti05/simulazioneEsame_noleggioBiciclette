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

        <title>Modifica dati profilo - BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../script/richiesta.js"></script>
        <script src="../script/modificaDatiProfilo.js"></script>

    </head>

    <body>
        <h1>MODIFICA DATI PROFILO</h1>

        <div>
            nome: <input type="text" id="nome" onchange="modificaNome()">
            <br>
            cognome: <input type="text" id="cognome" onchange="modificaCognome()">
            <br>
            mail: <input type="text" id="mail" onchange="modificaMail()">
            <br>
            username: <input type="text" id="username" onchange="modificaUsername()">
            <br>
            indirizzo: <input type="text" id="indirizzo">
            <br>
            <button onclick="modificaDati()">MOFIFICA DATI</button>
            <a href="profilo.php">ANNULLA</a>
        </div>

    </body>

</html>