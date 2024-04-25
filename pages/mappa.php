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
        <script src="../script/mappa.js"></script>

    </head>

    <body>
        
        <h1>MAPPA STAZIONI NOGLEGGIO/RICONSEGNA BICICLETTE</h1>

        <?php

            // ospite
            if(!isset($_SESSION['User_id']))
            {
                ?>

                    <a href="registrazione.php"><button>REGISTRATI</button></a>
                    <br>

                <?php
            }

        ?>


    </body>

</html>