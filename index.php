<?php
    // prendo la sessione
    session_start();

    // utente in sessione
    if(isset($_SESSION['User_id']))
        header("Location: pages/mappa.php");
    else 
        // login
        header("Location: pages/login.php");
?>