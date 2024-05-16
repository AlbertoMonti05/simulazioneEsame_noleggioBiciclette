<?php
    // QUERY PER CONTROLLO NEL DATABASE

    // controllo login cliente con mail
    $checkLoginCliente_Mail = "SELECT * FROM `clienti` WHERE `mail`=? AND `password`=?";

    // controllo login cliente con username
    $checkLoginCliente_Username = "SELECT * FROM `clienti` WHERE `username`=? AND `password`=?";

    // controllo login admin con mail
    $checkLoginAdmin_Mail = "SELECT * FROM `admin` WHERE `mail`=? AND `password`=?";

    // controllo login admin con username
    $checkLoginAdmin_Username = "SELECT * FROM `admin` WHERE `username`=? AND `password`=?";

    // controllo mail
    $checkMail = "SELECT * FROM `clienti` WHERE `mail` = ?";

    // controllo username
    $checkUsername = "SELECT * FROM `clienti` WHERE `username` = ?";

    // registrazione
    $registrazione = "INSERT INTO `clienti` (`nome`, `cognome`, `username`, `mail`, `password`) VALUE (?,?,?,?,?)";

    // prendo i dati del cliente
    $getDatiCliente = "SELECT `nome`, `cognome`, `username`, `mail`, `indirizzo_id` FROM `clienti` WHERE `cliente_id` = ?";

    // prendo l'indirizzo
    $getIndirizzo = "SELECT * FROM `indirizzi` WHERE `indirizzo_id` = ?";

    // modifico dati del profilo
    $modificaDatiProfilo = "UPDATE `clienti` SET `nome` = ?, `cognome` = ?, `mail` = ?, `username` = ? WHERE `cliente_id` = ?";

    // prendo tutti i parcheggi
    $getParcheggi = "SELECT `latitudine`, `longitudine` FROM `parcheggi`";
?>