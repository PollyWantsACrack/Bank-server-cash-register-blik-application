-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 31, 2025 at 02:53 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty`
--

CREATE TABLE `karty` (
  `ID` int(11) NOT NULL,
  `ID_Konta` int(11) DEFAULT NULL,
  `NumerKarty` varchar(16) DEFAULT NULL,
  `TerminWaznosci` date DEFAULT NULL,
  `CVV` varchar(3) DEFAULT NULL,
  `LLimit` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karty`
--

INSERT INTO `karty` (`ID`, `ID_Konta`, `NumerKarty`, `TerminWaznosci`, `CVV`, `LLimit`) VALUES
(1, 1, '4111111111111111', '2025-12-31', '123', 5000.00),
(2, 1, '4111111111111112', '2026-06-30', '234', 10000.00),
(3, 2, '4111111111111113', '2025-03-15', '345', 2000.00),
(4, 3, '4111111111111114', '2025-09-10', '456', 1000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID` int(11) NOT NULL,
  `Imie` varchar(50) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Adres` varchar(100) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`ID`, `Imie`, `Nazwisko`, `Adres`, `Telefon`, `Email`, `DataUrodzenia`) VALUES
(1, 'Jan', 'Kowalski', 'ul. Wiosenna 1, 00-001 Warszawa', '123456789', 'jan.kowalski@example.com', '1980-05-12'),
(2, 'Anna', 'Nowak', 'ul. Jesienna 2, 00-002 Kraków', '987654321', 'anna.nowak@example.com', '1990-07-23'),
(3, 'Piotr', 'Zieliński', 'ul. Zimowa 3, 00-003 Gdańsk', '456789123', 'piotr.zielinski@example.com', '1975-11-30'),
(4, 'Jan', 'Kowalski', 'ul. Wiosenna 1, 00-001 Warszawa', '123456789', 'jan.kowalski@example.com', '1980-05-12'),
(5, 'Anna', 'Nowak', 'ul. Jesienna 2, 00-002 Kraków', '987654321', 'anna.nowak@example.com', '1990-07-23'),
(6, 'Piotr', 'Zieliński', 'ul. Zimowa 3, 00-003 Gdańsk', '456789123', 'piotr.zielinski@example.com', '1975-11-30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta`
--

CREATE TABLE `konta` (
  `ID` int(11) NOT NULL,
  `ID_Klienta` int(11) DEFAULT NULL,
  `NumerKonta` varchar(20) DEFAULT NULL,
  `TypKonta` varchar(50) DEFAULT NULL,
  `Saldo` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konta`
--

INSERT INTO `konta` (`ID`, `ID_Klienta`, `NumerKonta`, `TypKonta`, `Saldo`) VALUES
(1, 1, '1234567890123456', 'Osobiste', 1500.50),
(2, 1, '1234567890123457', 'Oszczędnościowe', 3000.00),
(3, 2, '9876543210123456', 'Osobiste', 2000.00),
(4, 3, '4567891230123456', 'Osobiste', 250.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje`
--

CREATE TABLE `transakcje` (
  `ID` int(11) NOT NULL,
  `ID_Karty` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Kwota` decimal(15,2) DEFAULT NULL,
  `TypTransakcji` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transakcje`
--

INSERT INTO `transakcje` (`ID`, `ID_Karty`, `Data`, `Kwota`, `TypTransakcji`) VALUES
(1, 1, '2025-01-20', 150.75, 'Zakup'),
(2, 2, '2025-01-21', 500.00, 'Wpłata'),
(3, 3, '2025-01-22', 100.00, 'Zakup'),
(4, 4, '2025-01-23', 50.00, 'Zakup');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `karty`
--
ALTER TABLE `karty`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NumerKarty` (`NumerKarty`),
  ADD KEY `ID_Konta` (`ID_Konta`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `konta`
--
ALTER TABLE `konta`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NumerKonta` (`NumerKonta`),
  ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- Indeksy dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Karty` (`ID_Karty`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karty`
--
ALTER TABLE `karty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `konta`
--
ALTER TABLE `konta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transakcje`
--
ALTER TABLE `transakcje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karty`
--
ALTER TABLE `karty`
  ADD CONSTRAINT `karty_ibfk_1` FOREIGN KEY (`ID_Konta`) REFERENCES `konta` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `konta`
--
ALTER TABLE `konta`
  ADD CONSTRAINT `konta_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klienci` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `transakcje`
--
ALTER TABLE `transakcje`
  ADD CONSTRAINT `transakcje_ibfk_1` FOREIGN KEY (`ID_Karty`) REFERENCES `karty` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
