-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. lis 2025, 11:06
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `kavarna2`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `objednavka`
--

CREATE TABLE `objednavka` (
  `id_objednavky` int(11) NOT NULL,
  `id_zakaznika` int(11) NOT NULL,
  `id_zamestnance` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `cas` time DEFAULT NULL,
  `celkova_cena` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `objednavka`
--

INSERT INTO `objednavka` (`id_objednavky`, `id_zakaznika`, `id_zamestnance`, `datum`, `cas`, `celkova_cena`) VALUES
(1, 3, 2, '2024-04-10', '10:20:00', 134.00),
(2, 4, 5, '2024-04-11', '14:05:00', 75.00),
(3, 6, 2, '2024-04-12', '09:40:00', 178.00),
(4, 7, 9, '2024-04-12', '16:15:00', 45.00),
(5, 8, 5, '2024-04-13', '13:50:00', 168.00),
(6, 10, 2, '2024-04-14', '11:25:00', 124.00),
(7, 3, 2, '2024-04-14', '17:30:00', 98.00),
(8, 6, 9, '2024-04-15', '12:10:00', 104.00);

-- --------------------------------------------------------

--
-- Struktura tabulky `polozkaobjednavky`
--

CREATE TABLE `polozkaobjednavky` (
  `id_polozky` int(11) NOT NULL,
  `id_objednavky` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `mnozstvi` int(11) DEFAULT NULL,
  `poznamka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `polozkaobjednavky`
--

INSERT INTO `polozkaobjednavky` (`id_polozky`, `id_objednavky`, `id_produktu`, `mnozstvi`, `poznamka`) VALUES
(1, 1, 1, 2, 'bez skorice'),
(2, 1, 4, 1, NULL),
(3, 2, 4, 1, 'extra jahody'),
(4, 3, 6, 2, NULL),
(5, 3, 1, 1, NULL),
(6, 4, 3, 1, NULL),
(7, 5, 2, 2, 'ovesne mleko'),
(8, 5, 5, 1, 'ohrat'),
(9, 6, 10, 1, NULL),
(10, 6, 1, 1, NULL),
(11, 7, 8, 2, 'mene cukru'),
(12, 8, 9, 2, NULL),
(13, 8, 3, 1, 'silne espresso');

-- --------------------------------------------------------

--
-- Struktura tabulky `produkt`
--

CREATE TABLE `produkt` (
  `id_produktu` int(11) NOT NULL,
  `nazev` varchar(100) DEFAULT NULL,
  `cena` decimal(6,2) DEFAULT NULL,
  `dostupnost` tinyint(1) DEFAULT NULL,
  `id_typ_produktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `produkt`
--

INSERT INTO `produkt` (`id_produktu`, `nazev`, `cena`, `dostupnost`, `id_typ_produktu`) VALUES
(1, 'Cappuccino', 59.00, 1, 1),
(2, 'Latte', 65.00, 1, 1),
(3, 'Espresso', 45.00, 1, 1),
(4, 'Cheesecake', 75.00, 1, 2),
(5, 'Brownie', 55.00, 1, 2),
(6, 'Sendvic s kuretem', 89.00, 1, 3),
(7, 'Sendvic s mozzarellou', 79.00, 0, 3),
(8, 'Domaci limonada', 49.00, 1, 4),
(9, 'Ledovy caj', 39.00, 1, 4),
(10, 'Horka cokolada', 69.00, 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `typproduktu`
--

CREATE TABLE `typproduktu` (
  `id_typ_produktu` int(11) NOT NULL,
  `nazev` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `typproduktu`
--

INSERT INTO `typproduktu` (`id_typ_produktu`, `nazev`) VALUES
(1, 'Kava'),
(2, 'Dezert'),
(3, 'Sendvic'),
(4, 'Napoj');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `id_uzivatel` int(11) NOT NULL,
  `jmeno` varchar(100) DEFAULT NULL,
  `prijmeni` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`id_uzivatel`, `jmeno`, `prijmeni`, `email`, `telefon`, `created_at`) VALUES
(1, 'Petr', 'Novak', 'petr.novak@example.com', '+420777111222', '2024-01-10 09:15:00'),
(2, 'Jana', 'Dvorakova', 'jana.dvorakova@example.com', '+420777222333', '2024-01-12 13:20:00'),
(3, 'Karel', 'Svoboda', 'karel.svoboda@example.com', '+420777333444', '2024-02-02 08:00:00'),
(4, 'Martina', 'Vesela', 'martina.vesela@example.com', '+420777444555', '2024-02-15 15:45:00'),
(5, 'Lukas', 'Kral', 'lukas.kral@example.com', '+420777555666', '2024-02-20 07:30:00'),
(6, 'Tereza', 'Cerna', 'tereza.cerna@example.com', '+420777666777', '2024-03-05 12:10:00'),
(7, 'Adam', 'Kucera', 'adam.kucera@example.com', '+420777777888', '2024-03-12 10:50:00'),
(8, 'Eva', 'Mala', 'eva.mala@example.com', '+420777888999', '2024-03-22 16:20:00'),
(9, 'Michal', 'Prochazka', 'michal.prochazka@example.com', '+420777999000', '2024-04-01 10:00:00'),
(10, 'Veronika', 'Jandova', 'veronika.jandova@example.com', '+420700111222', '2024-04-05 13:40:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `id_zakaznika` int(11) NOT NULL,
  `vernostni_body` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zakaznik`
--

INSERT INTO `zakaznik` (`id_zakaznika`, `vernostni_body`) VALUES
(3, 120),
(4, 80),
(6, 300),
(7, 0),
(8, 50),
(10, 200);

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanec`
--

CREATE TABLE `zamestnanec` (
  `id_zamestnance` int(11) NOT NULL,
  `typ` enum('majitel','manažer','brigádník') NOT NULL,
  `datum_nastupu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zamestnanec`
--

INSERT INTO `zamestnanec` (`id_zamestnance`, `typ`, `datum_nastupu`) VALUES
(1, 'majitel', '2020-01-01'),
(2, 'manažer', '2021-03-15'),
(5, 'brigádník', '2023-07-10'),
(9, 'brigádník', '2023-09-01');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
  ADD PRIMARY KEY (`id_objednavky`),
  ADD KEY `id_zakaznika` (`id_zakaznika`),
  ADD KEY `id_zamestnance` (`id_zamestnance`);

--
-- Indexy pro tabulku `polozkaobjednavky`
--
ALTER TABLE `polozkaobjednavky`
  ADD PRIMARY KEY (`id_polozky`),
  ADD KEY `id_objednavky` (`id_objednavky`),
  ADD KEY `id_produktu` (`id_produktu`);

--
-- Indexy pro tabulku `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id_produktu`),
  ADD KEY `id_typ_produktu` (`id_typ_produktu`);

--
-- Indexy pro tabulku `typproduktu`
--
ALTER TABLE `typproduktu`
  ADD PRIMARY KEY (`id_typ_produktu`);

--
-- Indexy pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`id_uzivatel`);

--
-- Indexy pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`id_zakaznika`);

--
-- Indexy pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD PRIMARY KEY (`id_zamestnance`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
  MODIFY `id_objednavky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `polozkaobjednavky`
--
ALTER TABLE `polozkaobjednavky`
  MODIFY `id_polozky` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `typproduktu`
--
ALTER TABLE `typproduktu`
  MODIFY `id_typ_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `id_uzivatel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
  ADD CONSTRAINT `objednavka_ibfk_1` FOREIGN KEY (`id_zakaznika`) REFERENCES `zakaznik` (`id_zakaznika`),
  ADD CONSTRAINT `objednavka_ibfk_2` FOREIGN KEY (`id_zamestnance`) REFERENCES `zamestnanec` (`id_zamestnance`);

--
-- Omezení pro tabulku `polozkaobjednavky`
--
ALTER TABLE `polozkaobjednavky`
  ADD CONSTRAINT `polozkaobjednavky_ibfk_1` FOREIGN KEY (`id_objednavky`) REFERENCES `objednavka` (`id_objednavky`),
  ADD CONSTRAINT `polozkaobjednavky_ibfk_2` FOREIGN KEY (`id_produktu`) REFERENCES `produkt` (`id_produktu`);

--
-- Omezení pro tabulku `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`id_typ_produktu`) REFERENCES `typproduktu` (`id_typ_produktu`);

--
-- Omezení pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD CONSTRAINT `zakaznik_ibfk_1` FOREIGN KEY (`id_zakaznika`) REFERENCES `uzivatel` (`id_uzivatel`);

--
-- Omezení pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD CONSTRAINT `zamestnanec_ibfk_1` FOREIGN KEY (`id_zamestnance`) REFERENCES `uzivatel` (`id_uzivatel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
