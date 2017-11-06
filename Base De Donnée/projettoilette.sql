-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 06 Novembre 2017 à 02:57
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

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`IdCommentaire`, `Texte`, `IdCompte`, `IdToilette`) VALUES
(1, ' Expression littéraire utilisée depuis le XVIIIe siècle pour désigner linterprétation faite un texte ou dun auteur en analysant les leçons que lon peut en tirer. Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 1),
(2, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 3, 7),
(3, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 2, 9),
(4, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 9),
(5, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 7),
(6, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 3, 7),
(7, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 2, 7),
(8, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 8),
(9, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 8),
(10, 'superbe !', 2, 9),
(11, 'superbe !', 1, 9),
(12, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.e', 1, 6),
(13, 'belle toilette', 1, 5),
(14, 'belle toilette', 2, 5),
(15, 'belle toilette', 3, 5),
(16, 'superbe!!', 3, 4),
(17, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 3),
(18, 'superbe !', 3, 2),
(19, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 2),
(20, 'wow', 3, 2),
(21, 'Le commentaire peut prendre la forme une simple annotation ou un essai à part entière.', 1, 3);

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
(1, 'francis@mail.com', 'francis', 18, 'Montreal', 'Pare', 'Francis'),
(2, 'moumene@mail.com', 'moumene', 18, 'Montreal', 'moumene', 'moumene'),
(3, 'simon@mail.com', 'simon', 18, 'Montreal', 'Nguyen', 'Simon');


-- --------------------------------------------------------

--
-- Structure de la table `toilette`
--

CREATE TABLE `toilette` (
  `IdToilette` int(100) NOT NULL,
  `IdCompte` int(100) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `Latitude` decimal(9,6) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Etat` int(11) NOT NULL,
  `TypeDeService` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `toilette`
--

INSERT INTO `toilette` (`IdToilette`, `IdCompte`, `Longitude`, `Latitude`, `Description`, `Etat`, `TypeDeService`) VALUES
(1, 1, '2.174030', '41.403380', 'Un lieu', 1, 1),
(2, 1, '-73.598099', '45.542427', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 1, 1),
(3, 1, '-73.636093', '45.519338', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 0, 2),
(4, 1, '-73.600464', '45.490464', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 1, 0),
(5, 1, '-73.649349', '45.480447', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 0, 1),
(6, 1, '-73.491211', '45.520301', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 0, 2),
(7, 1, '-73.491211', '45.520301', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 0, 2),
(8, 1, '-73.485718', '45.488057', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 1, 1),
(9, 1, '-73.485718', '45.488057', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 1, 0),
(10, 1, '-73.873901', '45.667805', 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. Avantage du Lorem Ipsum sur un texte générique.', 1, 0),


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
  MODIFY `IdCommentaire` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `IdCompte` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `toilette`
--
ALTER TABLE `toilette`
  MODIFY `IdToilette` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
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
