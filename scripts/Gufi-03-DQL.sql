USE Gufi_manha;
GO

--listar todos os usuários cadastrados
SELECT Nome, Email, Senha, DataCadastro, Genero, TituloTipoUsuario FROM Usuario
INNER JOIN TipoUsuario ON Usuario.IdTipoUsuario = TipoUsuario.IdTipoUsuario;

--listar todas as instituições cadastradas
SELECT CNPJ, NomeFantasia, Endereco FROM Instituicao;

--listar todos os tipos de eventos
SELECT TituloTipoEvento FROM TipoEvento;

--listar todos os eventos
SELECT NomeFantasia, TituloTipoEvento, NomeEvento, Descricao, DataEvento, AcessoLivre  FROM Evento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento;

--listar apenas os eventos que são públicos
SELECT NomeFantasia, TituloTipoEvento, NomeEvento, Descricao, DataEvento, AcessoLivre  FROM Evento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
WHERE AcessoLivre = 1;

--listar todos os eventos que um determinado usuário participa e que está com a situação confirmada
SELECT NomeFantasia, TituloTipoEvento, NomeEvento, Descricao, DataEvento, AcessoLivre, Nome FROM Presenca
INNER JOIN Evento ON Presenca.IdEvento = Evento.IdEvento
INNER JOIN Usuario ON Presenca.IdUsuario = Usuario.IdUsuario
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento
WHERE Nome = 'Carol' AND Situacao = 'Confirmada';

--Extra
--Ao listar os eventos, mostrar na coluna AcessoLivre o valor "Publico" quando for 1 e "Privado" quando for 0
SELECT NomeFantasia, TituloTipoEvento, NomeEvento, Descricao, DataEvento,
CASE AcessoLivre
	WHEN 1 THEN 'Público'
	WHEN 0 THEN 'Privado'
END AS AcessoLivre
FROM Evento
INNER JOIN Instituicao ON Evento.IdInstituicao = Instituicao.IdInstituicao
INNER JOIN TipoEvento ON Evento.IdTipoEvento = TipoEvento.IdTipoEvento;


