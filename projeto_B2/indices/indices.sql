
CREATE INDEX lvr_index_name
ON livro(lvr_nome);

CREATE INDEX atr_index_fnome_lnome
ON autor(atr_fnome, atr_lnome);

CREATE UNIQUE INDEX edtr_index_nome
ON editora(edtr_nome);

CREATE INDEX exp_indice_numero
ON exemplares(exp_numero);

CREATE INDEX emprestimo_datas
ON emprestimo(data_inicio, data_entrega);

CREATE INDEX socio_index_fnome_lnome
ON socio(socio_fnome, socio_lnome);

CREATE INDEX socio_index_cpf
ON socio(socio_cpf);