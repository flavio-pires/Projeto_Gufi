USE Gufi_manha;
GO

--inserir dados dentro das tabelas / informar a tabela e depois a coluna que ser� inserido o dado
INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES ('Administrador'),
	   ('Comum');
GO

INSERT INTO TipoEvento (TituloTipoEvento)
VALUES ('C#'),
	   ('React'),
	   ('SQL');
GO

INSERT INTO Instituicao (CNPJ, NomeFantasia, Endereco)
VALUES ('12345678901234','Escola SENAI de Inform�tica','Alameda Bar�o de Limeira,538');
GO

INSERT INTO Usuario (Nome, Email, Senha, DataCadastro, Genero,IdTipoUsuario)
VALUES ('Administrador','adm@adm.com','adm123','06/02/2020','N�o informado',1),
	   ('Carol','carol@email.com','carol123','06/02/2020','Feminino',2),
	   ('Saulo','saulo@email.com','saulo123','06/02/2020','Masculino',2);
GO

INSERT INTO Evento (NomeEvento, DataEvento, Descricao, AcessoLivre, IdInstituicao, IdTipoEvento)
VALUES ('Orienta��o a objetos','07/02/2020','Conceitos sobre os pilares da programa��o orientada a objetos',1,1,1),
	   ('Ciclo de vida','08/02/2020','Como utilizar os ciclos de vida com a biblioteca ReactUs',0,1,2),
	   ('Indtrodu��o a SQL','09/02/2020','Comandos b�sicos utilizando SQL Server',1,1,3);
GO

INSERT INTO Presenca (IdUsuario, IdEvento, Situacao)
VALUES (2,2,'Confirmada'),
	   (2,3,'N�o confirmada'),
	   (3,1,'Confirmada');
GO