CREATE DATABASE IF NOT EXISTS BDEX1_HOSPITAL;
USE BDEX1_HOSPITAL;

CREATE TABLE IF NOT EXISTS PACIENTES(
CPF_PACIENTE VARCHAR(15) PRIMARY KEY,
NOME VARCHAR(45) NOT NULL,
DATA_NASC DATE NOT NULL,
TELEFONE VARCHAR(45) NOT NULL,
EMAIL VARCHAR(45));

CREATE TABLE IF NOT EXISTS DEPARTAMENTOS(
COD_ESPECIALIDADE INT PRIMARY KEY,
NOME_ESPECIALIDADE VARCHAR(45));

CREATE TABLE IF NOT EXISTS MEDICOS(
CRM INT,
UF CHAR(2),
PRIMARY KEY(CRM,UF),
NOME VARCHAR(45) NOT NULL,
EMAIL VARCHAR(45) NOT NULL,
TELEFONE VARCHAR(45) NOT NULL,
DEPTO_COD_ESPEC INT,
CONSTRAINT DEPTO_MED FOREIGN KEY(DEPTO_COD_ESPEC)
REFERENCES DEPARTAMENTOS(COD_ESPECIALIDADE));

CREATE TABLE IF NOT EXISTS CONSULTAS(
ID_CONSULTA INT PRIMARY KEY,
ANAMNESE TEXT,
DATA_CONS DATE NOT NULL,
HORA_CONS TIME NOT NULL,
CRM INT NOT NULL,
UF CHAR(2) NOT NULL,
CPF_PACIENTE VARCHAR(15) NOT NULL,
CONSTRAINT MED_CONS FOREIGN KEY(CRM,UF) 
REFERENCES MEDICOS(CRM,UF),
CONSTRAINT PAC_CONS FOREIGN KEY(CPF_PACIENTE)
REFERENCES PACIENTES(CPF_PACIENTE));

USE bdex1_hospital;
-- Inserções básicas de pacientes
INSERT INTO PACIENTES (CPF_PACIENTE, NOME, DATA_NASC, TELEFONE, EMAIL) VALUES 
('12345678901', 'João Silva', '1990-05-20', '123456789', 'joao@example.com'),
('98765432109', 'Maria Santos', '1985-10-15', '987654321', 'maria@example.com'),
('11111111111', 'Pedro Souza', '1980-08-25', '111111111', 'pedro@example.com'),
('22222222222', 'Ana Paula', '1978-03-10', '222222222', 'ana@example.com'),
('33333333333', 'Roberto Ferreira', '1972-12-05', '333333333', 'roberto@example.com'),
('44444444444', 'Amanda Oliveira', '1995-07-18', '444444444', 'amanda@example.com'),
('55555555555', 'Rafaela Lima', '1988-09-30', '555555555', 'rafaela@example.com'),
('66666666666', 'Gustavo Pereira', '1992-11-12', '666666666', 'gustavo@example.com'),
('77777777777', 'Fernanda Souza', '1983-04-28', '777777777', 'fernanda@example.com'),
('88888888888', 'Lucas Santos', '1976-06-15', '888888888', 'lucas@example.com'),
('99999999999', 'Patricia Alves', '1987-02-09', '999999999', 'patricia@example.com'),
('10101010101', 'Roberta Costa', '1984-11-03', '101010101', 'roberta@example.com'),
('12121212121', 'Marcelo Silva', '1979-08-17', '121212121', 'marcelo@example.com'),
('13131313131', 'Bruna Oliveira', '1990-03-25', '131313131', 'bruna@example.com'),
('14141414141', 'Renato Santos', '1982-12-08', '141414141', 'renato@example.com'),
('15151515151', 'Carla Lima', '1986-07-22', '151515151', 'carla@example.com'),
('16161616161', 'Daniel Oliveira', '1993-05-14', '161616161', 'daniel@example.com'),
('17171717171', 'Camila Costa', '1977-09-11', '171717171', 'camila@example.com'),
('18181818181', 'José Pereira', '1981-02-27', '181818181', 'jose@example.com'),
('19191919191', 'Fernando Almeida', '1974-10-06', '191919191', 'fernando@example.com');

-- Inserções básicas de departamentos
INSERT INTO DEPARTAMENTOS (COD_ESPECIALIDADE, NOME_ESPECIALIDADE) VALUES 
(1, 'Cardiologia'),
(2, 'Ortopedia'),
(3, 'Pediatria'),
(4, 'Neurologia'),
(5, 'Ginecologia'),
(6, 'Urologia'),
(7, 'Oncologia'),
(8, 'Dermatologia'),
(9, 'Oftalmologia'),
(10, 'Psiquiatria'),
(11, 'Endocrinologia'),
(12, 'Anestesiologia'),
(13, 'Radiologia'),
(14, 'Nefrologia'),
(15, 'Otorrinolaringologia'),
(16, 'Cirurgia Geral'),
(17, 'Hematologia'),
(18, 'Reumatologia'),
(19, 'Nutrição'),
(20, 'Fisioterapia');

-- Inserções básicas de médicos
INSERT INTO MEDICOS (CRM, UF, NOME, EMAIL, TELEFONE, DEPTO_COD_ESPEC) VALUES 
(123456, 'SP', 'Dr. Carlos', 'carlos@example.com', '987654321', NULL),
(789012, 'RJ', 'Dra. Ana', 'ana@example.com', '123456789', 2),
(345678, 'MG', 'Dr. João', 'joao@example.com', '234567890', 3),
(901234, 'RS', 'Dra. Maria', 'maria@example.com', '345678901', 4),
(567890, 'SC', 'Dr. Pedro', 'pedro@example.com', '456789012', NULL),
(234567, 'PR', 'Dra. Paula', 'paula@example.com', '567890123', 6),
(890123, 'BA', 'Dr. Lucas', 'lucas@example.com', '678901234', 7),
(456789, 'ES', 'Dra. Renata', 'renata@example.com', '789012345', 8),
(678901, 'PE', 'Dr. Guilherme', 'guilherme@example.com', '890123456', 9),
(234567, 'AM', 'Dra. Camila', 'camila@example.com', '901234567', NULL),
(456789, 'PA', 'Dr. Rafael', 'rafael@example.com', '012345678', 11),
(123456, 'CE', 'Dra. Isabela', 'isabela@example.com', '112233445', 12),
(789012, 'TO', 'Dr. Roberto', 'roberto@example.com', '223344556', 13),
(345678, 'PI', 'Dra. Larissa', 'larissa@example.com', '334455667', 14),
(901234, 'AL', 'Dr. Marcelo', 'marcelo@example.com', '445566778', 15),
(567890, 'MS', 'Dra. Juliana', 'juliana@example.com', '556677889', 16),
(234567, 'MT', 'Dr. André', 'andre@example.com', '667788990', 17),
(890123, 'GO', 'Dra. Patrícia', 'patricia@example.com', '778899001', 18),
(456789, 'AC', 'Dr. Diego', 'diego@example.com', '889900112', 19),
(678901, 'RO', 'Dra. Fabiana', 'fabiana@example.com', '990011223', 20);

-- Inserções básicas de consultas
INSERT INTO CONSULTAS (ID_CONSULTA, ANAMNESE, DATA_CONS, HORA_CONS, CRM, UF, CPF_PACIENTE) VALUES 
(1, NULL, '2024-05-13', '10:00:00', 678901, 'RO', '19191919191'),
(2, 'Fratura no braço', '2024-05-14', '11:00:00', 789012, 'RJ', '98765432109'),
(3, 'Virose', '2024-05-15', '12:00:00', 345678, 'MG', '11111111111'),
(4, 'Dor de cabeça', '2024-05-16', '13:00:00', 678901, 'RO', '19191919191'),
(5, 'Dor abdominal', '2024-05-17', '14:00:00', 567890, 'SC', '33333333333'),
(6, 'Gripe', '2024-05-18', '15:00:00', 345678, 'MG', '11111111111'),
(7, 'Lesão no joelho', '2024-05-19', '16:00:00', 890123, 'BA', '55555555555'),
(8, NULL, '2024-05-20', '17:00:00', 456789, 'ES', '66666666666'),
(9, 'Dor de ouvido', '2024-05-21', '18:00:00', 678901, 'PE', '77777777777'),
(10, 'Tosse persistente', '2024-05-22', '19:00:00', 234567, 'AM', '88888888888'),
(11, 'Depressão', '2024-05-23', '20:00:00', 456789, 'PA', '99999999999'),
(12, 'Anestesia geral', '2024-05-24', '21:00:00', 345678, 'MG', '11111111111'),
(13, NULL, '2024-05-25', '22:00:00', 789012, 'TO', '12121212121'),
(14, 'Insuficiência renal', '2024-05-26', '23:00:00', 456789, 'AC', '18181818181'),
(15, 'Alergia', '2024-05-27', '10:00:00', 901234, 'AL', '14141414141'),
(16, 'Cirurgia de emergência', '2024-05-28', '11:00:00', 567890, 'MS', '15151515151'),
(17, 'Consulta de rotina', '2024-05-29', '12:00:00', 234567, 'MT', '16161616161'),
(18, NULL, '2024-05-30', '13:00:00', 890123, 'GO', '17171717171'),
(19, 'Lesão muscular', '2024-05-31', '14:00:00', 456789, 'AC', '18181818181'),
(20, 'Problemas de visão', '2024-06-01', '15:00:00', 678901, 'RO', '19191919191');

# 1 - Exibir todas as informações da tabela PACIENTES.
SELECT * FROM PACIENTES;
# 2 - Mostrar os nomes e e-mails dos pacientes que nasceram depois do ano 2000.
SELECT NOME, EMAIL, DATA_NASC
FROM pacientes
WHERE YEAR(data_nasc) > 2000;
# 3 - Listar os nomes dos médicos e as especialidades em que trabalham.
SELECT M.NOME, D.NOME_ESPECIALIDADE
FROM DEPARTAMENTOS D
JOIN MEDICOS M
ON D.COD_ESPECIALIDADE = M.DEPTO_COD_ESPEC;
# 4 - Exibir os detalhes das consultas: ID da consulta, data, hora, nome do médico e nome do paciente.
SELECT C.ID_CONSULTA, C.DATA_CONS, C.HORA_CONS, M.NOME, P.NOME
FROM CONSULTAS C
JOIN MEDICOS M
ON M.UF = C.UF AND M.CRM = C.CRM
JOIN PACIENTES P
ON P.CPF_PACIENTE = C.CPF_PACIENTE;
# 5 - Listar o nome dos pacientes e quantas consultas cada um fez.
SELECT P.NOME, count(C.ID_CONSULTA) AS QNT_CONSULTA
FROM PACIENTES P
LEFT JOIN CONSULTAS C
ON P.CPF_PACIENTE = C.CPF_PACIENTE
GROUP BY P.NOME
ORDER BY P.NOME;
# 6 - Mostrar as especialidades de médicos que fizeram consultas em 2023.
SELECT M.NOME, D.NOME_ESPECIALIDADE
FROM MEDICOS M
JOIN DEPARTAMENTOS D
ON M.DEPTO_COD_ESPEC = D.COD_ESPECIALIDADE
JOIN CONSULTAS C
ON M.CRM = C.CRM AND M.UF = C.UF
WHERE YEAR(C.DATA_CONS) = 2023;




