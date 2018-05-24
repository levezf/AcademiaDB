#DROPS 
#DROP DATABASE bd1_academia;
#DROP TABLE Academia;
#DROP TABLE Funcionario;
#DROP TABLE Equipamento;
#DROP TABLE Sala_Danca;
#DROP TABLE Musculacao;
#DROP TABLE Danca;
#DROP TABLE Aluno;
#DROP TABLE Treino;
#DROP TABLE Treino_Exerc;
#DROP TABLE Tel_Aluno;
#DROP TABLE Tel_Funcionario;
#DROP TABLE Tel_Academia;
#DROP TABLE Aluno _Equipa;
#DROP TABLE Aluno_Func;
#DROP TABLE Aluno_Sala;

CREATE DATABASE bd1_academia;

USE bd1_academia;

#CRIAÇÂO DE TABELAS 
CREATE TABLE Academia(
    
    cnpj VARCHAR(20),
    nome VARCHAR(64),
    cep VARCHAR(20),
    logradouro VARCHAR(64),
    bairro VARCHAR(64),
    num INTEGER,
    
    PRIMARY KEY (cnpj)
);

CREATE TABLE Funcionario(
    
    cpf VARCHAR(20),
    nome VARCHAR(64),
    cargo VARCHAR(64),
    email VARCHAR(64),
    carga_ho VARCHAR(64),
    cep VARCHAR(64),
    logradouro VARCHAR(64),
    bairro VARCHAR(64),
    cnpj_a VARCHAR(20),
    
    PRIMARY KEY(cpf),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
);

CREATE TABLE Equipamento(
    
    codigo INTEGER,
    descricao VARCHAR(256),
    data_comp DATE,
    data_ven DATE,
    preco_comp FLOAT,
    preco_ven FLOAT,
    cnpj_a VARCHAR(20),
    
    PRIMARY KEY (codigo),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);

CREATE TABLE Sala_Danca(
    
    numero INTEGER,
    cnpj_a VARCHAR(20),
    
    PRIMARY KEY (numero),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);

CREATE TABLE Musculacao(
    
    cod_Treino INTEGER,
    tempo_descanso TIME,
    
    PRIMARY KEY(cod_Treino)
);

CREATE TABLE Danca(
    
    cod_Treino INTEGER,
    tempo_Aula TIME,
    
    PRIMARY KEY(cod_treino)
);

CREATE TABLE Aluno(

    cpf VARCHAR(20),
    nome VARCHAR(64),
    plano VARCHAR(64),
    email VARCHAR(64),
    data_nasc DATE,
    cep VARCHAR(64),
    logradouro VARCHAR(64),
    bairro VARCHAR(64),
    cnpj_a VARCHAR(20),
    cod_treino INTEGER,
    
    PRIMARY KEY(cpf),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);

CREATE TABLE Treino(
    
    cpf_aluno VARCHAR(20),
    cpf_fun VARCHAR(20),
    codigo INTEGER,
    
    PRIMARY KEY(codigo),
    FOREIGN KEY (cpf_fun) REFERENCES Funcionario(cpf)
		ON DELETE CASCADE
);

CREATE TABLE Treino_Exerc(
    
    cod_treino INTEGER,
    exercicio VARCHAR(64),
    
    FOREIGN KEY (cod_treino) REFERENCES Treino(codigo)
		ON DELETE CASCADE
);

CREATE TABLE Tel_Aluno(

    cpf_aluno VARCHAR(20),
    telefone VARCHAR(20),
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf) 
		ON DELETE CASCADE

);

CREATE TABLE Tel_Funcionario(

    cpf_Func VARCHAR(20),
    telefone VARCHAR(20),
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cpf_Func) REFERENCES Funcionario(cpf)
		ON DELETE CASCADE

);

CREATE TABLE Tel_Academia(

    cnpj_a VARCHAR(20),
    telefone VARCHAR(20),
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);

CREATE TABLE Aluno_Func(
    
    cpf_Func VARCHAR(20),
    cpf_Aluno VARCHAR(20),
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
		ON DELETE CASCADE,

    FOREIGN KEY (cpf_Func) REFERENCES Funcionario(cpf)
		ON DELETE CASCADE

);

CREATE TABLE Aluno_Equipa(
    
    cpf_Aluno VARCHAR(20),
    cod_equipa INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
 		ON DELETE CASCADE,
 
	FOREIGN KEY (cod_equipa) REFERENCES Equipamento(codigo)
		ON DELETE CASCADE

);

CREATE TABLE Aluno_Sala(
    
    cpf_Aluno VARCHAR(20),
    numero_Sala INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
		ON DELETE CASCADE,

	FOREIGN KEY (numero_Sala) REFERENCES Sala_Danca(numero)
		ON DELETE CASCADE

);




#INSERTS

#Inserts Academia
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('12345678/9101-11', 'FullMaster', '12312-100', 'Av. 5', 'Centro', 72);

#Inserts Funcionario
INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('345622778/56', 'Reginaldo', 'Atendente','regi_45@yahoo.com.br', 4, '12143-100', 'Rua Holanda', 'Ararate', '12345678/9101-11');

INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('050622879/03', 'Luana', 'Instrutora','lulu_s2@live.com', 4, '12342-100', 'Rua Palmeiras', 'Mundinho', '12345678/9101-11');
    
INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('585721998/14', 'Mariana', 'Atendente','mari97@gmail.com', 6, '12332-100', 'Rua Oliveiras', 'Jardim Celestial', '12345678/9101-11');

INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('998822564/97', 'Lucas', 'Instrutor','lucasfg@outlook.com', 8, '12312-100', 'Av. 3', 'Centro', '12345678/9101-11');
    
INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('108945622/65', 'Vanderlei', 'Faxineiro','vander_silva@gmail.com', 8, '12302-100', 'Rua 12', 'Setor Oeste', '12345678/9101-11');


#Inserts Treino
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(001, '789102345/35','108945622/65');

INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(002, '289789345/05','050622879/03');

INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(003, '289789345/05','585721998/14');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(004, '196378345/51','345622778/56');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(005, '682308725/99','345622778/56');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(006, '456997420/55','108945622/65');
    



#Inserts Aluno
INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('789102345/35', 'Patricia', 'Comum', 'pati_rn@gmail.com','1985-04-16', '12442-100', 'Rua Anápolis', 'Vila Operadora','12345678/9101-11', 001);

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('289789345/05', 'Roberto', 'VIP', 'robertolima@live.com','1977-07-07', '12432-100', 'Rua Portugal', 'Novo Horizonte','12345678/9101-11', 002);
    
INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('196378345/51', 'Nathalia', 'VIP', 'nati_atalah@gmail.com','1994-01-21', '12422-100', 'Rua Doutor Frank', 'Arnold Schwarzenegger','12345678/9101-11', 003);

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('682308725/99', 'Jéssica', 'Comum', 'jessy.oliveira@outlook.com','1990-11-01', '12542-100', 'Av. Bandeirantes', 'Jardim Paraíso','12345678/9101-11', 004);

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('456997420/55', 'Adriano', 'VIP', 'a.carvalho@yahoo.com.br','1980-08-26', '12312-100', 'Centro', 'Av. 3','12345678/9101-11', 005);

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('458459779/48', 'Felipe', 'Comum', 'fe.fe@yahoo.com.br','1989-07-07', '12312-100', 'Centro', 'Av. 3','12345678/9101-11', null);

ALTER TABLE Treino ADD FOREIGN KEY (cpf_aluno) REFERENCES Aluno(cpf) ON DELETE CASCADE;

ALTER TABLE Aluno ADD FOREIGN KEY (cod_treino) REFERENCES Treino(codigo) ON DELETE CASCADE;

#Inserts Equipamento
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(001, 'Pulley', '2015-05-29', null, 4500.50, null, '12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(002, 'Supino', '2016-03-02', null, 3789.30, null,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(003, 'Desenvolvimento', '2015-08-09', null, 3500.00, null,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(004, 'Leg Horizontal', '2015-07-23', null, 2800.50, null,'12345678/9101-11');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(005, 'Cadeira Extensora', '2015-07-19', null, 2998.89, null,'12345678/9101-11');
    
#Inserts Sala_Danca
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(1,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(2,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(3,'12345678/9101-11');
    

    
#Inserts Musculacao    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(002, '00:01:00');
    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(004, '00:00:30');
    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(005, '00:01:30');
    
#Inserts Danca
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(001, '00:30:00');
    
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(002, '01:00:00');    

    
#Inserts Treino_Exerc
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Leg 45');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Abdominal Supra');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Agachamento na bola');
    
 INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Rosca Alternada');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Pulldown');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Tríceps Corda');   
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Tríceps Polia');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(006, 'Agachamento Livre');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Supino Reto');  
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Supino Reto');  

#Inserts Tel_Academia
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', '1694442976');
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', '1634201827');    

#Inserts Tel_Aluno
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('789102345/35', '16992451077');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('789102345/35', '1634100638');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('289789345/05', '16991039080');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('289789345/05', '1634155833');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('196378345/51', '16993121199');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('196378345/51', '1634116045');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('682308725/99', '16991731423');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('682308725/99', '1634463119');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('456997420/55', '16995175300');

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('456997420/55', '1634546018');

#Inserts Tel_Funcionario
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('345622778/56', '16991586800');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('345622778/56', '1634457628');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('050622879/03','16991649301');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('050622879/03', '1634946734');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('585721998/14','16998335003');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('585721998/14', '1634963852');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('998822564/97','16992301300');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('998822564/97', '1634952147');

INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('108945622/65','16995175300');
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('108945622/65', '1634494639');   
    
#Inserts Aluno_Func
INSERT INTO Aluno_Func (cpf_aluno, cpf_func)
	VALUES('789102345/35','050622879/03');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('289789345/05','998822564/97');

INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('196378345/51','050622879/03');

INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('682308725/99','998822564/97');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('456997420/55','050622879/03');
    
#Inserts Aluno_Equipa
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',001);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',002);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',003);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',004);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',005);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',001);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',002);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',003);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',004);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',005);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',001);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',002);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',003);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',004);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',005);

#Inserts Aluno_Sala
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('789102345/35', 1);
        
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('196378345/51', 3);
    
    
# SELECTS *
SELECT * FROM Academia;
SELECT * FROM Funcionario;
SELECT * FROM Equipamento;
SELECT * FROM Sala_Danca;
SELECT * FROM Musculacao;
SELECT * FROM Danca;
SELECT * FROM Aluno;
SELECT * FROM Treino;
SELECT * FROM Treino_Exerc;
SELECT * FROM Tel_Aluno;
SELECT * FROM Tel_Funcionario;
SELECT * FROM Tel_Academia;
SELECT * FROM Aluno _Equipa;
SELECT * FROM Aluno_Func;
SELECT * FROM Aluno_Sala;
    
    
#UPDATES
UPDATE Tel_Aluno SET telefone = '1634135997' WHERE cpf_aluno ='196378345/51' AND telefone = '1634116045';
UPDATE Sala_Danca SET numero = 11 WHERE cnpj_a = '12345678/9101-11' AND numero = 2;
UPDATE Treino_Exerc SET exercicio = 'Supino Declinado' WHERE cod_treino = 2 AND LOWER(exercicio) = 'leg 45';
UPDATE Tel_Funcionario SET telefone = '1634165100' WHERE cpf_func = '050622879/03' AND telefone = '1634946734';
UPDATE Tel_Academia SET telefone = '1933727333' WHERE cnpj_a = '12345678/9101-11' AND telefone='1634201827';

#DELETES
DELETE FROM Tel_Aluno WHERE telefone = '1634135997' AND cpf_aluno = '196378345/51';;
DELETE FROM Treino WHERE codigo = 1 AND cpf_fun = '108945622/65' AND cpf_aluno = '789102345/35';
DELETE FROM Aluno WHERE cpf = '789102345/35';
DELETE FROM Equipamento WHERE codigo = 001;
DELETE FROM Funcionario WHERE cpf = '108945622/65';



#Consultas

# Qual o tempo médio de descanso para musculacao? 
SELECT SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(tempo_descanso)),2)) AS 'Media: Tempo de Descanso' FROM Musculacao;

# Há quantos alunos cadastrados?
SELECT COUNT(*) AS 'Quantidade de Alunos Cadastrados' FROM Aluno;

# Qual a maior duracao das aulas de dança?
SELECT MAX(tempo_aula) FROM Danca;

# Qual a menor duracao das aulas de dança?
SELECT MIN(tempo_aula) FROM Danca;

# Qual o valor total gasto em equipamentos por mes?
SELECT ROUND(SUM(preco_comp),2) AS 'Valor total gasto com Equipamentos' FROM Equipamento;

# Liste o nome de todos os alunos de musculação que tenham o exercicio 'Supino reto' em seu treino.
SELECT a.nome AS 'Nome do Aluno' FROM Aluno a
	JOIN Treino t
		ON a.cod_treino = t.codigo
	JOIN Treino_Exerc te
		ON t.codigo = te.cod_treino
	WHERE LOWER(te.exercicio) LIKE 'supino reto';

#Liste a quantidade de treinos que cada exercicio está presente.
SELECT te.exercicio AS 'Nome do Exercicio', COUNT(t.codigo) AS 'Quantidade de treinos'
	FROM Treino_Exerc te
		JOIN Treino t
			ON t.codigo = te.cod_treino
		GROUP BY te.exercicio;

#Liste o nome de todos os alunos e o codigo de seu treino (caso exista).
SELECT a.nome AS 'Nome Aluno', IFNULL(t.codigo, '-') AS 'Codigo Treino' FROM Aluno a
	LEFT JOIN Treino t
		ON t.codigo = a.cod_treino;

#Liste o nome de todos os funcionarios e os codigos dos treinos que ele orienta (caso exista).
SELECT f.nome AS 'Nome Funcionario', IFNULL(t.codigo, '-') AS 'Codigo Treino' FROM Treino t
	RIGHT JOIN Funcionario f
		ON f.cpf = t.cpf_fun;
        
# Liste o nome de todos os alunos de musculação que não tenha o exercicio 'Supino reto' nem 'Supino Declinado' em seu treino.
SELECT DISTINCT a.nome AS 'Nome do Aluno' FROM Aluno a
	JOIN Treino t
		ON a.cod_treino = t.codigo
	JOIN Treino_Exerc te
		ON t.codigo = te.cod_treino
	WHERE LOWER(te.exercicio) NOT IN ('supino reto', 'supino declinado');
    
#Mostre o(s) nome(s) do(s) funcionario(s) que orienta(m) mais treinos. Utilize a expressão ALL
SELECT f.nome AS 'Nome Funcionario' FROM Treino t
	JOIN Funcionario f
		ON f.cpf = t.cpf_fun
	GROUP BY f.nome
    HAVING COUNT(t.codigo) >= ALL (SELECT COUNT(t.codigo) FROM Treino t
										JOIN Funcionario f
											ON f.cpf = t.cpf_fun
										GROUP BY f.nome);
                                        
#Mostre o nome de todos os alunos matriculados na musculacao(Use a expresão ANY ou SOME).
SELECT a.nome FROM Aluno a 
	JOIN Treinodepartamento
