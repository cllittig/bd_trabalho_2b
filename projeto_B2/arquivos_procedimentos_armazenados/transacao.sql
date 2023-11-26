START TRANSACTION;

    SELECT *
    FROM livro 
    FOR UPDATE;

    UPDATE livro
    SET lvr_valor = lvr_valor + (lvr_valor * 0.1);



COMMIT;