USE donationspet; -- ARQUIVO PARA CRIAÇÃO DE SELECT

-- SELECTS gráfico matheus
SELECT * FROM Income;
SELECT * FROM Inventory;
SELECT * FROM FinancialTransactions;

-- SELECTS gráfico Raissa




SELECT 
    CASE 
        WHEN age <= 1 THEN 'Filhote'
        WHEN age <= 5 THEN 'Adulto Jovem'
        WHEN age <= 10 THEN 'Adulto'
        ELSE 'Idoso'
    END AS faixa_etaria,
    COUNT(*) AS quantidade,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Adoptions) AS percentual
FROM Animals
JOIN Adoptions ON Animals.animal_id = Adoptions.animal_id
GROUP BY faixa_etaria;
