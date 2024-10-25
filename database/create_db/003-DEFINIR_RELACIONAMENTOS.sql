use bd_tcc_etim_122_g6;

ALTER TABLE enderecos ADD foreign key (usu_cod) references usuarios (usu_cod); 


ALTER TABLE compras ADD foreign key (ende_cod) references enderecos (ende_cod); 


ALTER TABLE carrinho ADD foreign key (usu_cod) references usuarios (usu_cod); 


ALTER TABLE carrinho ADD foreign key (prod_cod) references produtos (prod_cod); 


ALTER TABLE imagens ADD foreign key (prod_cod) references produtos (prod_cod); 


ALTER TABLE compra_produtos ADD foreign key (comp_cod) references compras (comp_cod); 


ALTER TABLE compra_produtos ADD foreign key (prod_cod) references produtos (prod_cod); 


ALTER TABLE favoritos ADD foreign key (usu_cod) references usuarios (usu_cod); 


ALTER TABLE favoritos ADD foreign key (prod_cod) references produtos (prod_cod); 