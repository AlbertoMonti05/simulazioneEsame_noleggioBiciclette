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
            if(!isset($_SESSION['cliente_id']))
            {
                ?>

                    <a href="login.php"><button>LOGIN</button></a>
                    <a href="registrazione.php"><button>REGISTRATI</button></a>
                    <br>

                <?php
            }
            else
            {
                ?>

                    <a href="logout.php"><button>LOGOUT</button></a>
                    <br>

                <?php
            }

        ?>


    </body>

</html>