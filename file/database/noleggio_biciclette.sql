-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 19, 2024 alle 21:13
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noleggio_biciclette`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `admin`
--

INSERT INTO `admin` (`admin_id`, `mail`, `username`, `password`) VALUES
(1, '', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struttura della tabella `biciclette`
--

CREATE TABLE `biciclette` (
  `bicicletta_id` int(11) NOT NULL,
  `codice` int(11) NOT NULL,
  `latitudine` double NOT NULL,
  `longitudine` double NOT NULL,
  `km_percorsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `carte_credito`
--

CREATE TABLE `carte_credito` (
  `carta_credito_id` int(11) NOT NULL,
  `nome_titolare` varchar(32) NOT NULL,
  `cognome_titolare` varchar(32) NOT NULL,
  `numero` char(16) NOT NULL,
  `scadenza` date NOT NULL,
  `cvv` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `carte_credito`
--

INSERT INTO `carte_credito` (`carta_credito_id`, `nome_titolare`, `cognome_titolare`, `numero`, `scadenza`, `cvv`) VALUES
(1, 'mario', 'rossi', '1234567891234567', '2028-04-17', '000');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(32) NOT NULL,
  `cognome` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `indirizzo` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`cliente_id`, `nome`, `cognome`, `username`, `mail`, `password`, `indirizzo`) VALUES
(38, 'mario', 'rossi', 'marioRossi', 'mario@gmail.com', 'de2f15d014d40b93578d255e6221fd60', NULL),
(39, 'a', 'aa', 'user', 'a@gmail.com', '4124bc0a9335c27f086f24ba207a4912', NULL),
(40, 'nome', 'cognome', 'useraa', 'mail', '1a1dc91c907325c69271ddf0c944bc72', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `operazioni`
--

CREATE TABLE `operazioni` (
  `operazione_id` int(11) NOT NULL,
  `tipo` enum('noleggio','riconsegna') NOT NULL,
  `data_ora` datetime NOT NULL,
  `km_percorsi` int(11) DEFAULT NULL,
  `tariffa` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `stazione_id` int(11) NOT NULL,
  `bicicletta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `stazioni`
--

CREATE TABLE `stazioni` (
  `stazione_id` int(11) NOT NULL,
  `via` varchar(64) NOT NULL,
  `latitudine` double NOT NULL,
  `longitudine` double NOT NULL,
  `slotMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `stazioni`
--

INSERT INTO `stazioni` (`stazione_id`, `via`, `latitudine`, `longitudine`, `slotMax`) VALUES
(1, 'Via Garibaldi', 45.46616665464403, 9.174049656162099, 30),
(2, 'Via Matteotti', 45.47396133651221, 9.162068653528493, 20),
(3, 'Piazza del mercato', 45.47391761520903, 9.195303473626618, 10),
(4, 'Via arco della pace', 45.477451450652865, 9.17340055882721, 15);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indici per le tabelle `biciclette`
--
ALTER TABLE `biciclette`
  ADD PRIMARY KEY (`bicicletta_id`),
  ADD UNIQUE KEY `codice` (`codice`);

--
-- Indici per le tabelle `carte_credito`
--
ALTER TABLE `carte_credito`
  ADD PRIMARY KEY (`carta_credito_id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD UNIQUE KEY `cvv` (`cvv`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indici per le tabelle `operazioni`
--
ALTER TABLE `operazioni`
  ADD PRIMARY KEY (`operazione_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `stazione_id` (`stazione_id`),
  ADD KEY `bicicletta_id` (`bicicletta_id`);

--
-- Indici per le tabelle `stazioni`
--
ALTER TABLE `stazioni`
  ADD PRIMARY KEY (`stazione_id`),
  ADD UNIQUE KEY `via` (`via`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `biciclette`
--
ALTER TABLE `biciclette`
  MODIFY `bicicletta_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
