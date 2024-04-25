<?php

    // prendo la sessione
    session_start();

    // distruggo la sessione
    session_abort();

    // reindirizzamento
    header("Location: login.php");

?>