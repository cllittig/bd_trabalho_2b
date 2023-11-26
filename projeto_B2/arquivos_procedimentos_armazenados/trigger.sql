DELIMITER $$

CREATE TRIGGER emp_data_emprestimo AFTER INSERT
ON emprestimo FOR EACH ROW
BEGIN
    UPDATE emprestimo 
    SET data_inicio = IF(data_inicio > CURDATE(), CURDATE(), data_inicio);
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER emp_data_emprestimo_entrega_menor AFTER INSERT
ON emprestimo FOR EACH ROW
BEGIN
    UPDATE emprestimo
    SET data_inicio = IF(data_inicio > data_entrega, CURDATE(), data_inicio);
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER lvr_valor_livro AFTER INSERT
ON livro FOR EACH ROW
BEGIN
    UPDATE livro 
    SET lvr_valor = IF(lvr_valor < 0, 0, lvr_valor);
END $$
DELIMITER ;

DELIMITER $$

CREATE TRIGGER atr_rna_inexistente AFTER INSERT
ON autor FOR EACH ROW
BEGIN
    UPDATE autor
    SET atr_rna = IF(atr_rna IS NULL, 0, atr_rna);
END $$
DELIMITER ;

