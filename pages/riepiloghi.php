<?php
    // prendo la sessione
    session_start();

    // utente non in sessione
    if(!isset($_SESSION['cliente_id']))
        header("Location: mappa.php");
    // else 
        // rimango su questa pagina
?>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Riepiloghi cliente - BycicleRent</title>

        <!-- IMPORTO jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

        <!-- IMPORTO LO SCRIPT -->
        <script src="../script/richiesta.js"></script>
        <script src="../script/riepiloghi.js"></script>

    </head>

    <body>
        <h1>RIEPILOGHI CLIENTE</h1>

        <!-- SOMMARIO OPERAZIONI CON I DATI TOTALI -->
        <div>

            <h2>RIEPILOGO TOTALE</h2>

            numero tratte totali: <input type="number" id="numeroTratteTotali" readonly="readonly">
            <br>
            chilometri totali: <input type="number" id="chilometriTotali" readonly="readonly">
            <br>
            spesa totale: <input type="number" id="spesaTotale" readonly="readonly">
            <br>
        </div>

        <br>

        <!-- OPERAZIONI TRATTA PER TRATTA -->
        <div id="trattaPerTratta">

            <h2>RIEPILOGO TRATTA PER TRATTA</h>
            <!-- 
                <div>

                    tipo: <input type="text" readonly="readonly">
                    data: <input type="text" readonly="readonly">
                    chilometri fatti: <input type="text" readonly="readonly">
                    tariffa: <input type="text" readonly="readonly">
                    presso stazione: <input type="text" readonly="readonly">
            
                </div 
            -->
        </div>

    </body>

</html>