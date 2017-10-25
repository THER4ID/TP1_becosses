-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 25 Octobre 2017 à 20:39
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projettoilette`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `IdCommentaire` int(100) NOT NULL,
  `Texte` varchar(1000) NOT NULL,
  `IdCompte` int(100) NOT NULL,
  `IdToilette` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `IdCompte` int(100) NOT NULL,
  `Courriel` varchar(50) NOT NULL,
  `MotDePasse` varchar(30) NOT NULL,
  `Age` int(100) NOT NULL,
  `Ville` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`IdCompte`, `Courriel`, `MotDePasse`, `Age`, `Ville`, `Nom`, `Prenom`) VALUES
(1, 'f@mail.com', 'f', 13, 'Montreal', 'Pare', 'Francis');

-- --------------------------------------------------------

--
-- Structure de la table `toilette`
--

CREATE TABLE `toilette` (
  `IdToilette` int(255) NOT NULL,
  `IdCompte` int(100) NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Etat` int(11) NOT NULL,
  `TypeDeService` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`IdCommentaire`),
  ADD KEY `IdCompte` (`IdCompte`),
  ADD KEY `IdToilette` (`IdToilette`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`IdCompte`);

--
-- Index pour la table `toilette`
--
ALTER TABLE `toilette`
  ADD PRIMARY KEY (`IdToilette`),
  ADD KEY `IdCompte` (`IdCompte`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `IdCommentaire` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `IdCompte` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `toilette`
--
ALTER TABLE `toilette`
  MODIFY `IdToilette` int(255) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_Compte` FOREIGN KEY (`IdCompte`) REFERENCES `compte` (`IdCompte`);

--
-- Contraintes pour la table `toilette`
--
ALTER TABLE `toilette`
  ADD CONSTRAINT `FK_Toilette` FOREIGN KEY (`IdCompte`) REFERENCES `compte` (`IdCompte`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
