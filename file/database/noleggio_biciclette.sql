-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 23, 2024 alle 15:24
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
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `admin`
--

INSERT INTO `admin` (`admin_id`, `mail`, `password`) VALUES
(1, 'admin1@admin.it', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struttura della tabella `biciclette`
--

CREATE TABLE `biciclette` (
  `bicicletta_id` int(11) NOT NULL,
  `codice` int(11) NOT NULL,
  `latitudine` double NOT NULL,
  `longitudine` double NOT NULL,
  `km_percorsi` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `biciclette`
--

INSERT INTO `biciclette` (`bicicletta_id`, `codice`, `latitudine`, `longitudine`, `km_percorsi`) VALUES
(1, 1001, 45.4661, 9.174, 12.7),
(2, 1002, 45.4774, 9.1734, 8),
(3, 1003, 45.4659, 9.1905, 75.8),
(4, 1004, 45.4665, 9.1912, 112.1),
(5, 1005, 45.4673, 9.1919, 87.6),
(6, 1006, 45.468, 9.1926, 104.9),
(7, 1007, 45.4688, 9.1933, 69.4),
(8, 1008, 45.4695, 9.194, 81.2),
(9, 1009, 45.4703, 9.1947, 93.7),
(10, 1010, 45.4709, 9.1954, 105.6),
(11, 1011, 45.4716, 9.1961, 81.3),
(12, 1012, 45.4724, 9.1968, 97.2),
(13, 1013, 45.4731, 9.1975, 113.8),
(14, 1014, 45.4739, 9.1982, 89.6),
(15, 1015, 45.4746, 9.1989, 76.5),
(16, 1016, 45.4752, 9.1996, 102.4),
(17, 1017, 45.4759, 9.2003, 88.9),
(18, 1018, 45.4767, 9.201, 65.2),
(19, 1019, 45.4774, 9.2017, 78.4),
(20, 1020, 45.4782, 9.2024, 94.1),
(21, 1021, 45.4789, 9.2031, 105.8),
(22, 1022, 45.4795, 9.2038, 73.6),
(23, 1023, 45.4802, 9.2045, 82.9),
(24, 1024, 45.4809, 9.2052, 97.7),
(25, 1025, 45.4815, 9.2059, 114.3),
(26, 1026, 45.4822, 9.2066, 86.5),
(27, 1027, 45.4828, 9.2073, 68.7),
(28, 1028, 45.4835, 9.208, 99.6),
(29, 1029, 45.4841, 9.2087, 81.9),
(30, 1030, 45.4848, 9.2094, 109.2),
(31, 1031, 45.4854, 9.2101, 87.4),
(32, 1032, 45.4861, 9.2108, 72.8),
(33, 1033, 45.4867, 9.2115, 95.3),
(34, 1034, 45.4874, 9.2122, 108.5),
(35, 1035, 45.488, 9.2129, 84.6),
(36, 1036, 45.4887, 9.2136, 69.8),
(37, 1037, 45.4893, 9.2143, 101.7),
(38, 1038, 45.4899, 9.215, 82.3),
(39, 1039, 45.4906, 9.2157, 117.9),
(40, 1040, 45.4912, 9.2164, 95.6),
(41, 1041, 45.4918, 9.2171, 77.4),
(42, 1042, 45.4925, 9.2178, 109.8),
(43, 1043, 45.4931, 9.2185, 83.5),
(44, 1044, 45.4937, 9.2192, 71.2),
(45, 1045, 45.4944, 9.2199, 96.8),
(46, 1046, 45.495, 9.2206, 112.4),
(47, 1047, 45.4956, 9.2213, 89.9),
(48, 1048, 45.4963, 9.222, 65.3),
(49, 1049, 45.4969, 9.2227, 79.5),
(50, 1050, 45.4975, 9.2234, 105.2),
(51, 1051, 45.4982, 9.2241, 86.7),
(52, 1052, 45.4988, 9.2248, 72.4),
(53, 1053, 45.4994, 9.2255, 94.3),
(54, 1054, 45.5001, 9.2262, 110.6),
(55, 1055, 45.5007, 9.2269, 85.2),
(56, 1056, 45.5013, 9.2276, 67.8),
(57, 1057, 45.502, 9.2283, 99.3),
(58, 1058, 45.5026, 9.229, 80.6),
(59, 1059, 45.5032, 9.2297, 118.4),
(60, 1060, 45.5039, 9.2304, 97.5);

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
  `indirizzo` varchar(64) DEFAULT NULL,
  `latitudine` double NOT NULL,
  `longitudine` double NOT NULL,
  `nomeTitolareCarta` varchar(32) NOT NULL,
  `cognomeTitolareCarta` varchar(32) NOT NULL,
  `numeroCarta` char(16) NOT NULL,
  `scadenzaCarta` char(7) NOT NULL,
  `cvvCarta` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`cliente_id`, `nome`, `cognome`, `username`, `mail`, `password`, `indirizzo`, `latitudine`, `longitudine`, `nomeTitolareCarta`, `cognomeTitolareCarta`, `numeroCarta`, `scadenzaCarta`, `cvvCarta`) VALUES
(1, 'Mario', 'Rossi', 'mr', 'mr@gmail.com', 'd9394066970e44ae252fd0347e58c03e', 'via copernico 12, milano', 45.48802624809481, 9.201444324822106, 'Mario', 'Rossi', '1234567890123456', '2028-06', '123');

-- --------------------------------------------------------

--
-- Struttura della tabella `operazioni`
--

CREATE TABLE `operazioni` (
  `operazione_id` int(11) NOT NULL,
  `tipo` enum('noleggio','riconsegna') NOT NULL,
  `data_ora` datetime NOT NULL,
  `km_percorsi` float DEFAULT NULL,
  `tariffa` float DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `stazione_id` int(11) NOT NULL,
  `bicicletta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `operazioni`
--

INSERT INTO `operazioni` (`operazione_id`, `tipo`, `data_ora`, `km_percorsi`, `tariffa`, `cliente_id`, `stazione_id`, `bicicletta_id`) VALUES
(1, 'noleggio', '2024-05-08 20:26:07', NULL, NULL, 1, 1, 1),
(2, 'riconsegna', '2024-05-08 22:27:07', 12.7, 3, 1, 2, 1),
(3, 'noleggio', '2024-05-12 00:00:00', NULL, NULL, 1, 4, 2),
(4, 'riconsegna', '2024-05-12 00:00:00', 8, 2, 1, 3, 2),
(5, 'noleggio', '2024-05-03 11:30:00', NULL, NULL, 3, 2, 3),
(6, 'riconsegna', '2024-05-03 15:00:00', 6.5, 12, 3, 1, 3),
(7, 'noleggio', '2024-05-04 12:45:00', NULL, NULL, 4, 3, 4),
(8, 'riconsegna', '2024-05-04 16:30:00', 9.2, 18, 4, 4, 4),
(9, 'noleggio', '2024-05-05 13:20:00', NULL, NULL, 5, 4, 5),
(10, 'riconsegna', '2024-05-05 17:15:00', 7.8, 14, 5, 4, 5),
(11, 'noleggio', '2024-05-06 14:00:00', NULL, NULL, 6, 3, 6),
(12, 'riconsegna', '2024-05-06 18:00:00', 10.1, 20, 6, 3, 6),
(13, 'noleggio', '2024-05-07 15:20:00', NULL, NULL, 7, 3, 7),
(14, 'riconsegna', '2024-05-07 19:00:00', 6.9, 13, 7, 2, 7),
(15, 'noleggio', '2024-05-08 16:10:00', NULL, NULL, 8, 1, 8),
(16, 'riconsegna', '2024-05-08 20:00:00', 8.5, 16, 8, 2, 8),
(17, 'noleggio', '2024-05-09 17:30:00', NULL, NULL, 9, 2, 9),
(18, 'riconsegna', '2024-05-09 21:00:00', 7.3, 14.5, 9, 1, 9),
(19, 'noleggio', '2024-05-10 18:40:00', NULL, NULL, 10, 2, 10),
(20, 'noleggio', '2024-05-10 22:15:00', NULL, NULL, 10, 1, 10);

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
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indici per le tabelle `biciclette`
--
ALTER TABLE `biciclette`
  ADD PRIMARY KEY (`bicicletta_id`),
  ADD UNIQUE KEY `codice` (`codice`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `numeroCarta` (`numeroCarta`,`cvvCarta`);

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
-- AUTO_INCREMENT per la tabella `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `biciclette`
--
ALTER TABLE `biciclette`
  MODIFY `bicicletta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT per la tabella `operazioni`
--
ALTER TABLE `operazioni`
  MODIFY `operazione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `stazioni`
--
ALTER TABLE `stazioni`
  MODIFY `stazione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `operazioni`
--
ALTER TABLE `operazioni`
  ADD CONSTRAINT `operazioni_ibfk_1` FOREIGN KEY (`bicicletta_id`) REFERENCES `biciclette` (`bicicletta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;