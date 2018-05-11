CREATE DATABASE bd1_academia;

USE bd1_academia;

CREATE TABLE Academia();

CREATE TABLE Funcionario();

CREATE TABLE Aluno();

CREATE TABLE Equipamento();

CREATE TABLE SalaDanca();

CREATE TABLE Treino();

CREATE TABLE Musculacao();

CREATE TABLE Danca();

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



