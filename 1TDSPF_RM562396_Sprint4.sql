/*

Guilherme Macedo Martins -  RM562396

PEDRO HERIQUE LUIZ ALVES DUARTE - RM563405

*/


CREATE TABLE PACIENTES (
    id_paciente INT  GENERATED AS IDENTITY  PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone INT NOT NULL,
    ddd INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL
);
   
CREATE TABLE ESPECIALIDADES (

    id_especialidade INT  GENERATED AS IDENTITY  PRIMARY KEY,

    nome_especialidade VARCHAR(50) NOT NULL,

    descricao_especialidade VARCHAR(250) NOT NULL

);
     
CREATE TABLE MEDICOS (

    id_medico INT  GENERATED AS IDENTITY  PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    crm VARCHAR(20) UNIQUE NOT NULL,

    telefone VARCHAR(15)NOT NULL,

    id_especialidade INT NOT NULL

);

ALTER TABLE MEDICOS

ADD CONSTRAINT fk_medico_especialidade

FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id_especialidade);


CREATE TABLE CONSULTAS(
    id_consulta INT  GENERATED AS IDENTITY  PRIMARY KEY,
    data_consulta DATE NOT NULL,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    status VARCHAR(30) DEFAULT 'Agendada' NOT NULL  ,
    observacoes VARCHAR(250),
    CONSTRAINT fk_consulta_paciente FOREIGN KEY (id_paciente) REFERENCES PACIENTES(id_paciente),
    CONSTRAINT fk_consulta_medico FOREIGN KEY (id_medico) REFERENCES MEDICOS(id_medico),
    CONSTRAINT chk_consultas_status CHECK (status IN ('Agendada', 'Realizada', 'Cancelada'))
);



--===================================
       -- INFROMAÇÕES ESPECIALIDAES --
--=====================================
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Cardiologia', 'Cuida do coração e sistema circulatório.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Dermatologia', 'Tratamento da pele, cabelos e unhas.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Ortopedia', 'Sistema locomotor, ossos, articulações, ligamentos.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Pediatria', 'Saúde de crianças e adolescentes.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Neurologia', 'Sistema nervoso (cérebro, medula, nervos).');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Ginecologia', 'Saúde do sistema reprodutor feminino.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Urologia', 'Trato urinário e sistema reprodutor masculino.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Oftalmologia', 'Saúde dos olhos.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Psiquiatria', 'Transtornos mentais e comportamentais.');
INSERT INTO ESPECIALIDADES (nome_especialidade, descricao_especialidade) VALUES ('Endocrinologia', 'Glândulas e hormônios.');
--====================================
       -- INFROMAÇÕES PACIENTES --
--=====================================
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Laura Moreira Azevedo', '472.901.358-15', TO_DATE('1988-03-22', 'YYYY-MM-DD'), 988887777, 11, 'laura.m.azevedo@gmail.com', 'Rua das Flores, 123', '01010-010', 'São Paulo', 'Centro');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Rafael Gonçalves Pereira', '835.210.694-77', TO_DATE('1995-11-08', 'YYYY-MM-DD'), 977776666, 21, 'rafael_g_pereira@yahoo.com.br', 'Avenida Copacabana, 456', '22020-020', 'Rio de Janeiro', 'Copacabana');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Manuela Carvalho Ribeiros', '109.647.823-02', TO_DATE('1976-07-14', 'YYYY-MM-DD'), 966665555, 31, 'manuela.ribeiro@outlook.com', 'Rua da Bahia, 789', '30160-010', 'Belo Horizonte', 'Lourdes');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Lucas Barbosa Fernandes', '558.032.179-40', TO_DATE('2002-01-30', 'YYYY-MM-DD'), 955554444, 41, 'lucas.b.fernandes@hotmail.com', 'Rua XV de Novembro, 101', '80020-310', 'Curitiba', 'Centro');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Sofia Castro Gomesa', '291.765.430-81', TO_DATE('1981-09-02', 'YYYY-MM-DD'), 944443333, 51, 'sofia.castro.gomes@gmail.com', 'Avenida Ipiranga, 202', '90160-090', 'Porto Alegre', 'Praia de Belas');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Matheus Pinto Araujos', '624.389.015-26', TO_DATE('1999-12-19', 'YYYY-MM-DD'), 933332222, 11, 'matheus.p.araujo@yahoo.com.br', 'Avenida Paulista, 1500', '01310-100', 'São Paulo', 'Bela Vista');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Julia Dias Correia', '907.513.268-33', TO_DATE('1969-04-25', 'YYYY-MM-DD'), 922221111, 21, 'julia.dias.correia@outlook.com', 'Rua Barata Ribeiro, 303', '22040-001', 'Rio de Janeiro', 'Ipanema');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Pedro Nogueira Rocha', '346.820.751-99', TO_DATE('1972-06-11', 'YYYY-MM-DD'), 911110000, 31, 'pedro.n.rocha@hotmail.com', 'Avenida Afonso Pena, 404', '30130-000', 'Belo Horizonte', 'Centro');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Beatriz Lopes Ferreira', '780.194.502-54', TO_DATE('1984-10-05', 'YYYY-MM-DD'), 900009999, 11, 'bia.lopes.ferreira@gmail.com', 'Rua Augusta, 505', '01305-000', 'São Paulo', 'Consolação');
INSERT INTO PACIENTES (nome, cpf, data_nascimento, telefone, ddd, email, rua, cep, cidade, bairro) VALUES ('Guilherme Monteiro Barros', '063.458.917-08', TO_DATE('1993-02-17', 'YYYY-MM-DD'), 987654321, 41, 'guilherme.barros@yahoo.com.br', 'Rua das Araucárias, 606', '80520-170', 'Curitiba', 'Ahú');
--====================================
       -- INFROMAÇÕES MEDIACOS --
--=====================================

INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dr. Ricardo Neves', 'CRM/SP 123456', '11911112222', 1);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dra. Beatriz Almeida', 'CRM/RJ 234567', '21922223333', 2);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dr. Lucas Silveira', 'CRM/MG 345678', '31933334444', 3);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dra. Juliana Franco', 'CRM/PR 456789', '41944445555', 4);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dr. Marcos Ribeiro', 'CRM/SP 567890', '11955556666', 5);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dra. Fernanda Bastos', 'CRM/RJ 678901', '21966667777', 6);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dr. Gustavo Pinto', 'CRM/MG 789012', '31977778888', 7);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dra. Patricia Soares', 'CRM/PR 890123', '41988889999', 8);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dr. André Monteiro', 'CRM/SP 901234', '11999990000', 9);
INSERT INTO MEDICOS (nome, crm, telefone, id_especialidade) VALUES ('Dra. Vanessa Matos', 'CRM/RJ 012345', '21900001111', 10);

INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-04', 'YYYY-MM-DD'), 10, 7, 'Realizada', 'Rotina urológica');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-11', 'YYYY-MM-DD'), 2, 2, 'Agendada', 'Verificação de mancha na pele.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-15', 'YYYY-MM-DD'), 3, 3, 'Realizada', 'Paciente quebrou o braço, retorno.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-18', 'YYYY-MM-DD'), 4, 4, 'Realizada', 'Consulta de rotina pediátrica.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-12', 'YYYY-MM-DD'), 5, 5, 'Agendada', 'Dor de cabeça frequente.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-20', 'YYYY-MM-DD'), 6, 6, 'Realizada', 'Exame anual ginecológico.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-14', 'YYYY-MM-DD'), 7, 7, 'Agendada', 'Acompanhamento urológico.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-22', 'YYYY-MM-DD'), 8, 8, 'Realizada', 'Exame de vista.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-01', 'YYYY-MM-DD'), 9, 9, 'Realizada', 'Sessão de acompanhamento.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-15', 'YYYY-MM-DD'), 10, 10, 'Agendada', 'Exames de tireoide.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-05', 'YYYY-MM-DD'), 1, 2, 'Cancelada', 'Paciente remarcou.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-18', 'YYYY-MM-DD'), 2, 1, 'Agendada', 'Check-up cardiológico.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-20', 'YYYY-MM-DD'), 3, 4, 'Agendada', 'Filho da paciente com febre.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-28', 'YYYY-MM-DD'), 4, 3, 'Realizada', 'Retorno ortopédico.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-21', 'YYYY-MM-DD'), 5, 6, 'Agendada', 'Rotina ginecológica.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-10-30', 'YYYY-MM-DD'), 6, 5, 'Realizada', 'Consulta sobre enxaqueca.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-22', 'YYYY-MM-DD'), 7, 8, 'Agendada', 'Paciente com visão turva.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-03', 'YYYY-MM-DD'), 8, 9, 'Realizada', 'Paciente relata ansiedade.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-25', 'YYYY-MM-DD'), 9, 10, 'Agendada', 'Verificar exames hormonais.');
INSERT INTO CONSULTAS (data_consulta, id_paciente, id_medico, status, observacoes) VALUES (TO_DATE('2025-11-04', 'YYYY-MM-DD'), 10, 7, 'Realizada', 'Rotina urológica');


-- latório 1.1: Lista todos os pacientes em ordem alfabética.
SELECT nome, cpf, data_nascimento, cidade
FROM PACIENTES
ORDER BY nome ASC;

-- Relatório 1.2: Lista todas as consultas com status 'Agendada', ordenadas da data mais próxima.
SELECT data_consulta, id_paciente, id_medico, status
FROM CONSULTAS
WHERE status = 'Agendada'
ORDER BY data_consulta ASC;

-- 2. Relatórios com Função Numérica Simples

-- Relatório 2.1: Conta o número total de pacientes cadastrados na clínica.
SELECT COUNT(*) AS total_de_pacientes
FROM PACIENTES;

-- Relatório 2.2: Conta o número total de especialidades oferecidas.
SELECT COUNT(id_especialidade) AS total_de_especialidades
FROM ESPECIALIDADES;

-- 3. Relatórios com Função de Grupo (GROUP BY)

-- Relatório 3.1: Mostra a quantidade de consultas por cada status.
SELECT status, COUNT(*) AS quantidade
FROM CONSULTAS
GROUP BY status;

-- Relatório 3.2: Conta quantas consultas cada médico (pelo ID) possui no total.
SELECT id_medico, COUNT(id_consulta) AS numero_total_consultas
FROM CONSULTAS
GROUP BY id_medico
ORDER BY numero_total_consultas DESC;

-- 4. Relatórios com Subconsulta (Subquery)

-- Relatório 4.1: Lista o nome de todos os pacientes que já realizaram uma consulta.
SELECT nome, email, telefone
FROM PACIENTES
WHERE id_paciente IN (
    SELECT id_paciente
    FROM CONSULTAS
    WHERE status = 'Realizada'
);

-- Relatório 4.2: Lista os médicos que *não* são da especialidade 'Cardiologia'.
SELECT nome, crm
FROM MEDICOS
WHERE id_especialidade <> (
    SELECT id_especialidade
    FROM ESPECIALIDADES
    WHERE nome_especialidade = 'Cardiologia'
);

-- 5. Relatórios com Junção de Tabelas (JOIN)

-- Relatório 5.1: Mostra o nome do médico e o nome da sua respectiva especialidade.
SELECT
    m.nome AS nome_medico,
    m.crm,
    e.nome_especialidade
FROM MEDICOS m
JOIN ESPECIALIDADES e ON m.id_especialidade = e.id_especialidade
ORDER BY e.nome_especialidade, m.nome;

-- Relatório 5.2: Relatório completo de consultas, mostrando nome do paciente, médico, data e status.
SELECT
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    c.data_consulta,
    c.status,
    c.observacoes
FROM CONSULTAS c
JOIN PACIENTES p ON c.id_paciente = p.id_paciente
JOIN MEDICOS m ON c.id_medico = m.id_medico
ORDER BY c.data_consulta DESC;
















