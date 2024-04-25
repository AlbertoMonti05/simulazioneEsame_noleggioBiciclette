<?php
    // prendo la sessione
    session_start();

    // anche l'utente non loggato può visualizzare la mappa
    // non controllo se l'utente è loggato perché non è un problema se non lo è
    header("Location: pages/mappa.php");
?>