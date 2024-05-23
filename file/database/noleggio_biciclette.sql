-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 21, 2024 alle 22:07
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
(1, 1001, 45.4661, 9.1740, 12.7),
(2, 1002, 45.4774, 9.1734, 8),
(3, 1003, 45.4659, 9.1905, 75.8),
(4, 1004, 45.4665, 9.1912, 112.1),
(5, 1005, 45.4673, 9.1919, 87.6),
(6, 1006, 45.4680, 9.1926, 104.9),
(7, 1007, 45.4688, 9.1933, 69.4),
(8, 1008, 45.4695, 9.1940, 81.2),
(9, 1009, 45.4703, 9.1947, 93.7),
(10, 1010, 45.4709, 9.1954, 105.6),
(11, 1011, 45.4716, 9.1961, 81.3),
(12, 1012, 45.4724, 9.1968, 97.2),
(13, 1013, 45.4731, 9.1975, 113.8),
(14, 1014, 45.4739, 9.1982, 89.6),
(15, 1015, 45.4746, 9.1989, 76.5),
(16, 1016, 45.4752, 9.1996, 102.4),
(17, 1017, 45.4759, 9.2003, 88.9),
(18, 1018, 45.4767, 9.2010, 65.2),
(19, 1019, 45.4774, 9.2017, 78.4),
(20, 1020, 45.4782, 9.2024, 94.1),
(21, 1021, 45.4789, 9.2031, 105.8),
(22, 1022, 45.4795, 9.2038, 73.6),
(23, 1023, 45.4802, 9.2045, 82.9),
(24, 1024, 45.4809, 9.2052, 97.7),
(25, 1025, 45.4815, 9.2059, 114.3),
(26, 1026, 45.4822, 9.2066, 86.5),
(27, 1027, 45.4828, 9.2073, 68.7),
(28, 1028, 45.4835, 9.2080, 99.6),
(29, 1029, 45.4841, 9.2087, 81.9),
(30, 1030, 45.4848, 9.2094, 109.2),
(31, 1031, 45.4854, 9.2101, 87.4),
(32, 1032, 45.4861, 9.2108, 72.8),
(33, 1033, 45.4867, 9.2115, 95.3),
(34, 1034, 45.4874, 9.2122, 108.5),
(35, 1035, 45.4880, 9.2129, 84.6),
(36, 1036, 45.4887, 9.2136, 69.8),
(37, 1037, 45.4893, 9.2143, 101.7),
(38, 1038, 45.4899, 9.2150, 82.3),
(39, 1039, 45.4906, 9.2157, 117.9),
(40, 1040, 45.4912, 9.2164, 95.6),
(41, 1041, 45.4918, 9.2171, 77.4),
(42, 1042, 45.4925, 9.2178, 109.8),
(43, 1043, 45.4931, 9.2185, 83.5),
(44, 1044, 45.4937, 9.2192, 71.2),
(45, 1045, 45.4944, 9.2199, 96.8),
(46, 1046, 45.4950, 9.2206, 112.4),
(47, 1047, 45.4956, 9.2213, 89.9),
(48, 1048, 45.4963, 9.2220, 65.3),
(49, 1049, 45.4969, 9.2227, 79.5),
(50, 1050, 45.4975, 9.2234, 105.2),
(51, 1051, 45.4982, 9.2241, 86.7),
(52, 1052, 45.4988, 9.2248, 72.4),
(53, 1053, 45.4994, 9.2255, 94.3),
(54, 1054, 45.5001, 9.2262, 110.6),
(55, 1055, 45.5007, 9.2269, 85.2),
(56, 1056, 45.5013, 9.2276, 67.8),
(57, 1057, 45.5020, 9.2283, 99.3),
(58, 1058, 45.5026, 9.2290, 80.6),
(59, 1059, 45.5032, 9.2297, 118.4),
(60, 1060, 45.5039, 9.2304, 97.5);

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
(1, 'Mario', 'Rossi', '1234567891234567', '2028-04-17', '000'),
(2, 'Laura', 'Bianchi', '5555666677778888', '2026-08-15', '001'),
(3, 'Luigi', 'Verdi', '9999000011112222', '2026-10-30', '002'),
(4, 'Giovanna', 'Russo', '3333444455556666', '2026-12-10', '003'),
(5, 'Alessandro', 'Ferrari', '7777888899990000', '2027-02-20', '004'),
(6, 'Chiara', 'Esposito', '1234123412341234', '2027-04-05', '005'),
(7, 'Marco', 'Romano', '9876987698769876', '2027-06-15', '006'),
(8, 'Giulia', 'Conti', '5555444433332222', '2027-08-25', '007'),
(9, 'Stefano', 'Barbieri', '1111333322224444', '2027-10-05', '008'),
(10, 'Elena', 'Gallo', '6666555588889999', '2027-12-15', '009'),
(11, 'Francesca', 'Marino', '4444555566667777', '2028-02-25', '010'),
(12, 'Davide', 'Gatti', '8888777766665555', '2028-04-05', '011'),
(13, 'Roberta', 'Moretti', '1212376412121212', '2028-06-10', '012'),
(14, 'Paolo', 'Lombardi', '9898989898989898', '2028-08-20', '013'),
(15, 'Valentina', 'Sanna', '3434343412345434', '2028-10-30', '014'),
(16, 'Andrea', 'Leone', '5656512356565656', '2028-12-10', '015'),
(17, 'Simona', 'Mancini', '7878123878787878', '2029-02-20', '016'),
(18, 'Gianluca', 'Costa', '2323231233232323', '2029-04-05', '017'),
(19, 'Martina', 'Ferrara', '8989898981238989', '2029-06-15', '018'),
(20, 'Massimo', 'Rizzo', '1111222233334444', '2029-08-25', '019'),
(21, 'Elisa', 'Villa', '4545451234454545', '2029-10-05', '020'),
(22, 'Antonio', 'Mariani', '6767671234676767', '2029-12-15', '021'),
(23, 'Roberto', 'Greco', '7878787878787878', '2030-02-25', '022'),
(24, 'Cristina', 'Pellegrini', '1212121212121212', '2030-04-05', '023'),
(25, 'Fabio', 'Gallo', '3434343434343434', '2030-06-10', '024'),
(26, 'Silvia', 'Ricci', '8989898989898989', '2030-08-20', '025'),
(27, 'Giorgio', 'Vitali', '5656565656565656', '2030-10-30', '026'),
(28, 'Sara', 'Caruso', '2323232323232323', '2030-12-10', '027'),
(29, 'Lorenzo', 'Marini', '4545454545454545', '2031-02-20', '028'),
(30, 'Angela', 'Ferri', '6767676767676767', '2031-04-05', '029');

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
  `carta_credito_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `clienti`
--

INSERT INTO `clienti` (`cliente_id`, `nome`, `cognome`, `username`, `mail`, `password`, `indirizzo`, `latitudine`, `longitudine`, `carta_credito_id`) VALUES
(1, 'Mario', 'Rossi', 'mr', 'mario@gmail.com', 'd9394066970e44ae252fd0347e58c03e', 'via Copernico 12, Milano', 45.4880, 9.2014, 1),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi', 'giulia.bianchi@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'Via Roma 2', 45.4643, 9.1901, 2),
(3, 'Luca', 'Verdi', 'luca.verdi', 'luca.verdi@gmail.com', 'c81e728d9d4c2f636f067f89cc14862c', 'Via Venezia 3', 45.4644, 9.1902, 3),
(4, 'Chiara', 'Neri', 'chiara.neri', 'chiara.neri@gmail.com', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'Corso Buenos Aires 4', 45.4645, 9.1903, 4),
(5, 'Alessia', 'Gialli', 'alessia.gialli', 'alessia.gialli@gmail.com', 'a87ff679a2f3e71d9181a67b7542122c', 'Via Torino 5', 45.4646, 9.1904, 5),
(6, 'Francesco', 'Blu', 'francesco.blu', 'francesco.blu@gmail.com', 'e4da3b7fbbce2345d7772b0674a318d5', 'Corso Como 6', 45.4647, 9.1905, 6),
(7, 'Martina', 'Rosa', 'martina.rosa', 'martina.rosa@gmail.com', '1679091c5a880faf6fb5e6087eb1b2dc', 'Via Garibaldi 7', 45.4648, 9.1906, 7),
(8, 'Giovanni', 'Viola', 'giovanni.viola', 'giovanni.viola@gmail.com', '8f14e45fceea167a5a36dedd4bea2543', 'Corso Magenta 8', 45.4649, 9.1907, 8),
(9, 'Elisa', 'Arancioni', 'elisa.arancioni', 'elisa.arancioni@gmail.com', 'c9f0f895fb98ab9159f51fd0297e236d', 'Via Montenapoleone 9', 45.4650, 9.1908, 9),
(10, 'Simone', 'Marroni', 'simone.marroni', 'simone.marroni@gmail.com', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Corso Vittorio Emanuele II 10', 45.4651, 9.1909, 10),
(11, 'Laura', 'Ruggine', 'laura.ruggine', 'laura.ruggine@gmail.com', 'd3d9446802a44259755d38e6d163e820', 'Piazza Duomo 11', 45.4652, 9.1910, 11),
(12, 'Davide', 'Grigio', 'davide.grigio', 'davide.grigio@gmail.com', '6512bd43d9caa6e02c990b0a82652dca', 'Via della Spiga 12', 45.4653, 9.1911, 12),
(13, 'Sara', 'Celeste', 'sara.celeste', 'sara.celeste@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710', 'Via Manzoni 13', 45.4654, 9.1912, 13),
(14, 'Fabio', 'Oro', 'fabio.oro', 'fabio.oro@gmail.com', 'c51ce410c124a10e0db5e4b97fc2af39', 'Via Dante 14', 45.4655, 9.1913, 14),
(15, 'Valentina', 'Argento', 'valentina.argento', 'valentina.argento@gmail.com', 'aab3238922bcc25a6f606eb525ffdc56', 'Corso Europa 15', 45.4656, 9.1914, 15),
(16, 'Roberto', 'Turchese', 'roberto.turchese', 'roberto.turchese@gmail.com', '9bf31c7ff062936a96d3c8bd1f8f2ff3', 'Piazza San Babila 16', 45.4657, 9.1915, 16),
(17, 'Elena', 'Magenta', 'elena.magenta', 'elena.magenta@gmail.com', 'c74d97b01eae257e44aa9d5bade97baf', 'Via Montenapoleone 17', 45.4658, 9.1916, 17),
(18, 'Andrea', 'Ciano', 'andrea.ciano', 'andrea.ciano@gmail.com', '70efdf2ec9b086079795c442636b55fb', 'Via della Spiga 18', 45.4659, 9.1917, 18),
(19, 'Giorgio', 'Malva', 'giorgio.malva', 'giorgio.malva@gmail.com', '6f4922f45568161a8cdf4ad2299f6d23', 'Via Manzoni 19', 45.4660, 9.1918, 19),
(20, 'Paola', 'Indaco', 'paola.indaco', 'paola.indaco@gmail.com', '1f0e3dad99908345f7439f8ffabdffc4', 'Via Dante 20', 45.4661, 9.1919, 20);
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
(6, 'riconsegna', '2024-05-03 15:00:00', 6.5, 12.0, 3, 1, 3),
(7, 'noleggio', '2024-05-04 12:45:00', NULL, NULL, 4, 3, 4),
(8, 'riconsegna', '2024-05-04 16:30:00', 9.2, 18.0, 4, 4, 4),
(9, 'noleggio', '2024-05-05 13:20:00', NULL, NULL, 5, 4, 5),
(10, 'riconsegna', '2024-05-05 17:15:00', 7.8, 14.0, 5, 4, 5),
(11, 'noleggio', '2024-05-06 14:00:00', NULL, NULL, 6, 3, 6),
(12, 'riconsegna', '2024-05-06 18:00:00', 10.1, 20.0, 6, 3, 6),
(13, 'noleggio', '2024-05-07 15:20:00', NULL, NULL, 7, 3, 7),
(14, 'riconsegna', '2024-05-07 19:00:00', 6.9, 13.0, 7, 2, 7),
(15, 'noleggio', '2024-05-08 16:10:00', NULL, NULL, 8, 1, 8),
(16, 'riconsegna', '2024-05-08 20:00:00', 8.5, 16.0, 8, 2, 8),
(17, 'noleggio', '2024-05-09 17:30:00', NULL, NULL, 9, 2, 9),
(18, 'riconsegna', '2024-05-09 21:00:00', 7.3, 14.5, 9, 1, 9),
(19, 'noleggio', '2024-05-10 18:40:00', NULL, NULL, 10, 2, 10),
(20, 'riconsegna', '2024-05-10 22:15:00', 9.8, 19.0, 10, 4, 10);

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
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `carta_credito_id` (`carta_credito_id`);

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
  MODIFY `bicicletta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `carte_credito`
--
ALTER TABLE `carte_credito`
  MODIFY `carta_credito_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `operazioni`
--
ALTER TABLE `operazioni`
  MODIFY `operazione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `stazioni`
--
ALTER TABLE `stazioni`
  MODIFY `stazione_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `clienti`
--
ALTER TABLE `clienti`
  ADD CONSTRAINT `clienti_ibfk_1` FOREIGN KEY (`carta_credito_id`) REFERENCES `carte_credito` (`carta_credito_id`);

--
-- Limiti per la tabella `operazioni`
--
ALTER TABLE `operazioni`
  ADD CONSTRAINT `operazioni_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clienti` (`cliente_id`),
  ADD CONSTRAINT `operazioni_ibfk_2` FOREIGN KEY (`stazione_id`) REFERENCES `stazioni` (`stazione_id`),
  ADD CONSTRAINT `operazioni_ibfk_3` FOREIGN KEY (`bicicletta_id`) REFERENCES `biciclette` (`bicicletta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
