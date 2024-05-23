<?php
    // prendo la sessione
    session_start();

    // admin non in sessione
    if(!isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == true)
        header("Location: ../mappa.php");
    // else 
        // rimango su questa pagina

    // bicicletta id settato
    if(isset($_SESSION['bicicletta_id']))
        unset($_SESSION['bicicletta_id']); // tolgo bicicletta id
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Mappa Biciclette - BycicleRent</title>

        <!-- IMPORTO LO SCRIPT -->
        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <!-- Includi la libreria Leaflet.js -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <script src="../../script/richiesta.js"></script>
        <script src="../../script/admin/visualizzaBiciclette.js"></script>
        
        <!-- IMPORTO LO STILE -->
        <link rel="stylesheet" type="text/css" href="../../style/mappa.css" />
        <!-- Includi il foglio di stile di Leaflet -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

    </head>

    <body>
        
        <h1 style="text-align: center;">MAPPA BICICLETTE</h1>

            <div style="text-align: right;">
                <a href="admin/aggiungiBicicletta.php">AGGIUNGI BICICLETTA</a>
            </div>

        <br>
        <div id="map-container"></div>

    </body>

</html>