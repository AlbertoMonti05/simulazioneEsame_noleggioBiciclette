<?php
    // distruggo la sessione
    session_abort();

    // reindirizzamento
    header("Location: login.php");
?>