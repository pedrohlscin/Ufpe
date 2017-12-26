CREATE TABLE Pessoa (
	CPF VARCHAR2 (14) NOT NULL,
	Nome VARCHAR2 (50) NOT NULL,
	Data_Nascimento DATE,
	Sexo CHAR,
	CONSTRAINT Pessoa_pkey PRIMARY KEY (CPF),
	CONSTRAINT Pessoa_check	CHECK (Sexo = 'M' OR Sexo = 'F')
);

CREATE TABLE Endereco_Pessoa (
	CPF_Pessoa VARCHAR2 (14) NOT NULL,
	CEP VARCHAR2 (9),
	Cidade VARCHAR2 (20),
	Estado VARCHAR2 (20),
	Pais VARCHAR2 (20),
	Bairro VARCHAR2 (20),
	Rua VARCHAR2 (50),
	Numero NUMBER(10),
	Complemento VARCHAR2 (20),
	CONSTRAINT Endereco_Pessoa_pkey	PRIMARY KEY (CPF_Pessoa),
	CONSTRAINT Endereco_Pessoa_fkey	FOREIGN KEY (CPF_Pessoa) REFERENCES Pessoa (CPF)
);

CREATE TABLE Telefone_Pessoa (
	CPF_Pessoa VARCHAR2 (14) NOT NULL,
	Telefone VARCHAR2 (14) NOT NULL,
	CONSTRAINT Telefone_Pessoa_fkey FOREIGN KEY (CPF_Pessoa) REFERENCES Pessoa (CPF)
);

CREATE TABLE Paciente (
	CPF_Paciente VARCHAR2(14) NOT NULL,
	CONSTRAINT Paciente_pkey PRIMARY KEY (CPF_Paciente),
	CONSTRAINT Paciente_fkey FOREIGN KEY (CPF_Paciente) REFERENCES Pessoa (CPF)
);

CREATE TABLE Funcionario (
	CPF_Funcionario VARCHAR2 (14) NOT NULL,
	Numero_Carteira_trabalho VARCHAR2 (14) NOT NULL,
	Data_Admissao DATE NOT NULL,
	Salario NUMBER (6, 2) NOT NULL,
	Supervisor VARCHAR2 (14) NULL,
	CONSTRAINT Funcionario_pkey PRIMARY KEY (CPF_Funcionario),
	CONSTRAINT Funcionario_fkey_cpf FOREIGN KEY (CPF_Funcionario) REFERENCES Pessoa (CPF),
	CONSTRAINT Funcionario_fkey_supervisor FOREIGN KEY (Supervisor)	REFERENCES Funcionario (CPF_Funcionario)
);

CREATE TABLE Receptor(
	CPF_Receptor VARCHAR2 (14) NOT NULL,
	Certidao_Obito VARCHAR2 (100) NOT NULL,
	CONSTRAINT Receptor_pkey PRIMARY KEY (CPF_Receptor),
	CONSTRAINT Receptor_fkey FOREIGN KEY (CPF_Receptor) REFERENCES Pessoa (CPF)
);

CREATE TABLE Medico_Legista (
	CPF_Medico_Legista VARCHAR2 (14) NOT NULL,
	CRM varchar(10) NOT NULL,
	CONSTRAINT Medico_Legista_pkey PRIMARY KEY (CPF_Medico_Legista),
	CONSTRAINT Medico_Legista_fkey FOREIGN KEY (CPF_Medico_Legista) REFERENCES Funcionario (CPF_Funcionario)
);

CREATE TABLE Perito_Criminal (
	CPF_Perito VARCHAR2 (14) NOT NULL,
	CONSTRAINT Perito_Criminal_pkey	PRIMARY KEY (CPF_Perito),
	CONSTRAINT Perito_Criminal_fkey FOREIGN KEY (CPF_Perito) REFERENCES Funcionario (CPF_Funcionario)
);

CREATE TABLE Auxiliar (
	CPF_Auxiliar VARCHAR2 (14) NOT NULL,
	CONSTRAINT Auxiliar_pkey PRIMARY KEY (CPF_Auxiliar),
	CONSTRAINT Auxiliar_fkey FOREIGN KEY (CPF_Auxiliar) REFERENCES Funcionario (CPF_Funcionario)
);

CREATE TABLE Material_Analise(
	ID INTEGER NOT NULL,
	Tipo VARCHAR2 (20) NOT NULL,
	Descricao VARCHAR2 (200) NOT NULL,
	Perito_Criminal VARCHAR2 (14),
	CONSTRAINT Material_Analise_pkey PRIMARY KEY (ID),
	CONSTRAINT Material_Analise_fkey FOREIGN KEY (Perito_Criminal) REFERENCES Perito_Criminal (CPF_Perito)
);

CREATE TABLE Delegacia(
	ID INTEGER NOT NULL,
	Nome VARCHAR2 (50) NOT NULL,
	CONSTRAINT Delegacia_pkey	PRIMARY KEY (ID)
);

CREATE TABLE Telefone_Delegacia(
	ID INTEGER NOT NULL,
	Telefone VARCHAR2 (14) NOT NULL,
	CONSTRAINT Telefone_Delegacia_fkey FOREIGN KEY (ID) REFERENCES Delegacia(ID)
);

CREATE TABLE Email_Delegacia(
	ID INTEGER NOT NULL,
	Email VARCHAR2 (50) NOT NULL,
	CONSTRAINT Email_Delegacia_fkey FOREIGN KEY (ID) REFERENCES Delegacia(ID)
);

CREATE TABLE Endereco_Delegacia (
	ID INTEGER NOT NULL,
	CEP VARCHAR2 (10) NOT NULL,
	Cidade VARCHAR2 (20) NOT NULL,
	Estado VARCHAR2 (20) NOT NULL,
	Pais VARCHAR2 (20) NOT NULL,
	Bairro VARCHAR2 (20) NOT NULL,
	Rua VARCHAR2 (50) NOT NULL,
	Numero NUMBER NOT NULL,
	Complemento VARCHAR2 (20),
	CONSTRAINT Endereco_Delegacia_pkey PRIMARY KEY (ID),
	CONSTRAINT Endereco_Delegacia_fkey FOREIGN KEY (ID) REFERENCES Delegacia (ID)
);

CREATE TABLE Corpo(
	ID INTEGER NOT NULL,
	Nome VARCHAR2 (50) NOT NULL,
	Data_Morte DATE,
	CPF_Auxiliar VARCHAR2 (14) NOT NULL,
	Gaveta NUMBER NOT NULL,
	CONSTRAINT Corpo_pkey PRIMARY KEY (ID),
	CONSTRAINT Corpo_fkey FOREIGN KEY (CPF_Auxiliar) REFERENCES Auxiliar (CPF_Auxiliar)
);

CREATE TABLE Documentos_Corpo(
	ID_Corpo INTEGER NOT NULL,
	Tipo VARCHAR2 (20) NOT NULL,
	Valor VARCHAR2 (20) NOT NULL,
	CONSTRAINT Documentos_Corpo_pkey PRIMARY KEY (ID_Corpo),
	CONSTRAINT Documentos_Corpo_fkey FOREIGN KEY (ID_Corpo) REFERENCES Corpo (ID)
);

CREATE TABLE Laudo(
	ID INTEGER NOT NULL,
	Descricao VARCHAR2 (200),
	CONSTRAINT Laudo_pkey PRIMARY KEY (ID)
);

CREATE TABLE Laudo_L(
	ID_Laudo INTEGER NOT NULL,
	CPF_Paciente VARCHAR2 (14) NOT NULL,
	CPF_Medico VARCHAR2 (14) NOT NULL,
	CONSTRAINT Laudo_L_pkey	PRIMARY KEY (ID_Laudo),
	CONSTRAINT Laudo_L_fkey1 FOREIGN KEY (ID_Laudo)	REFERENCES Laudo (ID),
	CONSTRAINT Laudo_L_fkey_paciente FOREIGN KEY (CPF_Paciente) REFERENCES Paciente (CPF_Paciente),
	CONSTRAINT Laudo_L_fkey_medico_legista FOREIGN KEY (CPF_Medico) REFERENCES Medico_Legista (CPF_Medico_Legista)
);

CREATE TABLE Laudo_A(
	ID_Laudo INTEGER NOT NULL,
	ID_Corpo INTEGER NOT NULL,
	CPF_Medico VARCHAR2 (14) NOT NULL,
	CONSTRAINT Laudo_A_pkey PRIMARY KEY (ID_Laudo),
	CONSTRAINT Laudo_A_fkey_Laudo FOREIGN KEY (ID_Laudo) REFERENCES Laudo (ID),
	CONSTRAINT Laudo_A_fkey_Corpo FOREIGN KEY (ID_Corpo) REFERENCES Corpo (ID),
	CONSTRAINT Laudo_A_fkey_Medico_Legista	FOREIGN KEY (CPF_Medico) REFERENCES Medico_Legista (CPF_Medico_Legista)
);

CREATE TABLE Recebe (
	ID_Corpo INTEGER NOT NULL,
	CPF_Auxiliar VARCHAR2 (14) NOT NULL,
	ID_Delegacia INTEGER NOT NULL,
	Data DATE,
	CONSTRAINT Recebe_pkey PRIMARY KEY (ID_Corpo),
	CONSTRAINT Recebe_fkey_Corpo	FOREIGN KEY (ID_Corpo) REFERENCES Corpo (ID),
	CONSTRAINT Recebe_fkey_Auxiliar FOREIGN KEY (CPF_Auxiliar) REFERENCES Auxiliar (CPF_Auxiliar),
	CONSTRAINT Recebe_fkey_Delegacia	FOREIGN KEY (ID_Delegacia)	REFERENCES Delegacia (ID)
);

CREATE TABLE Libera (
	ID_Corpo INTEGER NOT NULL,
	CPF_Auxiliar VARCHAR2 (14) NOT NULL,
	CPF_Receptor VARCHAR2 (14) NOT NULL,
	Data DATE,
	CONSTRAINT Libera_pkey	PRIMARY KEY (ID_Corpo),
	CONSTRAINT Libera_fkey_Corpo	FOREIGN KEY (ID_Corpo)	REFERENCES Corpo (ID),
	CONSTRAINT Libera_fkey_Aux_Adm	FOREIGN KEY (CPF_Auxiliar)	REFERENCES Auxiliar (CPF_Auxiliar),
	CONSTRAINT Libera_fkey_Receptor	FOREIGN KEY (CPF_Receptor)	REFERENCES Receptor (CPF_Receptor)
);

CREATE TABLE Examina (
	ID_Laudo_L INTEGER NOT NULL,
	CPF_Paciente VARCHAR2 (14) NOT NULL,
	CPF_Medico VARCHAR2 (14) NOT NULL,
	Tipo_Exame VARCHAR2 (20) NOT NULL,
	Data DATE,
	CONSTRAINT Examina_pkey PRIMARY KEY (ID_Laudo_L),
	CONSTRAINT Examina_fkey_Laudo_L FOREIGN KEY (ID_Laudo_L) REFERENCES Laudo_L (ID_Laudo),
	CONSTRAINT Examina_fkey_Paciente FOREIGN KEY (CPF_Paciente)	REFERENCES Paciente (CPF_Paciente),
	CONSTRAINT Examina_fkey_Medico_Legista	FOREIGN KEY (CPF_Medico) 	REFERENCES Medico_Legista (CPF_Medico_Legista)
);

CREATE TABLE Autopsia (
	ID_Laudo_A INTEGER NOT NULL,
	ID_Corpo INTEGER NOT NULL,
	CPF_Medico VARCHAR2 (14) NOT NULL,
	Data_Autopsia TIMESTAMP,
	CONSTRAINT Autopsia_pkey PRIMARY KEY (ID_Laudo_A),
	CONSTRAINT Autopsia_fkey_Laudo_A	FOREIGN KEY (ID_Laudo_A)	REFERENCES Laudo_A (ID_Laudo),
	CONSTRAINT Autopsia_fkey_Medico_Legista	FOREIGN KEY (CPF_Medico) REFERENCES Medico_Legista (CPF_Medico_Legista),
	CONSTRAINT Autopsia_fkey_Corpo_Autopsia	FOREIGN KEY (ID_Corpo)	REFERENCES Corpo (ID)
);
