<?php
    // prendo la sessione
    session_start();

    // utente in sessione
    if(isset($_SESSION['user_id']))
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
        <h1>LOGIN</h1>    

        mail: <input type="text" id="mail">
        <br>
        password: <input type="password" id="password">
        <br>
        <button onclick="doLogin()">LOGIN</button>

    </body>

</html>