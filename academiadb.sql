CREATE DATABASE bd1_academia;

USE bd1_academia;

--CRIAÇÂO DE TABELAS 
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
    
    cpf VARCHAR(64),
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

CREATE TABLE Aluno(

    cpf VARCHAR(64),
    nome VARCHAR(64),
    plano VARCHAR(64),
    email VARCHAR(64),
    data_nasc DATE,
    cep VARCHAR(64),
    logradouro VARCHAR(64),
    bairro VARCHAR(64),
    cnpj_a VARCHAR(20),
    codTreino INTEGER,
    
    PRIMARY KEY(cpf),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj),
    FOREIGN KEY (codTreino) REFERENCES Treino(codigo)
);

CREATE TABLE Equipamento(
    
    codigo VARCHAR(64),
    descricao VARCHAR(256),
    data_comp DATE,
    data_ven DATE,
    preco_comp FLOAT,
    preco_ven FLOAT,
    cnpj_a VARCHAR(20),
    
    PRIMARY KEY (codigo),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
);

CREATE TABLE SalaDanca(
    
    numero INTEGER,
    cnpj_a VARCHAR(20),
    
    PRIMARY KEY (numero),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
);

CREATE TABLE Treino(
    
    cpf_Aluno VARCHAR(20),
    cpf_Fun VARCHAR(20),
    codigo INTEGER,
    
    PRIMARY KEY(codigo),
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf),
    FOREIGN KEY (cpf_fun) REFERENCES Funcionario(cpf)
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

CREATE TABLE Treino_Exerc(
    
    codTreino INTEGER,
    exercicio VARCHAR(64),
    
    PRIMARY KEY (exercicio),
    FOREIGN KEY (codTreino) REFERENCES Treino(codigo)

);

CREATE TABLE Tel_Academia(

    cnpj_academia INTEGER,
    telefone INTEGER,
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cnpj_academia) REFERENCES Academia(cnpj)
);

CREATE TABLE Tel_Aluno(

    cpf_Aluno INTEGER,
    telefone INTEGER,
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)

);

CREATE TABLE Tel_Funcionario(

    cpf_Func INTEGER,
    telefone INTEGER,
    
    PRIMARY KEY (telefone),
    FOREIGN KEY (cpf_Func) REFERENCES Funcionario(cpf)
);

CREATE TABLE Aluno_Func(
    
    cpf_Func INTEGER,
    cpf_Aluno INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf),
    FOREIGN KEY (cpf_Func) REFERENCES Funcionario(cpf)
);

CREATE TABLE Aluno_Equipa(
    
    cpf_Aluno INTEGER,
    cod_equipa INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf),
    FOREIGN KEY (cod_equipa) REFERENCES Equipamento(codigo)
);

CREATE TABLE Aluno_Sala(
    
    cpf_Aluno INTEGER,
    numero_Sala INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf),
    FOREIGN KEY (numero_Sala) REFERENCES SalaDanca(numero)
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

#Inserts Equipamento
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, cnpj_a)
	VALUES('001-a', 'Pulley', '2015-05-29', '', 4500.50, '','12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, cnpj_a)
	VALUES('001-b', 'Supino', '2016-03-02', '', 3789.30, '','12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, cnpj_a)
	VALUES('001-c', 'Desenvolvimento', '2015-08-09', '', 3500.00, '','12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, cnpj_a)
	VALUES('002-a', 'Leg Horizontal', '2015-07-23', '', 2800.50, '','12345678/9101-11');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, cnpj_a)
	VALUES('002-b', 'Cadeira Extensora', '2015-07-19', '', 2998.89, '','12345678/9101-11');
    
#Inserts SalaDanca
INSERT INTO SalaDanca (numero, cnpj_a)
	VALUES(1,'12345678/9101-11');
    
INSERT INTO SalaDanca (numero, cnpj_a)
	VALUES(2,'12345678/9101-11');
    
INSERT INTO SalaDanca (numero, cnpj_a)
	VALUES(3,'12345678/9101-11');
    
#Inserts Treino
INSERT INTO Treino (cpf_aluno, cpf_fun, codigo)
	VALUES('789102345/35','050622879/03',001);
    
INSERT INTO Treino (cpf_aluno, cpf_fun, codigo)
	VALUES('289789345/05','998822564/97',002);
    
INSERT INTO Treino (cpf_aluno, cpf_fun, codigo)
	VALUES('196378345/51','050622879/03',003);
    
INSERT INTO Treino (cpf_aluno, cpf_fun, codigo)
	VALUES('682308725/99','998822564/97',004);

INSERT INTO Treino (cpf_aluno, cpf_fun, codigo)
	VALUES('456997420/55','050622879/03',005);
    
#Inserts Musculacao    
INSERT INTO Musculacao (cod_treino, tempo_descanco)
	VALUES(002, '00:01:00');
    
INSERT INTO Musculacao (cod_treino, tempo_descanco)
	VALUES(004, '00:00:30');
    
INSERT INTO Musculacao (cod_treino, tempo_descanco)
	VALUES(005, '00:01:30');
    
#Inserts Danca
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(001, '00:30:00');
    
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(003, '00:60:00');    

    
#Inserts Treino_Exerc
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Bíceps e peito');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Tríceps e costas');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Pernas e ombros');
    
 INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Bíceps e peito');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Tríceps e costas');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Pernas e ombros');   
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Bíceps e peito');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Tríceps e costas');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Pernas e ombros');    
    
#Inserts Tel_Academia
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', 16994442976);
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', 1634201827);    

#Inserts Tel_Aluno
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('789102345/35', 16992451077);
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('789102345/35', 1634100638);
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('289789345/05', 16991039080);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('289789345/05', 1634155833);
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('196378345/51', 16993121199);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('196378345/51', 1634116045);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('682308725/99', 16991731423);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('682308725/99', 1634463119);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('456997420/55', 16995175300);

INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('456997420/55', 1634546018);

#Inserts Tel_Funcionario
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('345622778/56', 16991586800);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('345622778/56', 1634457628);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('050622879/03', 16991649301);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('050622879/03', 1634946734);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('585721998/14',16998335003);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('585721998/14', 1634963852);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('998822564/97',16992301300);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('998822564/97', 1634952147);

INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('108945622/65',16995175300);
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('108945622/65', 1634494639);   
    
#Inserts Aluno_Func
INSERT INTO Aluno_Func ( cpf_aluno, cpf_funcionario)
	VALUES('789102345/35','050622879/03');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_funcionario)
	VALUES('289789345/05','998822564/97');

INSERT INTO Aluno_Func ( cpf_aluno, cpf_funcionario)
	VALUES('196378345/51','050622879/03');

INSERT INTO Aluno_Func ( cpf_aluno, cpf_funcionario)
	VALUES('682308725/99','998822564/97');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_funcionario)
	VALUES('456997420/55','050622879/03');
    
#Inserts Aluno_Equipa
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05','001-a');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05','001-b');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05','001-c');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05','002-a');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05','002-b');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99','001-a');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99','001-b');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99','001-c');

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99','002-a');

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99','002-b');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55','001-a');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55','001-b');

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55','001-c');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55','002-a');
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55','002-b');

#Inserts Aluno_Sala
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('789102345/35', 1);
        
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('196378345/51', 3);
    
