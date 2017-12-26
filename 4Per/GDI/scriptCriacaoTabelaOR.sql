DROP TYPE tp_endereco FORCE;
DROP TYPE tp_telefone FORCE;
DROP TYPE array_tp_telefone FORCE;
DROP TYPE tp_pessoa FORCE;
DROP TYPE tp_paciente FORCE;
DROP TYPE tp_funcionario FORCE;
DROP TYPE tp_receptor FORCE;
DROP TYPE tp_medico_legista FORCE;
DROP TYPE tp_perito_criminal FORCE;
DROP TYPE tp_auxiliar_administrativo FORCE;
DROP TYPE tp_laudo FORCE;
DROP TYPE tp_laudo_lesao FORCE;
DROP TYPE tp_laudo_autopsia FORCE;
DROP TYPE tp_material_analise FORCE;
DROP TYPE array_tp_email FORCE;
DROP TYPE tp_delegacia FORCE;
DROP TYPE tp_documento FORCE;
DROP TYPE tp_corpo FORCE;
DROP TYPE tp_receber FORCE;
DROP TYPE tp_liberar FORCE;
DROP TYPE tp_examinar FORCE;
DROP TYPE tp_autopsiar FORCE;

CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    CEP VARCHAR2(9),
    Cidade VARCHAR2(20),
    Estado VARCHAR2(20),
    Pais VARCHAR2(20),
    Bairro VARCHAR2(20),
    Rua VARCHAR2(50),
    Numero VARCHAR2(5),
    Complemento VARCHAR2(20)
);
/
CREATE OR REPLACE TYPE tp_telefone AS OBJECT(
    Numero VARCHAR2(14)
);
/
CREATE OR REPLACE TYPE array_tp_telefone AS VARRAY(3) OF tp_telefone;
/
CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    CPF VARCHAR2(14),
    Nome VARCHAR2(50),
    Data_Nascimento DATE,
    Sexo CHAR,
    Telefones array_tp_telefone,
    Endereco tp_endereco
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_paciente UNDER tp_pessoa();
/
CREATE OR REPLACE TYPE tp_funcionario UNDER tp_pessoa(
    Numero_Carteira_Trabalho VARCHAR2(14),
    Data_Admissao DATE,
    Salario NUMBER(6,2),
    Supervisor REF tp_funcionario
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_receptor UNDER tp_pessoa(
    Certidao_obito VARCHAR2(40)
);
/
CREATE OR REPLACE TYPE tp_medico_legista UNDER tp_funcionario(
    CRM VARCHAR2(10)
);
/
CREATE OR REPLACE TYPE tp_perito_criminal UNDER tp_funcionario();
/
CREATE OR REPLACE TYPE tp_auxiliar_administrativo UNDER tp_funcionario();
/
CREATE OR REPLACE TYPE tp_laudo AS OBJECT(
    ID INTEGER,
    Descricao VARCHAR2(200)
) NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_laudo_lesao UNDER tp_laudo();
/
CREATE OR REPLACE TYPE tp_laudo_autopsia UNDER tp_laudo();
/
CREATE OR REPLACE TYPE tp_material_analise AS OBJECT(
    ID INTEGER,
    Tipo VARCHAR2(20),
    Descricao VARCHAR2(200),
    Perito_Criminal REF tp_perito_criminal
);
/
CREATE OR REPLACE TYPE array_tp_email AS VARRAY(3) OF VARCHAR2(50);
/
CREATE OR REPLACE TYPE tp_delegacia AS OBJECT(
    ID INTEGER,
    Nome VARCHAR2(50),
    Telefones array_tp_telefone,
    Emails array_tp_email
);
/
CREATE OR REPLACE TYPE tp_documento AS OBJECT(
    Nome VARCHAR2(20),
    Valor VARCHAR2(20)
);
/
CREATE OR REPLACE TYPE tp_corpo AS OBJECT(
    ID INTEGER,
    Nome VARCHAR2(50),
    Data_Morte DATE,
    Gaveta NUMBER,
    Documento tp_documento
);
/
CREATE OR REPLACE TYPE tp_receber AS OBJECT (
    corpo REF tp_corpo,
    auxiliar REF tp_auxiliar_administrativo,
    delegacia REF tp_delegacia,
    dataRecepcao DATE
);
/
CREATE OR REPLACE TYPE tp_liberar AS OBJECT (
    corpo REF tp_corpo,
    auxiliar REF tp_auxiliar_administrativo,
    receptor REF tp_receptor,
    dataLiberacao DATE
);
/
CREATE OR REPLACE TYPE tp_examinar AS OBJECT (
    laudoLesao REF tp_laudo_lesao,
    paciente REF tp_paciente,
    medico REF tp_medico_legista,
    TipoExame VARCHAR2(20),
    dataExame DATE
);
/
CREATE OR REPLACE TYPE tp_autopsiar AS OBJECT (
    laudoAutopsia REF tp_laudo_autopsia,
    corpo REF tp_corpo,
    medico REF tp_medico_legista,
    dataAutopsia DATE
);
/

-- Criar tabelas
DROP TABLE tb_paciente CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_medico_legista CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_receptor CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_auxiliar_administrativo CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_perito_criminal CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_laudo_lesao CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_laudo_autopsia CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_material_analise CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_corpo CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_delegacia CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_receber CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_liberar CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_examinar CASCADE CONSTRAINTS PURGE;
DROP TABLE tb_autopsiar CASCADE CONSTRAINTS PURGE;

CREATE TABLE tb_paciente OF tp_paciente(CPF PRIMARY KEY);

CREATE TABLE tb_medico_legista OF tp_medico_legista(CPF PRIMARY KEY,
  Numero_Carteira_trabalho NOT NULL,
  Data_Admissao NOT NULL,
  Salario NOT NULL,
  CRM NOT NULL,
  Supervisor SCOPE IS tb_medico_legista);

CREATE TABLE tb_receptor OF tp_receptor(CPF PRIMARY KEY,
  Certidao_obito NOT NULL);  

CREATE TABLE tb_auxiliar_administrativo OF tp_auxiliar_administrativo(CPF PRIMARY KEY,
 Numero_Carteira_trabalho NOT NULL,
 Data_Admissao NOT NULL,
 Salario NOT NULL,
 Supervisor SCOPE IS tb_auxiliar_administrativo);

CREATE TABLE tb_perito_criminal OF tp_perito_criminal(CPF PRIMARY KEY,
  Numero_Carteira_trabalho NOT NULL,
  Data_Admissao NOT NULL,
  Salario NOT NULL,
  Supervisor SCOPE IS tb_perito_criminal);

CREATE TABLE tb_laudo_lesao OF tp_laudo_lesao(
 ID PRIMARY KEY,
 Descricao NOT NULL);

CREATE TABLE tb_laudo_autopsia OF tp_laudo_autopsia(ID PRIMARY KEY,
 Descricao NOT NULL);

CREATE TABLE tb_material_analise OF tp_material_analise(ID PRIMARY KEY,
 Tipo NOT NULL,
 Descricao NOT NULL,
 Perito_Criminal WITH ROWID REFERENCES tb_perito_criminal);

CREATE TABLE tb_corpo OF tp_corpo(ID PRIMARY KEY,
 Nome NOT NULL,
 Gaveta NOT NULL);

CREATE TABLE tb_delegacia OF tp_delegacia(ID PRIMARY KEY,
 Nome NOT NULL);
 
CREATE TABLE tb_receber OF tp_receber(
 corpo WITH ROWID REFERENCES tb_corpo,
 auxiliar WITH ROWID REFERENCES tb_auxiliar_administrativo,
 delegacia WITH ROWID REFERENCES tb_delegacia,
 dataRecepcao NOT NULL);
 
CREATE TABLE tb_liberar OF tp_liberar(
 corpo WITH ROWID REFERENCES tb_corpo,
 auxiliar WITH ROWID REFERENCES tb_auxiliar_administrativo,
 receptor WITH ROWID REFERENCES tb_receptor,
 dataLiberacao NOT NULL);

CREATE TABLE tb_examinar OF tp_examinar(
 laudoLesao WITH ROWID REFERENCES tb_laudo_lesao,
 paciente WITH ROWID REFERENCES tb_paciente,
 medico WITH ROWID REFERENCES tb_medico_legista,
 TipoExame NOT NULL,
 dataExame NOT NULL);

CREATE TABLE tb_autopsiar OF tp_autopsiar(
 laudoAutopsia WITH ROWID REFERENCES tb_laudo_autopsia,
 corpo WITH ROWID REFERENCES tb_corpo,
 medico WITH ROWID REFERENCES tb_medico_legista,
 dataAutopsia NOT NULL);