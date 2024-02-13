-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 13. 10:02
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kereskedes`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auto`
--

CREATE TABLE `auto` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `kivitelid` int(11) DEFAULT NULL,
  `markaid` int(11) DEFAULT NULL,
  `ar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `auto`
--

INSERT INTO `auto` (`id`, `nev`, `kivitelid`, `markaid`, `ar`) VALUES
(1, 'M5 CS', NULL, NULL, 60450000),
(2, 'X6M', NULL, NULL, 62000000),
(3, 'M8 CS', NULL, NULL, 57200000),
(4, 'X7', NULL, NULL, 39900000),
(5, 'M4 CS', NULL, NULL, 32900000),
(6, 'M2 CS', NULL, NULL, 28170000),
(7, 'Z4 ROADSTER', NULL, NULL, 25000000),
(8, 'M3 TOURING', NULL, NULL, 34750000),
(9, 'M135I XDRIVE', NULL, NULL, 19800000),
(10, 'BENZ C63 AMG', NULL, NULL, 28170000),
(11, 'BENZ GLE COUPÉ', NULL, NULL, 66600000),
(12, 'BENZ CLE', NULL, NULL, 32300000),
(13, 'BENZ E-CLASSE', NULL, NULL, 33700000),
(14, 'AMG SL ROADSTER', NULL, NULL, 84890000),
(15, 'MAYBACH S', NULL, NULL, 95680000),
(16, 'AMG GT COUPÉ', NULL, NULL, 81890000),
(17, 'BENZ G63 AMG', NULL, NULL, 79245000),
(18, 'BENZ A45 AMG', NULL, NULL, 28000000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `id` int(11) NOT NULL,
  `vnev` varchar(255) DEFAULT NULL,
  `knev` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jelszo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kivitel`
--

CREATE TABLE `kivitel` (
  `id` int(11) NOT NULL,
  `megnevezes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `kivitel`
--

INSERT INTO `kivitel` (`id`, `megnevezes`) VALUES
(1, 'SEDAN'),
(2, 'COUPÉ'),
(3, 'SUV'),
(4, 'KOMBI'),
(5, 'KABRIO');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `id` int(11) NOT NULL,
  `autoid` int(11) DEFAULT NULL,
  `felhasznaloid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `marka`
--

CREATE TABLE `marka` (
  `id` int(11) NOT NULL,
  `markanev` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `marka`
--

INSERT INTO `marka` (`id`, `markanev`) VALUES
(1, 'BMW'),
(2, 'MERCEDES');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kivitelid` (`kivitelid`),
  ADD KEY `markaid` (`markaid`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kivitel`
--
ALTER TABLE `kivitel`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autoid` (`autoid`),
  ADD KEY `felhasznaloid` (`felhasznaloid`);

--
-- A tábla indexei `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `auto`
--
ALTER TABLE `auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kivitel`
--
ALTER TABLE `kivitel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `kosar`
--
ALTER TABLE `kosar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `marka`
--
ALTER TABLE `marka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`kivitelid`) REFERENCES `kivitel` (`id`),
  ADD CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`markaid`) REFERENCES `marka` (`id`);

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `kosar_ibfk_1` FOREIGN KEY (`autoid`) REFERENCES `auto` (`id`),
  ADD CONSTRAINT `kosar_ibfk_2` FOREIGN KEY (`felhasznaloid`) REFERENCES `felhasznalo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
