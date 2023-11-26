SELECT
    s.socio_id AS id,
    CONCAT(s.socio_fnome, ' ', s.socio_lnome) AS nome,
    l.lvr_nome AS livro,
    ex.exp_numero AS numero_exemplar
FROM
    socio AS s
INNER JOIN
    emprestimo AS e ON s.socio_id = e.socio_socio_id
INNER JOIN
    exemplares AS ex ON ex.exp_id = e.exemplares_exp_id
INNER JOIN
    livro AS l ON l.lvr_id = ex.livro_lvr_id
WHERE
    s.data_nascimento > '2005-01-01'
ORDER BY
    s.socio_fnome
;

-- seleção dos socio, o titulo do livros que eles estão em posse e o numero do exemplar


SELECT
    CONCAT(a.atr_fnome, ' ', a.atr_lnome) AS nome_autor,
    l.lvr_nome AS nome_livro,
    e.edtr_nome AS nome_editora
FROM
    autor AS a
INNER JOIN
    livro_has_autor AS lha ON lha.autor_atr_id = a.atr_id
INNER JOIN
    livro AS l ON lha.livro_lvr_id = l.lvr_id
INNER JOIN
    autor_has_editora AS ahe ON ahe.autor_atr_id = a.atr_id
INNER JOIN
    editora AS e ON e.edtr_id = ahe.editora_edtr_id
WHERE
    l.lvr_lancamento > '2000-01-01'
    
ORDER BY a.atr_fnome 
;

-- seleciona o nome do autor, o nome do livros que ele escreveu e a editora que ele publicou o livro


SELECT
    s.socio_id AS id,
    CONCAT(s.socio_fnome, ' ', s.socio_lnome) AS nome_completo,
    COUNT(CONCAT(e.socio_socio_id, e.exemplares_exp_id)) AS numero_emprestimo
FROM
    socio AS s
INNER JOIN
    emprestimo AS e ON s.socio_id = e.socio_socio_id
GROUP BY
    1
ORDER BY
    s.socio_id;

-- seleciona os socios e a quantidade de livros que eles pegaram como emprestimo