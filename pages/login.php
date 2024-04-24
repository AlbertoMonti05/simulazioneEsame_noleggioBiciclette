<?php
    // prendo la sessione
    session_start();

    // utente in sessione
    if(isset($_SESSION['User_id']))
        header("Location: mappa.php");
    // else 
        // rimango su questa pagina
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login - BycicleRent</title>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../script/login.js"></script>

    </head>

    <body>
        


    </body>

</html>