--Cria o banco de dados com o nome Gufi
CREATE DATABASE Gufi_manha;
GO

--Define o banco de dados que sesr� utilizado
USE Gufi_manha;
GO

--Criar as tabelas do banco de dados
CREATE TABLE TipoUsuario (
	IdTipoUsuario	  INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE TipoEvento (
	IdTipoEvento	 INT PRIMARY KEY IDENTITY,
	TituloTipoEvento VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Instituicao (
	IdInstituicao INT PRIMARY KEY IDENTITY,
	CNPJ		  CHAR (14) NOT NULL UNIQUE,
	NomeFantasia  VARCHAR (255) NOT NULL UNIQUE
	Endereco	  VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Usuario (
	IdUsuario    INT PRIMARY KEY IDENTITY,
	Nome	     VARCHAR (255) NOT NULL,
	Email	     VARCHAR (255) NOT NULL UNIQUE,
	Senha	     VARCHAR (255) NOT NULL,
	DataCadastro DATETIME2,
	Genero		 VARCHAR (255),

	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTIpoUsuario)
);
