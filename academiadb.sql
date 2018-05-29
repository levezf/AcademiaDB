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
    
    PRIMARY KEY(cpf, cnpj_a),
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
    
    PRIMARY KEY (codigo, cnpj_a),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);
CREATE TABLE Sala_Danca(
    
    numero INTEGER,
    cnpj_a VARCHAR(20),
    
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj) ON DELETE CASCADE,
    PRIMARY KEY(numero, cnpj_a)
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
    
    PRIMARY KEY(cpf, cnpj_a),
    FOREIGN KEY (cnpj_a) REFERENCES Academia(cnpj)
		ON DELETE CASCADE

);

CREATE TABLE Treino(
    
    cpf_aluno VARCHAR(20),
    cpf_fun VARCHAR(20),
    codigo INTEGER,
    
    PRIMARY KEY(codigo, cpf_aluno, cpf_fun)
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
    
    PRIMARY KEY (telefone)

);
ALTER TABLE Tel_Academia ADD FOREIGN KEY(cnpj_a) REFERENCES Academia(cnpj) ON DELETE CASCADE;

CREATE TABLE Aluno_Func(
    
    cpf_Func VARCHAR(20),
    cpf_Aluno VARCHAR(20),
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
		ON DELETE CASCADE
);
ALTER TABLE Aluno_Func ADD FOREIGN KEY(cpf_Func) REFERENCES Funcionario(cpf) ON DELETE CASCADE;


CREATE TABLE Aluno_Equipa(
    
    cpf_Aluno VARCHAR(20),
    cod_equipa INTEGER,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
 		ON DELETE CASCADE
);
ALTER TABLE Aluno_Equipa ADD FOREIGN KEY(cod_equipa) REFERENCES Equipamento(codigo) ON DELETE CASCADE;


CREATE TABLE Aluno_Sala(
    
    cpf_Aluno VARCHAR(20),
    numero_Sala INTEGER,
    
    FOREIGN KEY (numero_sala) REFERENCES Sala_Danca(numero) 
		ON DELETE CASCADE,
    
    FOREIGN KEY (cpf_Aluno) REFERENCES Aluno(cpf)
		ON DELETE CASCADE

);




#INSERTS

#Inserts Academia
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('12345678/9101-11', 'FullMaster', '12312-100', 'Av. 5', 'Centro', 72);
    
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('12345678/0191-12', 'FullMaster', '12311-100', 'Piccola Italia', 'Jardim Italia', 350);

    
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('12765678/1256-98', 'FullMaster', '15494-120', 'Miguel Petroni', 'Santa Paula', 78);

    
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('17845678/1235-36', 'FullMaster', '12450-180', 'Abraão João', 'Jardim Bandeirantes', 275);

    
INSERT INTO Academia (cnpj, nome, cep, logradouro, bairro, num)
	VALUES('14745678/3278-02', 'FullMaster', '16358-190', 'Miguel João','Jardim Bandeirantes', 272);

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
	VALUES('108945622/65', 'Vanderlei', 'Faxineiro','vander_silva@gmail.com', 4, '12302-100', 'Rua 12', 'Setor Oeste', '12345678/9101-11');

INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('019854226/66', 'Larissa', 'Gerente','la.marins@live.com', 8, '12350-100', 'Av. das Nações Unidas', 'Jardim Pinheiros', '12345678/9101-11');

INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('678045622/85', 'Vanderlei', 'Faxineiro','vander_silva@gmail.com', 4, '12302-100', 'Rua 12', 'Setor Oeste', '12345678/9101-11');

INSERT INTO Funcionario (cpf, nome, cargo, email, carga_ho, cep, logradouro, bairro, cnpj_a)
	VALUES('899854226/24', 'Larissa', 'Gerente','la.marins@live.com', 8, '12350-100', 'Av. das Nações Unidas', 'Jardim Pinheiros', '12345678/9101-11');


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
	VALUES(006, '584559999/04','108945622/65');

INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(007, '584559999/08','108945622/65');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(008, '364447799/84','345622778/56');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(009, '053990799/14','585721998/14');
    
INSERT INTO Treino(codigo, cpf_aluno, cpf_fun)
	VALUES(010, '052007197/09','585721998/14');

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
    
INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('448549997/44', 'Nadia', 'VIP', 'nadia_88@gmail.com','1988-09-25', '12421-100', 'Jardim das Araucárias', 'Rua Albert Einstein','12345678/9101-11', null);
        
INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('584559999/04', 'João', 'VIP', 'jo.carlos@yahoo.com.br','2000-02-16', '12241-100', 'Vista Boa', 'Rua Miguel Lima','12345678/9101-11', 006);    

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('584559999/08', 'Sara', 'Comum', 'sarinha_97@live.com','1997-02-16', '12214-100', 'Barra Funda', 'Rua do Descobrimento','12345678/9101-11', 007);      
    
INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('364447799/84', 'Amanda', 'VIP', 'amandarocha@outlook.com','1997-02-16', '12244-100', 'Brooklin', 'Av. dos Trabalhadores','12345678/9101-11', 008);  

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('053990799/14', 'Ricardo', 'Comum', 'ricar_matos@gmail.com','1997-02-16', '12312-100', 'Centro', 'Rua 10','12345678/9101-11', 009);  

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('052007197/09', 'Bianca', 'VIP', 'bibiricca@yahoo.com.br','1994-09-02', '12311-100', 'Liberdade', 'Rua Ana Berck','12345678/9101-11', 010);  

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('753007197/09', 'Julia', 'VIP', 'ju@gmail.com.br','1994-09-02', '12311-100', 'Liberdade', 'Rua Ana Berck','12345678/0191-12', 001);  

INSERT INTO Aluno (cpf, nome, plano, email, data_nasc, cep, logradouro, bairro, cnpj_a, cod_treino)
	VALUES('806097197/10', 'Giovana Solo', 'VIP', 'gi.solo@yahoo.com.br','1994-09-02', '12311-100', 'Liberdade', 'Rua Ana Berck','12345678/0191-12', 002);  


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
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(006, 'Gravitation', '2011-07-19','2013-10-15' , 3059.60, 1500.30,'12345678/9101-11');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(007, 'Gravitation', '2013-11-05', null, 4560.39, null,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(008, 'Máquina Scott', '2013-06-26','2015-03-20', 2600.00, 1800.50,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(009, 'Seated Leg Curl', '2011-07-21',null, 4905.50, null,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(010, 'Barras', '2014-07-21',null, 3560.50, null,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(011, 'Cross Over', '2013-05-17','2014-01-12', 5000.50, 3500,'12345678/9101-11');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(012, 'Cross Over', '2014-03-1',null, 8500.50, null,'12345678/9101-11');    

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(013, 'Alteres', '2014-07-21',null, 3845.50, null,'12345678/9101-11');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(014, 'Bancos multiposicões', '2014-07-21',null, 5000.50, null,'12345678/9101-11');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(015, 'Máquina Scott', '2015-02-13',null, 3154.30, null,'12345678/9101-11');



INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(001, 'Alteres', '2014-07-21',null, 3845.50, null,'12345678/0191-12');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(002, 'Bancos multiposicões', '2014-07-21',null, 5000.50, null,'12345678/0191-12');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(003, 'Máquina Scott', '2015-02-13',null, 3154.30, null,'12345678/0191-12');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(004, 'Máquina Scott', '2015-02-13',null, 3154.30, null,'12345678/0191-12');
    

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(001, 'Alteres', '2014-07-21',null, 3845.50, null,'12765678/1256-98');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(002, 'Bancos multiposicões', '2014-07-21',null, 5000.50, null,'12765678/1256-98');

INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(003, 'Máquina Scott', '2015-02-13',null, 3154.30, null,'12765678/1256-98');
    
INSERT INTO Equipamento (codigo, descricao, data_comp, data_ven, preco_comp, preco_ven, cnpj_a)
	VALUES(004, 'Máquina Scott', '2015-02-13',null, 3154.30, null,'12765678/1256-98');
    

#Inserts Sala_Danca
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(1,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(2,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(3,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(4,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(5,'12345678/9101-11');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(1,'12345678/0191-12');

INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(2,'12345678/0191-12');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(3,'12345678/0191-12');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(4,'12345678/0191-12');
    
INSERT INTO Sala_Danca (numero, cnpj_a)
	VALUES(5,'12345678/0191-12');
    
#Inserts Musculacao    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(002, '00:01:00');
    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(004, '00:00:30');
    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(005, '00:01:30');
    
INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(007, '00:00:45');

INSERT INTO Musculacao (cod_treino, tempo_descanso)
	VALUES(009, '00:01:30');
            
#Inserts Danca
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(001, '00:30:00');
    
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(003, '01:00:00');
    
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(006, '00:45:00');
    
INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(008, '00:45:00');

INSERT INTO Danca (cod_treino, tempo_aula)
	VALUES(010, '00:35:00');  
    
#Inserts Treino_Exerc
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Leg 45');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Abdominal Supra');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Agachamento bola');
    
 INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Rosca Alternada');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Pulldown');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Tríceps Corda');   
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Tríceps Polia');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(002, 'Agachamento Livre');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Supino Reto');  
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, 'Desenvolvimento');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(004, ' Rosca Scoot com halter'); 

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Rosca em polia baixa'); 

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Rosca concentrada'); 

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Press Francês');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(005, 'Extensões de tríceps sentado');

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(007, 'Puxada de tríceps corda');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(007, 'Polia alta');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(009, 'Remada com barra');
    
INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(009, 'Hammer'); 

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(007, 'Abdominal Infra'); 

INSERT INTO Treino_Exerc (cod_treino, exercicio)
	VALUES(009, 'Flexão de pernas deitado'); 


#Inserts Tel_Academia
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', '1694442976');
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', '1634201827');
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/9101-11', '0800801827');
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/0191-12', '1694443077');
    
INSERT INTO Tel_Academia (cnpj_a, telefone)
	VALUES('12345678/0191-12', '1634202818');  

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
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('448549997/44', '16995716411');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('584559999/04', '16997517444');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('584559999/08', '16997517333');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('364447799/84', '16997517222');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('053990799/14', '16997517111');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('053990799/14', '1634907810');
    
INSERT INTO Tel_Aluno (cpf_aluno, telefone)
	VALUES('052007197/09', '16997514545');    
    
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
    
INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('019854226/66', '16991575541'); 

INSERT INTO Tel_Funcionario (cpf_func, telefone)
	VALUES('019854226/66', '1634941199');    

    
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
	VALUES('456997420/55','019854226/66');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('584559999/04','998822564/97');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('584559999/08','019854226/66');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('364447799/84','050622879/03');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('053990799/14','998822564/97');
    
INSERT INTO Aluno_Func ( cpf_aluno, cpf_func)
	VALUES('052007197/09','019854226/66');     
    
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
	VALUES('289789345/05',007);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',009);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',010);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',012);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',013);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',014);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('289789345/05',015);    
    
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
	VALUES('682308725/99',007);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',009);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',010);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',012);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',013);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',014);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('682308725/99',015);    
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',001);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',006);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',008);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',011);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',002);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',003);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',004);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',005);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',007);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',009);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',010);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',012);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',013);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',014);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('456997420/55',015);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',001);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',002);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',003);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',004);

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',005);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',007);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',009);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',010);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',012);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',013);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',014);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('458459779/48',015);    
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',001);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',002); 

INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',003);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',004);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',005);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',007);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',009); 
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',010); 
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',012); 
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',013); 
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',014);
    
INSERT INTO Aluno_Equipa (cpf_aluno, cod_equipa)
	VALUES('448549997/44',015);  
    
#Inserts Aluno_Sala
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('789102345/35', 1);
        
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('196378345/51', 3);
    
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('448549997/44', 2);
    
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('584559999/04', 2);
    
INSERT INTO Aluno_Sala (cpf_aluno, numero_sala)
	VALUES('052007197/09', 1);
    
# SELECTS *
SELECT * FROM Academia;
SELECT * FROM Funcionario;
SELECT * FROM Equipamento;
SELECT DISTINCT * FROM Sala_Danca;
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
UPDATE Treino_Exerc SET exercicio = 'Supino Declinado' WHERE cod_treino = 2 AND LOWER(exercicio) = 'leg 45';
UPDATE Tel_Funcionario SET telefone = '1634165100' WHERE cpf_func = '050622879/03' AND telefone = '1634946734';
UPDATE Tel_Academia SET telefone = '1933727333' WHERE cnpj_a = '12345678/9101-11' AND telefone='1634201827';
UPDATE Equipamento SET data_ven = '2018-05-27', preco_ven = 2500.00 WHERE codigo = 003;

#DELETES
DELETE FROM Tel_Aluno WHERE telefone = '1634135997' AND cpf_aluno = '196378345/51';
DELETE FROM Treino WHERE codigo = 1 AND cpf_fun = '108945622/65' AND cpf_aluno = '789102345/35';
DELETE FROM Aluno WHERE cpf = '789102345/35';
DELETE FROM Equipamento WHERE codigo = 001;
DELETE FROM Funcionario WHERE cpf = '108945622/65';



#Consultas

# Qual o tempo médio de descanso para musculacao em cada academia?(AVG) 
SELECT a.cnpj_a AS 'CNPJ Academia', SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(m.tempo_descanso)),2)) AS 'Media: Tempo de Descanso' 
	FROM Musculacao m
		JOIN Treino t
			ON t.codigo = m.cod_treino
		JOIN Aluno a
			ON a.cod_treino = t.codigo
		GROUP BY a.cnpj_a;

# Liste o cnpj e a qunatidade de alunos cadastrados em cada academia de cnpj = '12345678/9101-11'?(COUNT)
SELECT ac.cnpj AS 'CNPJ Academia',  COUNT(al.cpf) AS 'Quantidade de Alunos Cadastrados' FROM Aluno al
	JOIN Academia ac
		ON ac.cnpj = al.cnpj_a
	GROUP BY ac.cnpj;

# Qual a maior duracao das aulas de dança de cada academia?(MAX)
SELECT a.cnpj_a, MAX(d.tempo_aula) FROM Danca d
	JOIN Treino t
		ON d.cod_treino = t.codigo
	JOIN Aluno a
		ON a.cod_treino = t.codigo
	GROUP BY a.cnpj_a;

# Qual a menor duracao das aulas de dança?(MIN)
SELECT a.cnpj_a, MIN(d.tempo_aula) FROM Danca d
	JOIN Treino t
		ON d.cod_treino = t.codigo
	JOIN Aluno a
		ON a.cod_treino = t.codigo
	GROUP BY a.cnpj_a;

# Qual o valor total gasto em equipamentos por mes?(SUM)
SELECT e.cnpj_a, ROUND(SUM(e.preco_comp),2) AS 'Valor total gasto com Equipamentos' FROM Equipamento e
	JOIN Academia a
		ON a.cnpj = e.cnpj_a
	GROUP BY e.cnpj_a;
        

# Liste o nome de todos os alunos de musculação de cada academia que tenham o exercicio 'Supino reto' em seu treino.(INNER JOIN)
SELECT a.cnpj_a, a.nome AS 'Nome do Aluno' FROM Aluno a
	JOIN Treino t
		ON a.cod_treino = t.codigo
	JOIN Treino_Exerc te
		ON t.codigo = te.cod_treino
	WHERE LOWER(te.exercicio) LIKE 'supino reto';

#Liste a quantidade de treinos que cada exercicio está presente na academia de CNPJ = '12345678/9101-11'.(GROUP BY)
SELECT te.exercicio AS 'Nome do Exercicio', COUNT(t.codigo) AS 'Quantidade de treinos'
	FROM Treino_Exerc te
		JOIN Treino t
			ON t.codigo = te.cod_treino
		JOIN Aluno a
			ON a.cpf = t.cpf_aluno
		WHERE a.cnpj_a LIKE '12345678/9101-11' 
		GROUP BY te.exercicio;
       

#Liste o nome de todos os alunos e o codigo de seu treino na academia de CNPJ = '12345678/9101-11' (caso exista). (LEFT JOIN)
SELECT a.nome AS 'Nome Aluno', IFNULL(t.codigo, '-') AS 'Codigo Treino' FROM Aluno a
	LEFT JOIN Treino t
		ON t.codigo = a.cod_treino
	WHERE a.cnpj_a LIKE '12345678/9101-11';

#Liste o nome de todos os funcionarios, os codigos dos treinos que ele orienta (caso exista) e o cnpj da academia que trabalha.(RIGHT JOIN)
SELECT f.cnpj_a AS 'CNPJ Academia', f.nome AS 'Nome Funcionario', IFNULL(t.codigo, '-') AS 'Codigo Treino' FROM Treino t
	RIGHT JOIN Funcionario f
		ON f.cpf = t.cpf_fun;
        
# Liste o nome de todos os alunos de musculação e o cnpj da academia que não tenha o exercicio 'Supino reto' nem 'Supino Declinado' em seu treino.(IN)
SELECT DISTINCT a.cnpj_a AS 'CNPJ Academia', a.nome AS 'Nome do Aluno' FROM Aluno a
	JOIN Treino t
		ON a.cod_treino = t.codigo
	JOIN Treino_Exerc te
		ON t.codigo = te.cod_treino
	WHERE LOWER(te.exercicio) NOT IN ('supino reto', 'supino declinado');
    
#Mostre o(s) nome(s) do(s) funcionario(s) que orienta(m) mais treinos que os demais por academia. Utilize a expressão ALL(HAVING)

SELECT f.cnpj_a AS 'CNPJ Academia', f.nome AS 'Nome Funcionario' FROM Treino t
	JOIN Funcionario f
		ON f.cpf = t.cpf_fun
	GROUP BY f.nome
    HAVING COUNT(t.codigo) >= ALL (SELECT COUNT(t.codigo) FROM Treino t
										JOIN Funcionario f
											ON f.cpf = t.cpf_fun
										GROUP BY f.nome);
                                        
#Mostre o nome de todos os alunos matriculados na musculacao na academia de cnpj = '12345678/9101-11'(Use a expresão ANY/SOME).
SELECT nome FROM Aluno 
	WHERE cpf = ANY(SELECT t.cpf_aluno FROM Treino t JOIN Musculacao m ON m.cod_treino = t.codigo)
		AND cnpj_a LIKE '12345678/9101-11';
        
#Liste o cnpj da academia e a descrição, data de venda, preço de venda e a quantidade de alunos que o usavam, de cada Equipamento vendido
SELECT DISTINCT e.cnpj_a AS 'CNPJ Academia', e.descricao AS 'Descrição', e.data_ven AS 'Data Venda', e.preco_ven AS 'Preço Venda', COUNT(ae.cod_equipa) AS 'Quantidade de alunos que utilizavam' FROM Equipamento e
	LEFT JOIN Aluno_Equipa ae
		ON ae.cod_equipa = e.codigo
	LEFT JOIN ALuno a
		ON a.cpf = ae.cpf_aluno
	WHERE e.data_ven IS NOT NULL
    GROUP BY e.descricao;
    
#Liste o cnpj da academia, a descrição do equipamento e a quantidade de alunos que usavam cada equipamento (Não vendido)(Utilize ORDER BY)
SELECT DISTINCT e.cnpj_a AS 'CNPJ Academia', e.descricao AS 'Descrição', COUNT(ae.cod_equipa) AS 'Quantidade de alunos que utilizam' FROM Equipamento e
	LEFT JOIN Aluno_Equipa ae
		ON ae.cod_equipa = e.codigo
	LEFT JOIN ALuno a
		ON a.cpf = ae.cpf_aluno
	WHERE e.data_ven IS NULL
    GROUP BY e.descricao
    ORDER BY e.cnpj_a;
    
#Liste todos os exercicios de musculação que tenha a letra "s" no nome e mostre o cnpj da academia
SELECT a.cnpj_a AS 'CNPJ Academia', te.exercicio AS 'Nome do Exercicio'
	FROM Treino_Exerc te
		JOIN Treino t
			ON t.codigo = te.cod_treino
		JOIN Aluno a
			ON a.cpf = t.cpf_aluno
		WHERE te.exercicio LIKE '%s%';
