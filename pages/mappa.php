<?php
    // prendo la sessione
    session_start();

    // anche l'utente non loggato può visualizzare la mappa
    // non controllo se l'utente è loggato perché non è un problema se non lo è
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Mappa - BycicleRent</title>

        <!-- IMPORTO LO SCRIPT -->
        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <!-- Includi la libreria Leaflet.js -->
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <script src="../script/richiesta.js"></script>
        <script src="../script/mappa.js"></script>
        
        <!-- IMPORTO LO STILE -->
        <link rel="stylesheet" type="text/css" href="../style/mappa.css" />
        <!-- Includi il foglio di stile di Leaflet -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />

    </head>

    <body>
        
        <h1 style="text-align: center;">MAPPA STAZIONI NOGLEGGIO/RICONSEGNA BICICLETTE</h1>

        <?php

            // ospite
            if(!isset($_SESSION['cliente_id']))
            {
                ?>
                    <div style="text-align: right;">
                        <a href="login.php">LOGIN</a>
                        <br>
                        <a href="registrazione.php">REGISTRATI</a>
                    </div>
                <?php
            }
            // admin
            elseif(isset($_SESSION['isAdmin']) && $_SESSION['isAdmin'] == true)
            {
                ?>
                    <div style="text-align: right;">
                        <a href="admin/stazioni.php">STAZIONI</a>
                        <br>
                        <a href="admin/biciclette.php">BICICLETTE</a>
                        <br>
                        <a href="admin/riepiloghi.php">RIEPILOGHI</a>
                    </div>
                <?php
            }
            else
            {
                ?>
                    <div style="text-align: right;">
                        <a href="profilo.php">PROFILO</a>
                        <br>
                        <a href="logout.php">LOGOUT</a>
                    </div>
                <?php
            }

        ?>

        <br>
        <div id="map-container"></div>

    </body>

</html>