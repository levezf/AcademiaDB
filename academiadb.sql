CREATE DATABASE bd1_academia;

USE bd1_academia;

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
    cata_comp DATE,
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

#Teste
