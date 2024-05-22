<?php
    // QUERY PER CONTROLLO NEL DATABASE

    // controllo login cliente con mail
    $checkLoginCliente_Mail = "SELECT * FROM `clienti` WHERE `mail`=? AND `password`=?";

    // controllo login cliente con username
    $checkLoginCliente_Username = "SELECT * FROM `clienti` WHERE `username`=? AND `password`=?";

    // controllo login admin
    $checkLoginAdmin = "SELECT * FROM `admin` WHERE `mail`=? AND `password`=?";

    // controllo mail
    $checkMail = "SELECT * FROM `clienti` WHERE `mail` = ?";

    // controllo username
    $checkUsername = "SELECT * FROM `clienti` WHERE `username` = ?";

    // registrazione
    $registrazione = "INSERT INTO `clienti` (`nome`, `cognome`, `username`, `mail`, `password`, `latitudine`, `longitudine`, `indirizzo`) VALUE (?,?,?,?,?,?,?,?)";

    // prendo i dati del cliente
    $getDatiCliente = "SELECT `nome`, `cognome`, `username`, `mail`, `latitudine`, `longitudine`, `indirizzo` FROM `clienti` WHERE `cliente_id` = ?";

    // prendo l'indirizzo
    $getIndirizzo = "SELECT * FROM `indirizzi` WHERE `indirizzo_id` = ?";

    // modifico dati del profilo
    $modificaDatiProfilo = "UPDATE `clienti` SET `nome` = ?, `cognome` = ?, `mail` = ?, `username` = ? WHERE `cliente_id` = ?";

    // prendo tutti le stazioni
    $getStazioni = "SELECT * FROM `stazioni`";

    // prendo la stazione tramite latitudine e longitudine
    $getStazioneLatLon = "SELECT * FROM `stazioni` WHERE `latitudine` = ? AND `longitudine` = ?";

    // prendo posti liberi nella stazione
    $getPostiLiberiById = " SELECT
        stazioni.stazione_id,
        stazioni.via AS nome_stazione,
        stazioni.slotMax - COUNT(operazioni.operazione_id) AS slot_liberi
        FROM stazioni
        LEFT JOIN operazioni ON stazioni.stazione_id = operazioni.stazione_id AND operazioni.tipo = 'noleggio'
        WHERE stazioni.stazione_id = ?;";
?>