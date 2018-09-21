-- TRAZER UNIDADES POR NOME DA CLINICA
SELECT * FROM CLINICA A
	INNER JOIN UNIDADE B
    ON A.ID_CLINICA = B.ID_CLINICA
    WHERE A.NOME = 'The Way'; --VARIAVEL

-- TRAZER CLINICAS E SUAS UNIDADES POR ESTADO
SELECT * FROM CLINICA A
	INNER JOIN UNIDADE B
    WHERE B.ESTADO = 'SP'; --VARIAVEL

-- TRAZER TRATRAMENTOS DE UMA UNIDADE
SELECT C.NOME FROM UNIDADE A
	INNER JOIN UNIxTRATAMENTO B
		ON A.ID_UNIDADE = B.ID_UNIDADE
	INNER JOIN TRATAMENTO C
		ON B.ID_TRATAMENTO = C.ID_TRATAMENTO
	WHERE A.ID_UNIDADE = 1; --VARIAVEL

-- TRAZER NUMEROS DE TELEFONE DE UMA UNIDADE
SELECT B.TELEFONE FROM UNIDADE A
	INNER JOIN TELEFONE B
		ON A.ID_UNIDADE = B.ID_UNIDADE
	WHERE A.ID_UNIDADE = 1; --VARIAVEL

-- TRAZER MEDIA DE NOTAS DADAS PARA UMA UNIDADE
SELECT AVG(NOTA) FROM UNIDADE A
	INNER JOIN AVALIACAO B
		ON A.ID_UNIDADE = B.ID_UNIDADE
	WHERE A.ID_UNIDADE = 1; --VARIAVEL
    
-- TRAZER AVALIACAO COMPLETA POR UNIDADE
SELECT B.NOTA,B.COMENTARIO,B.USUARIO FROM UNIDADE A
	INNER JOIN AVALIACAO B
		ON A.ID_UNIDADE = B.ID_UNIDADE
	WHERE A.ID_UNIDADE = 1; --VARIAVEL
