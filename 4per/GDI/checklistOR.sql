CREATE OR REPLACE TYPE BODY tp_funcionario IS
ORDER MEMBER FUNCTION salarioMaior (F tp_funcionario) RETURN NUMBER IS
BEGIN
IF Salario < P.Salario THEN
    RETURN -1;
ELSIF Salario > P.Salario THEN
    RETURN 1;
ELSE
    RETURN 0;
END IF;
END;
/

CREATE OR REPLACE TYPE BODY tp_pessoa IS
MEMBER PROCEDURE exibirNome (SELF tp_pessoa) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(Nome);
END;
END;
/

CREATE OR REPLACE TYPE BODY tp_funcionario IS
ORDER MEMBER FUNCTION salarioMaior (F tp_funcionario) RETURN NUMBER IS
BEGIN
IF Salario < P.Salario THEN
    RETURN -1;
ELSIF Salario > P.Salario THEN
    RETURN 1;
ELSE
    RETURN 0;
END IF;
END;
/

CREATE OR REPLACE TYPE BODY tp_pessoa IS
MAP MEMBER FUNCTION cpfToInt RETURN INTEGER IS
a INTEGER := cpf;
BEGIN
RETURN a;
END;
END;
/

CREATE OR REPLACE TYPE BODY tp_endereco AS
CONSTRUCTOR FUNCTION to_endereco(CEP VARCHAR2(9), Cidade VARCHAR2(20), Estado VARCHAR2(20), Bairro VARCHAR2(20), Rua VARCHAR2(50), Numero VARCHAR2(5), Complemento VARCHAR2(20)) RETURN SELF AS RESULT AS
BEGIN
    SELF.CEP := CEP;
    SELF.Cidade := Cidade;
    SELF.Estado := Estado;
    SELF.Bairro := Bairro;
    SELF.Rua := Rua;
    SELF.Numero := Numero;
    SELF.Complemento := Complemento;
    SELF.Pais := "Brasil";
    RETURN;
END;
/

CREATE OR REPLACE TYPE BODY tp_funcionario IS
OVERRIDING MEMBER PROCEDURE salarioMaior IS
BEGIN
IF Salario < P.Salario THEN
    RETURN -74;
ELSIF Salario > P.Salario THEN
    RETURN 74;
ELSE
    RETURN 0;
END IF;
END;
/

CREATE OR REPLACE TYPE BODY tp_pessoa IS
FINAL MEMBER PROCEDURE exibirCPF (SELF tp_pessoa) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(CPF);
END;
END;
/

ALTER TYPE tp_funcionario
ADD ATTRIBUTE(horasSemanais NUMBER) CASCADE;