-- Inserções na tabela usuarios
INSERT INTO usuarios (usu_nome, usu_telefone, usu_senha, usu_login) VALUES
('Ana Paula', '14996166687', 'senha123', 'ana.paula@example.com'),
('Carlos Eduardo', '14996277788', 'senha456', 'carlos.eduardo@example.com'),
('Fernanda Lima', '14996388899', 'senha789', 'fernanda.lima@example.com');

-- Inserções na tabela enderecos
INSERT INTO enderecos (ende_logradouro, ende_numero, ende_complemento, ende_bairro, ende_cep, ende_cidade, ende_estado, ende_principal, usu_cod) VALUES
('Rua das Flores', '100', 'Apt 101', 'Centro', '17600000', 'Tupã', 'SP', 1, 1),
('Avenida Brasil', '200', 'Bloco B', 'Jardim', '17600111', 'Tupã', 'SP', 1, 2),
('Rua das Acácias', '300', 'Casa 3', 'Vila Nova', '17600222', 'Tupã', 'SP', 1, 3);

-- Inserções na tabela produtos
INSERT INTO produtos (prod_nome, prod_valor, prod_descricao, prod_unidade) VALUES
('Bolo de Chocolate', 25.50, 'Delicioso bolo de chocolate com cobertura de brigadeiro', 'un'),
('Brigadeiro', 1.50, 'Brigadeiro tradicional com granulado', 'un'),
('Beliscão', 20.00, 'massinha com goiabada', 'un'),
('Doce de Abacaxi', 30.00, 'Torta de limão com merengue', 'un'),
('Ovo de pascoa ', 2.50, 'Pão de mel recheado com doce de leite', 'un');

-- Inserções na tabela imagens
INSERT INTO imagens (img_descricao, img_imagem, img_principal, prod_cod) VALUES
('Bolo de Chocolate', 'bolo_chocolate.png', 1, 1),
('Brigadeiro', 'brigadeiro.png', 1, 2),
('Coxinha', 'coxinha.png', 1, 3),
('Torta de Limão', 'torta_limao.png', 1, 4),
('Pão de Mel', 'pao_mel.png', 1, 5);

-- Inserções na tabela compras
INSERT INTO compras (comp_dt, comp_pg, ende_cod, comp_desconto, comp_acrescimo) VALUES
('2024-05-10 14:30:00', 'Pix', 1, 5.00, 0.00),
('2024-05-12 16:00:00', 'Cartão de Crédito', 2, 0.00, 2.00);

-- Inserções na tabela carrinho
INSERT INTO carrinho (usu_cod, prod_cod, car_qtd) VALUES
(1, 1, 1),
(1, 2, 10),
(2, 3, 5),
(2, 4, 2),
(3, 5, 6);

-- Inserções na tabela compra_produtos
INSERT INTO compra_produtos (comp_cod, prod_cod, cppd_qtd, cppd_observacoes) VALUES
(1, 1, 1.00, 'Para festa de aniversário'),
(1, 2, 10.00, 'Sem observações'),
(2, 3, 5.00, 'Entrega rápida, por favor'),
(2, 4, 2.00, 'Sem observações');

-- Inserções na tabela favoritos
INSERT INTO favoritos (usu_cod, prod_cod) VALUES
(1, 1),
(1, 4),
(2, 3),
(3, 5);