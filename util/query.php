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
    $registrazione = "INSERT INTO `clienti` (`nome`, `cognome`, `username`, `mail`, `password`, `indirizzo`, `latitudine`, `longitudine`, `nomeTitolareCarta`, `cognomeTitolareCarta`, `numeroCarta`, `scadenzaCarta`, `cvvCarta`) VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    // prendo i dati del cliente
    $getDatiCliente = "SELECT `nome`, `cognome`, `username`, `mail`, `latitudine`, `longitudine`, `indirizzo` FROM `clienti` WHERE `cliente_id` = ?";

    // prendo l'indirizzo
    $getIndirizzo = "SELECT `indirizzo` FROM `clienti` WHERE `cliente_id` = ?";

    // modifico dati del profilo
    $modificaDatiProfilo = "UPDATE `clienti` SET `nome` = ?, `cognome` = ?, `mail` = ?, `username` = ?, `indirizzo` = ?, `latitudine` = ?, `longitudine` = ? WHERE `cliente_id` = ?";

    // prendo tutte le biciclette
    $getBiciclette = "SELECT * FROM `biciclette`";

    // prendo bicicletta tramite id
    $getBicicletta = "SELECT * FROM `biciclette` WHERE `bicicletta_id` = ?";

    // prendo tutti le stazioni
    $getStazioni = "SELECT * FROM `stazioni`";

    // prendo stazione tramite id
    $getStazione = "SELECT * FROM `stazioni` WHERE `stazione_id` = ?";

    // prendo tratte del cliente
    $getTratteCliente = "SELECT * FROM `operazioni` WHERE `cliente_id` = ?";

    // prendo tratte della bicicletta
    $getTratteBicicletta = "SELECT * FROM `operazioni` WHERE `bicicletta_id` = ?";

    // prendo operazioni della stazione
    $getOperazioniStazione = "SELECT * FROM `operazioni` WHERE `stazione_id` = ?";

    // prendo la stazione tramite latitudine e longitudine
    $getStazioneLatLon = "SELECT * FROM `stazioni` WHERE `latitudine` = ? AND `longitudine` = ?";

    // prendo riepilogo totale del cliente
    $getRiepilogoTotaleCliente = "SELECT COUNT(*) AS numeroTratte, SUM(`km_percorsi`) AS km_percorsi, SUM(`tariffa`) AS tariffa
        FROM operazioni
        WHERE `cliente_id` = ?";

    // prendo posti liberi nella stazione
    $getPostiLiberiById = " SELECT
            stazioni.stazione_id,
            stazioni.via AS nome_stazione,
            stazioni.slotMax - 
            (SELECT COUNT(*) FROM operazioni WHERE operazioni.stazione_id = stazioni.stazione_id AND operazioni.tipo = 'noleggio') +
            (SELECT COUNT(*) FROM operazioni WHERE operazioni.stazione_id = stazioni.stazione_id AND operazioni.tipo = 'riconsegna') AS slot_liberi
        FROM stazioni
        WHERE stazioni.stazione_id = ?;
        ";

    // prendo operazioni stazione
    $getOperazioniStazione = "SELECT * FROM `operazioni` WHERE `stazione_id` = ?";

    // prendo operazioni bicicletta
    $getOperazioniBicicletta = "SELECT * FROM `operazioni` WHERE `bicicletta_id` = ?";
?>