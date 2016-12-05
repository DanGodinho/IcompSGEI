-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 02/12/2016 às 17:14
-- Versão do servidor: 5.7.16-0ubuntu0.16.04.1
-- Versão do PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `GerenciamentoDeEquipamentos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `j17_cautela`
--

CREATE TABLE `j17_cautela` (
  `idCautela` int(11) NOT NULL,
  `NomeResponsavel` varchar(50) NOT NULL,
  `OrigemCautela` varchar(50) NOT NULL,
  `DataDevolucao` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `ValidadeCautela` varchar(50) DEFAULT NULL,
  `TelefoneResponsavel` varchar(50) NOT NULL,
  `ImagemCautela` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `j17_descarte_equipamento`
--

CREATE TABLE `j17_descarte_equipamento` (
  `idDescarte` int(11) NOT NULL,
  `NomeResponsavel` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `TelefoneResponsavel` varchar(50) NOT NULL,
  `ObservacoesDescarte` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `j17_emprestimo`
--

CREATE TABLE `j17_emprestimo` (
  `idEquipamento` int(11) NOT NULL,
  `idCautela` int(11) NOT NULL,
  `DataEmprestimo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `j17_equipamento`
--

CREATE TABLE `j17_equipamento` (
  `idEquipamento` int(11) NOT NULL,
  `NomeEquipamento` varchar(50) NOT NULL,
  `Nserie` varchar(50) DEFAULT NULL,
  `NotaFiscal` varchar(50) NOT NULL,
  `Localizacao` varchar(50) NOT NULL,
  `StatusEquipamento` varchar(50) NOT NULL,
  `OrigemEquipamento` varchar(50) NOT NULL,
  `ImagemEquipamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `j17_cautela`
--
ALTER TABLE `j17_cautela`
  ADD PRIMARY KEY (`idCautela`);

--
-- Índices de tabela `j17_descarte_equipamento`
--
ALTER TABLE `j17_descarte_equipamento`
  ADD PRIMARY KEY (`idDescarte`);

--
-- Índices de tabela `j17_emprestimo`
--
ALTER TABLE `j17_emprestimo`
  ADD PRIMARY KEY (`idEquipamento`,`idCautela`),
  ADD KEY `idCautela` (`idCautela`);

--
-- Índices de tabela `j17_equipamento`
--
ALTER TABLE `j17_equipamento`
  ADD PRIMARY KEY (`idEquipamento`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `j17_cautela`
--
ALTER TABLE `j17_cautela`
  MODIFY `idCautela` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `j17_descarte_equipamento`
--
ALTER TABLE `j17_descarte_equipamento`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `j17_equipamento`
--
ALTER TABLE `j17_equipamento`
  MODIFY `idEquipamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `j17_emprestimo`
--
ALTER TABLE `j17_emprestimo`
  ADD CONSTRAINT `j17_emprestimo_ibfk_1` FOREIGN KEY (`idEquipamento`) REFERENCES `j17_equipamento` (`idEquipamento`),
  ADD CONSTRAINT `j17_emprestimo_ibfk_2` FOREIGN KEY (`idCautela`) REFERENCES `j17_cautela` (`idCautela`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
