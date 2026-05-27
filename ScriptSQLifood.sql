CREATE DATABASE IF NOT EXISTS IFOOD;
USE IFOOD;

CREATE TABLE IF NOT EXISTS CLIENTE 
(
    id  SERIAL PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    cpf  CHAR(11)     NOT NULL UNIQUE,
    email   VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15)  NOT NULL
);

CREATE TABLE IF NOT EXISTS ENTREGADOR 
(
    id  SERIAL PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    cpf  CHAR(11)     NOT NULL UNIQUE,
    tipo_veiculo  VARCHAR(30)  NOT NULL,
    placa VARCHAR(10)  NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS PRODUTO 
(
    id SERIAL PRIMARY KEY,
    nome  VARCHAR(100)   NOT NULL,
    descricao TEXT,
    preco_unit  NUMERIC(10,2)  NOT NULL CHECK (preco_unit >= 0)
);
 
CREATE TABLE IF NOT EXISTS PEDIDO (
    id  SERIAL PRIMARY KEY,
    cliente_id   INT  NOT NULL REFERENCES CLIENTE(id),
    entregador_id  INT  NOT NULL REFERENCES ENTREGADOR(id),
    data_hora  TIMESTAMP  NOT NULL DEFAULT NOW(),
    valor_total  NUMERIC(10,2)  NOT NULL CHECK (valor_total >= 0)
);

INSERT INTO CLIENTE (nome, cpf, email, telefone) VALUES
('Ana Beatriz Souza', '10120230301', 'ana.souza@email.com',       '(11) 91111-0001'),
('Bruno Henrique Lima',      '20230340412', 'bruno.lima@email.com',      '(21) 92222-0002'),
('Carla Fernanda Rocha',     '30340450523', 'carla.rocha@email.com',     '(31) 93333-0003'),
('Diego Martins Alves',      '40450560634', 'diego.alves@email.com',     '(41) 94444-0004'),
('Eduarda Cristina Nunes',   '50560670745', 'eduarda.nunes@email.com',   '(51) 95555-0005'),
('Felipe Torres Barros',     '60670780856', 'felipe.barros@email.com',   '(61) 96666-0006'),
('Gabriela Ramos Pereira',   '70780890967', 'gabriela.pereira@email.com','(71) 97777-0007'),
('Heitor Vieira Costa',      '80891001078', 'heitor.costa@email.com',    '(81) 98888-0008'),
('Isabela Fonseca Dias',     '90901111189', 'isabela.dias@email.com',    '(85) 99999-0009'),
('João Pedro Carvalho',      '10112221290', 'joao.carvalho@email.com',   '(11) 90000-0010'),
('Karen Oliveira Santos',    '21223331301', 'karen.santos@email.com',    '(21) 91111-0011'),
('Lucas Eduardo Freitas',    '32334441412', 'lucas.freitas@email.com',   '(31) 92222-0012'),
('Mariana Gomes Araújo',     '43445551523', 'mariana.araujo@email.com',  '(41) 93333-0013'),
('Nicolas André Ribeiro',    '54556661634', 'nicolas.ribeiro@email.com', '(51) 94444-0014'),
('Olivia Mendes Azevedo',    '65667771745', 'olivia.azevedo@email.com',  '(61) 95555-0015'),
('Pedro Augusto Cavalcante', '76778881856', 'pedro.cavalcante@email.com','(71) 96666-0016'),
('Queila Brandão Melo',      '87889991967', 'queila.melo@email.com',     '(81) 97777-0017'),
('Rafael Cunha Monteiro',    '98990102078', 'rafael.monteiro@email.com', '(85) 98888-0018'),
('Sabrina Leal Pinto',       '01001212189', 'sabrina.pinto@email.com',   '(11) 99999-0019'),
('Thiago Borges Correia',    '12112322290', 'thiago.correia@email.com',  '(21) 90000-0020');

INSERT INTO ENTREGADOR (nome, cpf, tipo_veiculo, placa) VALUES
('Adriano Mota Ferreira',   '11122233300', 'Moto',       'ABC-1A23'),
('Bianca Souza Lopes',      '22233344411', 'Bicicleta',  'BIC-0001'),
('Carlos Pinheiro Dias',    '33344455522', 'Moto',       'DEF-2B34'),
('Daniela Farias Leite',    '44455566633', 'Carro',      'GHI-3C45'),
('Evandro Nascimento Cruz', '55566677744', 'Moto',       'JKL-4D56'),
('Fabio Queiroz Barbosa',   '66677788855', 'Van',        'MNO-5E67'),
('Giovanna Teixeira Luz',   '77788899966', 'Bicicleta',  'BIC-0002'),
('Humberto Araújo Vilar',   '88899900077', 'Moto',       'PQR-6F78'),
('Irene Cavalcanti Moura',  '99900011188', 'Carro',      'STU-7G89'),
('Jorge Henrique Campos',   '00011122299', 'Moto',       'VWX-8H90');

INSERT INTO PRODUTO (nome, descricao, preco_unit) VALUES
('X-Burguer Clássico',   'Hambúrguer com queijo, alface e tomate',         22.90),
('Pizza Margherita',     'Molho de tomate, mussarela e manjericão',        45.00),
('Frango Grelhado',      'Peito de frango grelhado com legumes',           32.50),
('Sushi Combo 20 peças', 'Combinado variado de sushi e sashimi',           69.90),
('Açaí 500ml',           'Açaí cremoso com granola e banana',              18.00),
('Salada Caesar',        'Alface romana, croutons e molho Caesar',         26.00),
('Macarrão ao Sugo',     'Espaguete com molho de tomate artesanal',        28.50),
('Batata Frita G',       'Porção grande de batata frita crocante',         16.00),
('Refrigerante 2L',      'Refrigerante gelado 2 litros',                   12.00),
('Sobremesa Brownie',    'Brownie de chocolate com sorvete de baunilha',   14.90);

INSERT INTO PEDIDO (cliente_id, entregador_id, data_hora, valor_total) VALUES
( 1,  1, '2025-01-05 08:30:00',  89.80),
( 2,  2, '2025-01-06 09:15:00',  45.00),
( 3,  3, '2025-01-07 10:00:00', 125.50),
( 4,  4, '2025-01-08 11:45:00',  62.40),
( 5,  5, '2025-01-09 12:20:00',  55.90),
( 6,  6, '2025-01-10 13:00:00',  98.00),
( 7,  7, '2025-01-11 14:30:00',  36.00),
( 8,  8, '2025-01-12 15:10:00',  74.50),
( 9,  9, '2025-01-13 16:00:00', 139.80),
(10, 10, '2025-01-14 17:45:00',  28.50),
(11,  1, '2025-01-15 18:30:00',  50.00),
(12,  2, '2025-01-16 19:00:00',  83.90),
(13,  3, '2025-01-17 20:15:00',  22.90),
(14,  4, '2025-01-18 21:00:00',  69.90),
(15,  5, '2025-01-19 08:00:00',  46.50),
(16,  6, '2025-01-20 09:30:00', 110.00),
(17,  7, '2025-01-21 10:45:00',  32.00),
(18,  8, '2025-01-22 11:20:00',  57.80),
(19,  9, '2025-01-23 12:00:00',  91.40),
(20, 10, '2025-01-24 13:30:00',  44.90),
( 1,  3, '2025-02-01 14:00:00',  67.50),
( 2,  4, '2025-02-02 15:20:00',  38.00),
( 3,  5, '2025-02-03 16:10:00', 102.30),
( 4,  6, '2025-02-04 17:45:00',  79.60),
( 5,  7, '2025-02-05 18:30:00',  53.20),
( 6,  8, '2025-02-06 19:00:00',  88.00),
( 7,  9, '2025-02-07 20:15:00',  41.80),
( 8, 10, '2025-02-08 21:00:00', 120.00),
( 9,  1, '2025-02-09 08:30:00',  35.50),
(10,  2, '2025-02-10 09:00:00',  76.90),
(11,  4, '2025-02-11 10:30:00',  60.00),
(12,  5, '2025-02-12 11:45:00',  47.30),
(13,  6, '2025-02-13 12:15:00',  93.70),
(14,  7, '2025-02-14 13:00:00',  29.80),
(15,  8, '2025-02-15 14:30:00', 154.00),
(16,  9, '2025-02-16 15:10:00',  66.20),
(17, 10, '2025-02-17 16:00:00',  42.10),
(18,  1, '2025-02-18 17:45:00',  85.50),
(19,  2, '2025-02-19 18:30:00',  31.00),
(20,  3, '2025-02-20 19:00:00', 107.60);

SELECT * FROM cliente;
SELECT * FROM entregador;
SELECT * FROM pedido;
SELECT * FROM produto;

ALTER TABLE CLIENTE
    ADD COLUMN data_nascimento  DATE NULL,
    ADD COLUMN status_cliente   VARCHAR(10)  NOT NULL DEFAULT 'Ativo';

-- Cliente  1 — Ana Beatriz Souza
UPDATE CLIENTE SET data_nascimento = '1995-03-14' 
WHERE id = 1;
-- Cliente  2 — Bruno Henrique Lima
UPDATE CLIENTE SET data_nascimento = '1990-07-22' 
WHERE id = 2;
-- Cliente  3 — Carla Fernanda Rocha
UPDATE CLIENTE SET data_nascimento = '1988-11-05' 
WHERE id = 3;
-- Cliente  4 — Diego Martins Alves
UPDATE CLIENTE SET data_nascimento = '2000-01-30' 
WHERE id = 4;
-- Cliente  5 — Eduarda Cristina Nunes
UPDATE CLIENTE SET data_nascimento = '1997-06-18' 
WHERE id = 5;
-- Cliente  6 — Felipe Torres Barros
UPDATE CLIENTE SET data_nascimento = '1985-09-02' 
WHERE id = 6;
-- Cliente  7 — Gabriela Ramos Pereira
UPDATE CLIENTE SET data_nascimento = '2001-12-25' 
WHERE id = 7;
-- Cliente  8 — Heitor Vieira Costa
UPDATE CLIENTE SET data_nascimento = '1993-04-07' 
WHERE id = 8;
-- Cliente  9 — Isabela Fonseca Dias
UPDATE CLIENTE SET data_nascimento = '1999-08-15' 
WHERE id = 9;
-- Cliente 10 — João Pedro Carvalho
UPDATE CLIENTE SET data_nascimento = '1996-02-28' 
WHERE id = 10;
-- Cliente 11 — Karen Oliveira Santos
UPDATE CLIENTE SET data_nascimento = '1987-10-11' 
WHERE id = 11;
-- Cliente 12 — Lucas Eduardo Freitas
UPDATE CLIENTE SET data_nascimento = '2002-05-03' 
WHERE id = 12;
-- Cliente 13 — Mariana Gomes Araújo
UPDATE CLIENTE SET data_nascimento = '1994-07-19' 
WHERE id = 13;
-- Cliente 14 — Nicolas André Ribeiro
UPDATE CLIENTE SET data_nascimento = '1991-03-27' 
WHERE id = 14;
-- Cliente 15 — Olivia Mendes Azevedo
UPDATE CLIENTE SET data_nascimento = '1998-01-09'
WHERE id = 15;
-- Cliente 16 — Pedro Augusto Cavalcante
UPDATE CLIENTE SET data_nascimento = '1983-06-30' 
WHERE id = 16;
-- Cliente 17 — Queila Brandão Melo
UPDATE CLIENTE SET data_nascimento = '2003-11-14' 
WHERE id = 17;
-- Cliente 18 — Rafael Cunha Monteiro
UPDATE CLIENTE SET data_nascimento = '1989-09-08' 
WHERE id = 18;
-- Cliente 19 — Sabrina Leal Pinto
UPDATE CLIENTE SET data_nascimento = '1996-04-22' 
WHERE id = 19;
-- Cliente 20 — Thiago Borges Correia
UPDATE CLIENTE SET data_nascimento = '1992-12-01' 
WHERE id = 20;

UPDATE CLIENTE SET status_cliente = 'Ativo'
WHERE id IN (1, 2, 3, 4, 5, 6, 7, 10, 12, 13, 15, 16, 18, 19, 20);

UPDATE CLIENTE SET status_cliente = 'Inativo' WHERE id = 8;  
UPDATE CLIENTE SET status_cliente = 'Inativo' WHERE id = 9;   
UPDATE CLIENTE SET status_cliente = 'Inativo' WHERE id = 11;  
UPDATE CLIENTE SET status_cliente = 'Inativo' WHERE id = 14;  
UPDATE CLIENTE SET status_cliente = 'Inativo' WHERE id = 17; 

-- Pedido 3 - Valor corrigido 
UPDATE PEDIDO
SET valor_total = 133.50 -- era 125,50
WHERE id = 3;
 
-- Pedido 7 — Entregador trocado: Giovanna (7) → Adriano (1)
UPDATE PEDIDO
SET entregador_id = 1  -- era 7
WHERE id = 7;
 
-- Pedido 15 — Valor atualizado após desconto de cupom 
UPDATE PEDIDO
SET valor_total = 36.50  -- era 46,50
WHERE id = 15;
 
-- Pedido 22 — Entregador trocado: Daniela (4) → Evandro (5)
UPDATE PEDIDO
SET  entregador_id = 5  -- era 4
WHERE  id = 22;
 
-- Pedido 35 — Valor corrigido 
UPDATE PEDIDO
SET valor_total = 173.90  -- era 154,00
WHERE  id = 35;

-- Verificação prévia (Boa Prática)
SELECT id, cliente_id, entregador_id, data_hora, valor_total
FROM PEDIDO
WHERE id IN (10, 18, 25, 31, 39);

DELETE FROM PEDIDO WHERE id = 10; -- João Pedro Carvalho  — R$ 28,50
DELETE FROM PEDIDO WHERE id = 18; -- Rafael Cunha Monteiro — R$ 57,80
DELETE FROM PEDIDO WHERE id = 25; -- Eduarda Cristina Nunes — R$ 53,20
DELETE FROM PEDIDO WHERE id = 31; -- Karen Oliveira Santos — R$ 60,00
DELETE FROM PEDIDO WHERE id = 39; -- Sabrina Leal Pinto  — R$ 31,00

-- Ver estrutura final da tabela CLIENTE com novas colunas
SELECT id, nome, data_nascimento, status_cliente
FROM   CLIENTE
ORDER  BY id;
