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


-- SELECTS gráfico Hewel
SELECT 
    MONTH(donation_date) AS month, 
    SUM(amount) AS total_donated,
    (SUM(amount) / (SELECT SUM(amount) FROM Donations WHERE donation_date BETWEEN '2024-01-01' AND '2024-05-31')) * 100 AS percentage
FROM 
    Donations
WHERE 
    donation_date BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY 
    MONTH(donation_date);

SELECT 
    payment_method,
    COUNT(*) AS num_transactions,
    SUM(amount) AS total_amount
FROM 
    FinancialTransactions
WHERE 
    payment_method IN ('Cartão de Crédito', 'Cartão de Débito')
GROUP BY 
    payment_method;

SELECT 
    CASE
        WHEN LENGTH(cpf_cnpj) = 11 THEN 'Pessoa Física'
        WHEN LENGTH(cpf_cnpj) = 14 THEN 'Pessoa Jurídica'
        ELSE 'Outro'
    END AS profile_type,
    COUNT(*) AS num_donations,
    SUM(d.amount) AS total_donated
FROM 
    Donors dn
JOIN 
    Donations d ON dn.donor_id = d.donor_id
GROUP BY 
    profile_type
ORDER BY 
    total_donated DESC;

