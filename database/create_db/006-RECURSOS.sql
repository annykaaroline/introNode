-- SELECT COM TODOS OS CAMPOS
SELECT usuarios , usu_nome, usu_telefone, usu_senha, usu_login FROM usuarios;
SELECT enderecos, ende_logradouro, ende_numero, ende_complemento, ende_bairro, ende_cep, ende_cidade, ende_estado, ende_principal, usu_cod FROM enderecos;
SELECT produtos, prod_nome, prod_valor, prod_descricao, prod_unidade FROM produtos;
SELECT imagens, img_descricao, img_imagem, img_principal, prod_cod FROM imagens;
SELECT compras, comp_dt, comp_pg, ende_cod, comp_desconto, comp_acrescimo FROM compras;
SELECT carrinho, usu_cod, prod_cod, car_qtd FROM carrinho;
SELECT compra_produtos, comp_cod, prod_cod, cppd_qtd, cppd_observacoes FROM compra_produtos;
SELECT favoritos, usu_cod, prod_cod FROM favoritos;



-- DROP DE TODAS AS TABELAS NA ORDEM DE EXCLUSÃO
drop table compra_produtos; 
drop table favoritos; 
drop table carrinho; 
drop table imagens; 
drop table produtos;
drop table compras;
drop table enderecos;
drop table usuarios;

-- DESCRIBE DE TODAS AS TABELAS
DESCRIBE compra_produtos;
DESCRIBE produtos;
DESCRIBE favoritos;
DESCRIBE carrinho;
DESCRIBE imagens;
DESCRIBE compras;
DESCRIBE enderecos;
DESCRIBE usuarios; 

-- INSTRUÇÃO PARA APAGAR OS REGISTROS
DELETE FROM pedido_produtos;
DELETE FROM endereco_clientes;
DELETE FROM clientes;
DELETE FROM usuarios;

-- RESETAR AUTO INCREMENTO - APENAS DAS TABELAS QUE TEM A CHAVE PRIMÁRIA COMO AUTOINCREMENTO
ALTER TABLE usuarios AUTO_INCREMENT = 1;
ALTER TABLE produtos AUTO_INCREMENT = 1;
ALTER TABLE imagens AUTO_INCREMENT = 1;
ALTER TABLE compras AUTO_INCREMENT = 1;
ALTER TABLE enderecos AUTO_INCREMENT = 1;



-- COMANDOS API

SELECT usu_id FROM usuarios 
WHERE usu_email = 'gbezsousa@gmail.com';

SELECT usu_id, usu_nome, usu_tipo FROM usuarios 
WHERE usu_email = 'gbezsousa@gmail.com' AND usu_senha = '123' AND usu_ativo = 1;

SELECT DISTINCT cid_uf FROM cidades ORDER BY cid_uf ASC;

SELECT 
prd.prd_id, prd.prd_nome, prd.prd_valor, prd.prd_unidade, pdt.ptp_icone, prd.prd_img, prd.prd_descricao 
FROM produtos prd 
INNER JOIN produto_tipos pdt ON pdt.ptp_id = prd.ptp_id 
WHERE prd.prd_disponivel = 1 AND prd.prd_nome LIKE '%%' AND prd.ptp_id LIKE '%%' AND prd.prd_valor < 1000; 

SELECT MAX(prd_valor) vlr_max FROM produtos; 

-- listar ingredientes do produto
SELECT ing.ing_nome 
FROM produto_ingredientes pi 
INNER JOIN ingredientes ing ON ing.ing_id = pi.ing_id 
WHERE pi.prd_id = 1 AND pi.prd_ing_adicional = 0; 

-- listar opções de adicionais do produto
SELECT ing.ing_nome 
FROM produto_ingredientes pi 
INNER JOIN ingredientes ing ON ing.ing_id = pi.ing_id 
WHERE pi.prd_id = 1 AND pi.prd_ing_adicional = 1;  

-- listar clientes (repete devido a inserção de mais de um endereço por cliente)
SELECT us.usu_nome, us.usu_dt_nasc, cli.cli_cel, cli.cli_pts, cid.cid_nome  
FROM clientes cli 
RIGHT JOIN usuarios us ON us.usu_id 
INNER JOIN endereco_clientes edcl ON edcl.usu_id = cli.usu_id 
INNER JOIN cidades cid ON cid.cid_id = edcl.cid_id 
WHERE us.usu_ativo = 1 AND cli.cli_cel = '11988885678';  

-- só traz o cliente com endereço principal
SELECT us.usu_nome, us.usu_dt_nasc, cl.cli_cel, cl.cli_pts, cid.cid_nome FROM clientes cl
INNER JOIN usuarios us ON us.usu_id = cl.usu_id 
INNER JOIN endereco_clientes edcl ON edcl.usu_id = cl.usu_id 
INNER JOIN cidades cid ON cid.cid_id = edcl.cid_id 
WHERE us.usu_ativo = 1 AND edcl.end_principal = 1 AND cl.cli_cel = '11988885678';  

-- lista mesmo sem ter o endereço
SELECT us.usu_nome, us.usu_dt_nasc, cl.cli_cel, cl.cli_pts, cid.cid_nome 
FROM clientes cl
INNER JOIN usuarios us ON us.usu_id = cl.usu_id 
LEFT JOIN endereco_clientes edcl ON edcl.usu_id = cl.usu_id AND edcl.end_principal = 1
LEFT JOIN cidades cid ON cid.cid_id = edcl.cid_id 
WHERE us.usu_ativo = 1 AND cl.cli_cel = '11988885678'; 

-- lista verificando o endereço principal se houver endereço cadastrado
SELECT 
    us.usu_nome, 
    us.usu_dt_nasc, 
    cl.cli_cel, 
    cl.cli_pts, 
    cid.cid_nome 
FROM clientes cl
INNER JOIN usuarios us ON us.usu_id = cl.usu_id 
LEFT JOIN (
    SELECT 
        edcl.usu_id, 
        edcl.cid_id 
    FROM endereco_clientes edcl 
    WHERE edcl.end_principal = 1
) edcl_principal ON edcl_principal.usu_id = cl.usu_id
LEFT JOIN cidades cid ON cid.cid_id = edcl_principal.cid_id 
WHERE us.usu_ativo = 1 
AND cl.cli_cel = '18912345678'; -- 11988885678 18912345678