<?php
    // QUERY PER CONTROLLO NEL DATABASE

    // controllo login
    $checkLogin = "SELECT * FROM `clienti` WHERE `mail`=? AND `password`=?";

    // controllo mail
    $checkMail = "SELECT * FROM `clienti` WHERE `mail` = ?";

    // controllo username
    $checkUsername = "SELECT * FROM `clienti` WHERE `username` = ?";

    // registrazione
    $registrazione = "INSERT INTO `clienti` (`nome`, `cognome`, `username`, `mail`, `password`) VALUE (?,?,?,?,?)";
?>