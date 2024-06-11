CREATE DATABASE donationsPet;
USE donationsPet;

CREATE TABLE Donors (
    donor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    cpf_cnpj VARCHAR(20) UNIQUE,
    registration_date DATE
);

CREATE TABLE Donations (
    donation_id INT PRIMARY KEY AUTO_INCREMENT,
    donor_id INT,
    donation_category VARCHAR(50),
    amount DECIMAL(10,2),
    donation_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);

CREATE TABLE Animals (
    animal_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    animal_condition VARCHAR(50),
    location VARCHAR(100)
);

CREATE TABLE Campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_name VARCHAR(100),
    description TEXT,
    fundraising_goal DECIMAL(10, 2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE Inventory (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(100),
    quantity INT,
    acquisition_date DATE,
    expiration_date DATE,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    campaign_id INT,  -- Relaciona com Campaigns
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);

CREATE TABLE FinancialTransactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_description TEXT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    payment_method VARCHAR(50),
    campaign_id INT,  -- Relaciona com Campaigns
    resource_id INT,  -- Relaciona com Inventory
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id),
    FOREIGN KEY (resource_id) REFERENCES Inventory(resource_id)
);

CREATE TABLE Adoptions (
    adoption_id INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT,
    adopter_id INT,
    adoption_date DATE,
    documentation TEXT,
    FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
    FOREIGN KEY (adopter_id) REFERENCES Donors(donor_id)
);

CREATE TABLE Income (
    income_id INT PRIMARY KEY AUTO_INCREMENT,
    source VARCHAR(50),
    total_amount DECIMAL(10, 2),
    campaign_id INT,
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);

SELECT * FROM Donors;

INSERT INTO Donors (name, email, phone, address, cpf_cnpj, registration_date) VALUES
('Alberto José', 'alberto.jose@example.com', '9876543210', 'Rua C, 456', '987.654.321-01', '2024-01-05'),
('Aruan Felix', 'aruan.felix@example.com', '8765432109', 'Avenida D, 789', '876.543.210-02', '2024-02-10'),
('Joana Marques', 'joana.marques@example.com', '7654321098', 'Travessa E, 1011', '765.432.109-03', '2024-02-15'),
('Leandro da Silva', 'leandro.silva@example.com', '2345678901', 'Avenida F, 1314', '234.567.890-04', '2024-02-20'),
('Marcio Romano', 'marcio.romano@example.com', '3456789012', 'Rua G, 1516', '345.678.901-05', '2024-03-01'),
('Mariana Lima', 'mariana.lima@example.com', '4567890123', 'Avenida H, 1718', '456.789.012-06', '2024-03-10'),
('Milena Gimenez', 'milena.gimenez@example.com', '5678901234', 'Rua I, 1920', '567.890.123-07', '2024-03-15'),
('Samira Ferreira', 'samira.ferreira@example.com', '6789012345', 'Avenida J, 2122', '678.901.234-08', '2024-04-01'),
('Vanessa Lopes', 'vanessa.lopes@example.com', '7890123456', 'Rua K, 2324', '789.012.345-09', '2024-04-05'),
('Alberto Ribeiro', 'alberto.ribeiro@example.com', '8901234567', 'Avenida L, 2526', '890.123.456-10', '2024-04-10'),
('Carlos Alemão', 'carlos.alemao@example.com', '9012345678', 'Rua M, 2728', '901.234.567-11', '2024-04-15'),
('Creuza Nunes', 'creuza.nunes@example.com', '0123456789', 'Avenida N, 2930', '012.345.678-12', '2024-04-20'),
('Eduardo Costa', 'eduardo.costa@example.com', '1234509876', 'Rua O, 3132', '123.450.987-13', '2024-05-01'),
('Jimmy Turner', 'jimmy.turner@example.com', '2345678901', 'Avenida P, 3334', '234.567.890-14', '2024-05-05'),
('Leonardo Fonseca', 'leonardo.fonseca@example.com', '3456789012', 'Rua Q, 3536', '345.678.901-15', '2024-05-10'),
('Maria Antonella', 'maria.antonella@example.com', '4567890123', 'Avenida R, 3738', '456.789.012-16', '2024-05-15'),
('Mario Cunha', 'mario.cunha@example.com', '5678901234', 'Rua S, 3940', '567.890.123-17', '2024-05-20'),
('Peter Jorge', 'peter.jorge@example.com', '6789012345', 'Avenida T, 4142', '678.901.234-18', '2024-06-01'),
('Robson Veneza', 'robson.veneza@example.com', '7890123456', 'Rua U, 4344', '789.012.345-19', '2024-06-05'),
('Andrei Levi', 'andrei.levi@example.com', '8901234567', 'Avenida V, 4546', '890.123.456-20', '2024-06-10'),
('Cristian Gutierrez', 'cristian.gutierrez@example.com', '9012345678', 'Rua W, 4748', '901.234.567-21', '2024-06-11'),
('Debora Ferreira', 'debora.ferreira@example.com', '0123456789', 'Avenida X, 4950', '012.345.678-22', '2024-06-11'),
('Geraldo Dutra', 'geraldo.dutra@example.com', '1234509876', 'Rua Y, 5152', '123.450.987-23', '2024-06-11'),
('Leandro Martins', 'leandro.martins@example.com', '2345678901', 'Avenida Z, 5354', '234.567.890-24', '2024-06-11'),
('Lorenzo Carvalho', 'lorenzo.carvalho@example.com', '3456789012', 'Rua AA, 5556', '345.678.901-25', '2024-06-11'),
('Mariano Lima', 'mariano.lima@example.com', '4567890123', 'Avenida AB, 5758', '456.789.012-26', '2024-06-11'),
('Matheus Marcos', 'matheus.marcos@example.com', '5678901234', 'Rua AC, 5960', '567.890.123-27', '2024-06-11'),
('Richard Porto', 'richard.porto@example.com', '6789012345', 'Avenida AD, 6162', '2024-06-11');

SELECT * FROM Donations;

INSERT INTO Donations (donor_id, donation_category, amount, donation_date, status) VALUES
(8, 'Alimentos', 80.00, '2023-09-10', 'Pendente'),
(9, 'Medicamentos', 50.00, '2023-10-05', 'Confirmada'),
(10, 'Roupas', 100.00, '2023-11-15', 'Pendente'),
(11, 'Brinquedos', 25.00, '2023-12-20', 'Confirmada'),
(12, 'Livros', 40.00, '2024-01-10', 'Pendente'),
(13, 'Material de Limpeza', 70.00, '2024-02-25', 'Pendente'),
(15, 'Alimentos', 90.00, '2024-04-15', 'Pendente'),
(16, 'Medicamentos', 60.00, '2024-05-20', 'Confirmada'),
(17, 'Roupas', 110.00, '2024-06-10', 'Pendente'),
(19, 'Livros', 50.00, '2024-08-15', 'Pendente');

SELECT * FROM Animals;

INSERT INTO Animals (name, species, breed, age, animal_condition, location) VALUES
('Rex', 'Cachorro', 'Labrador', 3, 'Em busca de lar', 'Abrigo Municipal'),
('Mimi', 'Gato', 'Siamês', 2, 'Em recuperação', 'Clínica Veterinária B'),
('Bela', 'Cachorro', 'Poodle', 4, 'Precisando de cuidados', 'Canil Comunitário'),
('Frajola', 'Gato', 'Persa', 5, 'Resgatado', 'Abrigo de Animais da Cidade'),
('Spike', 'Cachorro', 'Bulldog', 2, 'Aguardando adoção', 'Abrigo de Resgate de Cães'),
('Luna', 'Gato', 'Maine Coon', 1, 'Necessita de tratamento', 'Clínica Veterinária A'),
('Thor', 'Cachorro', 'Golden Retriever', 2, 'Procurando um lar', 'Canil Municipal'),
('Nina', 'Cachorro', 'Vira-lata', 6, 'Precisando de cuidados', 'Abrigo de Animais Abandonados'),
('Mia', 'Gato', 'Angorá', 3, 'Em reabilitação', 'Canil de Resgate de Felinos'),
('Simba', 'Cachorro', 'Pastor Alemão', 4, 'Em busca de um novo lar', 'Abrigo Comunitário para Animais'),
('Milo', 'Gato', 'Sphynx', 2, 'Recuperando-se de ferimentos', 'Clínica Veterinária C'),
('Princesa', 'Cachorro', 'Shih Tzu', 5, 'Resgatada', 'Canil de Proteção Animal'),
('Oliver', 'Gato', 'Bengal', 1, 'Precisando de atenção', 'Abrigo de Gatos Desabrigados'),
('Buddy', 'Cachorro', 'Bulldog Francês', 3, 'À espera de adoção', 'Canil de Resgate e Adoção'),
('Daisy', 'Cachorro', 'Yorkshire', 2, 'Em recuperação', 'Clínica Veterinária D'),
('Coco', 'Gato', 'Ragdoll', 4, 'Procurando um novo lar', 'Abrigo de Animais sem Dono'),
('Rocky', 'Cachorro', 'Rottweiler', 7, 'Em busca de cuidados', 'Canil de Resgate de Cães de Raça'),
('Sophie', 'Gato', 'Himalaia', 2, 'Em reabilitação', 'Clínica Veterinária E'),
('Charlie', 'Cachorro', 'Border Collie', 3, 'À espera de um dono', 'Abrigo Municipal para Animais de Estimação'),
('Loki', 'Gato', 'Siberiano', 6, 'Resgatado', 'Abrigo de Gatos de Rua'),
('Max', 'Cachorro', 'Chihuahua', 1, 'Precisando de cuidados', 'Canil de Resgate de Pequenas Raças'),
('Lucky', 'Cachorro', 'Pitbull', 4, 'Necessita de tratamento', 'Clinica Veterinária F'),
('Zoe', 'Gato', 'Birmanês', 3, 'Em busca de um lar', 'Abrigo de Felinos sem Dono'),
('Jack', 'Cachorro', 'Beagle', 2, 'Recuperando-se de ferimentos', 'Clínica Veterinária G'),
('Oreo', 'Gato', 'British Shorthair', 5, 'Resgatado', 'Abrigo de Gatos Desabrigados'),
('Bailey', 'Cachorro', 'Dálmata', 3, 'À espera de adoção', 'Canil Comunitário de Cães'),
('Chloe', 'Gato', 'Savannah', 1, 'Necessita de cuidados', 'Clínica Veterinária H'),
('Zeus', 'Cachorro', 'Doberman', 4, 'Em busca de um lar', 'Abrigo de Proteção Animal'),
('Misty', 'Gato', 'Sphynx', 2, 'Precisando de cuidados especiais', 'Canil de Resgate de Felinos'),
('Sam', 'Cachorro', 'Husky Siberiano', 6, 'Resgatado', 'Abrigo para Animais Abandonados'),
('Lucy', 'Cachorro', 'Bichon Frisé', 3, 'Em reabilitação', 'Clínica Veterinária I'),
('Lola', 'Gato', 'Bombay', 4, 'À espera de um novo lar', 'Abrigo de Animais sem Dono'),
('Cooper', 'Cachorro', 'Labrador', 2, 'Precisando de cuidados', 'Canil de Resgate de Cães Abandonados'),
('Sasha', 'Cachorro', 'Doberman', 5, 'Em busca de um lar', 'Abrigo de Cães Desabrigados'),
('Lily', 'Gato', 'Siamês', 3, 'À espera de adoção', 'Abrigo de Gatos de Rua'),
('Riley', 'Cachorro', 'Boxer', 4, 'Em recuperação', 'Clinica Veterinária J'),
('Cleo', 'Gato', 'Scottish Fold', 2, 'Precisando de cuidados', 'Canil de Resgate de Felinos sem Dono'),
('Bruno', 'Cachorro', 'Rottweiler', 7, 'Em busca de um lar', 'Abrigo de Cães de Raça Abandonados'),
('Misty', 'Gato', 'Sphynx', 1, 'Resgatado', 'Abrigo de Gatos sem Dono'),
('Ruby', 'Cachorro', 'Bulldog Inglês', 3, 'À espera de adoção', 'Canil de Proteção e Adoção Animal'),
('Molly', 'Gato', 'Persa', 2, 'Precisando de cuidados', 'Clínica Veterinária K'),
('Duke', 'Cachorro', 'Golden Retriever', 5, 'Resgatado', 'Abrigo Municipal para Cães de Raça'),
('Smokey', 'Gato', 'Maine Coon', 4, 'Em busca de um novo lar', 'Abrigo de Felinos');

SELECT * FROM Campaigns;

INSERT INTO Campaigns (campaign_name, description, fundraising_goal, start_date, end_date) VALUES
('Campanha de Verão', 'Arrecadação para cuidados no verão', 5000.00, '2023-06-01', '2023-08-31'),
('Campanha de Inverno', 'Arrecadação para aquecimento dos animais', 7000.00, '2023-12-01', '2024-02-28'),
('Campanha de Limpeza', 'Arrecadação de fundos para manutenção e limpeza do abrigo', 4000.00, '2024-04-01', '2024-05-15'),
('Campanha de Vacinação', 'Arrecadação para vacinas anuais dos animais', 3500.00, '2024-04-20', '2024-06-01'),
('Campanha de Conscientização', 'Arrecadação para programas educacionais sobre adoção responsável', 4500.00, '2024-05-01', '2024-06-30'),
('Campanha de Castração', 'Arrecadação para esterilização dos animais do abrigo', 5000.00, '2024-06-01', '2024-07-15'),
('Campanha de Treinamento', 'Arrecadação para treinamento comportamental dos animais', 5500.00, '2024-07-01', '2024-08-15'),
('Campanha de Aniversário', 'Arrecadação de fundos para comemorar o aniversário do abrigo', 6000.00, '2024-08-01', '2024-09-15');

SELECT * FROM Inventory;

INSERT INTO Inventory (resource_name, quantity, acquisition_date, expiration_date, unit_price, total_price) VALUES
('Antipulgas', 100, '2024-06-11', '2024-06-11', 200.00, 20000.00),
('Brinquedos', 10, '2024-06-11', '2024-06-11', 30.00, 300.00),
('Camas para cães', 40, '2024-06-11', '2024-06-11', 68.00, 2720.00),
('Coleira', 40, '2024-06-11', '2024-06-11', 23.00, 920.00),
('Gaiola Transportadora', 15, '2024-06-11', '2024-06-11', 45.00, 675.00),
('Medicamento', 90, '2024-06-11', '2024-06-11', 120.00, 10800.00),
('Ração', 50, '2024-06-11', '2024-06-11', 99.00, 4950.00),
('Roupas', 20, '2024-06-11', '2024-06-11', 20.00, 400.00),
('Shampoo', 100, '2024-06-11', '2024-06-11', 50.00, 5000.00);

SELECT * FROM FinancialTransactions;

INSERT INTO FinancialTransactions (transaction_description, transaction_type, amount, transaction_date, payment_method) VALUES
('Doação de Alberto José', 'Entrada', 6380.00, '2024-01-15', 'Cartão de Crédito'),
('Doação de Aruan Felix', 'Entrada', 3435.00, '2024-01-10', 'Cartão de Débito'),
('Doação de Joana Marques', 'Entrada', 2236.00, '2024-01-05', 'Cartão de Débito'),
('Doação de João Silva', 'Entrada', 5882.00, '2024-01-22', 'Cartão de Débito'),
('Doação de Leandro da Silva', 'Entrada', 3950.00, '2024-01-18', 'Cartão de Débito'),
('Doação de Marcio Romano', 'Entrada', 6296.00, '2024-01-12', 'Cartão de Débito'),
('Doação de Mariana Lima', 'Entrada', 7667.00, '2024-01-25', 'Cartão de Débito'),
('Doação de Milena Gimenez', 'Entrada', 8080.00, '2024-01-08', 'Cartão de Débito'),
('Doação de Samira Ferreira', 'Entrada', 801.00, '2024-01-03', 'Cartão de Débito'),
('Doação de Vanessa Lopes', 'Entrada', 7332.00, '2024-01-30', 'Cartão de Crédito'),
('Doação de Alberto Ribeiro', 'Entrada', 6451.00, '2024-02-12', 'Cartão de Crédito'),
('Doação de Carlos Alemão', 'Entrada', 8007.00, '2024-02-28', 'Cartão de Crédito'),
('Doação de Creuza Nunes', 'Entrada', 9087.00, '2024-02-10', 'Cartão de Crédito'),
('Doação de Eduardo Costa', 'Entrada', 5624.00, '2024-02-05', 'Cartão de Crédito'),
('Doação de Jimmy Turner', 'Entrada', 6183.00, '2024-02-20', 'Cartão de Crédito'),
('Doação de Leonardo Fonseca', 'Entrada', 4551.00, '2024-02-15', 'Cartão de Débito'),
('Doação de Maria Antonella', 'Entrada', 1183.00, '2024-02-03', 'Cartão de Débito'),
('Doação de Mario Cunha', 'Entrada', 7720.00, '2024-02-28', 'Cartão de Débito'),
('Doação de Peter Jorge', 'Entrada', 4119.00, '2024-02-18', 'Cartão de Crédito'),
('Doação de Robson Veneza', 'Entrada', 4765.00, '2024-02-08', 'Cartão de Crédito'),
('Doação de Andrei Levi', 'Entrada', 2345.00, '2024-03-14', 'Cartão de Crédito'),
('Doação de Cristian Gutierrez', 'Entrada', 3643.00, '2024-03-10', 'Cartão de Crédito'),
('Doação de Debora Ferreira', 'Entrada', 4654.00, '2024-03-22', 'Cartão de Crédito'),
('Doação de Geraldo Dutra', 'Entrada', 9420.00, '2024-03-01', 'Cartão de Débito'),
('Doação de Leandro Martins', 'Entrada', 4219.00, '2024-03-05', 'Cartão de Débito'),
('Doação de Lorenzo Carvalho', 'Entrada', 9806.00, '2024-03-17', 'Cartão de Débito'),
('Doação de Mariano Lima', 'Entrada', 5529.00, '2024-03-24', 'Cartão de Débito'),
('Doação de Matheus Marcos', 'Entrada', 8588.00, '2024-03-30', 'Cartão de Débito'),
('Doação de Richard Porto', 'Entrada', 6255.00, '2024-03-08', 'Cartão de Crédito'),
('Doação de Tamires Ritielly', 'Entrada', 7866.00, '2024-03-19', 'Cartão de Crédito'),
('Doação de Amadeu Junio', 'Entrada', 6350.00, '2024-04-02', 'Cartão de Crédito'),
('Doação de Beatriz de Jesus', 'Entrada', 2213.00, '2024-04-01', 'Cartão de Crédito'),
('Doação de Gabriel José', 'Entrada', 5354.00, '2024-04-14', 'Cartão de Débito'),
('Doação de Israel Tulio', 'Entrada', 706.00, '2024-04-05', 'Cartão de Débito'),
('Doação de Leandra Zema', 'Entrada', 8717.00, '2024-04-22', 'Cartão de Débito'),
('Doação de Maria Julieta', 'Entrada', 6972.00, '2024-04-18', 'Cartão de Débito'),
('Doação de Mario Londres', 'Entrada', 6656.00, '2024-04-30', 'Cartão de Débito'),
('Doação de Nicolas Marques', 'Entrada', 2916.00, '2024-04-08', 'Cartão de Crédito'),
('Doação de Pedro Jorge', 'Entrada', 521.00, '2024-04-12', 'Cartão de Crédito'),
('Doação de Rogerio Nunes', 'Entrada', 1911.00, '2024-04-25', 'Cartão de Débito'),
('Doação de Vinicius Primo', 'Entrada', 9544.00, '2024-04-19', 'Cartão de Débito'),
('Doação de Carlos Vienna', 'Entrada', 7047.00, '2024-05-03', 'Cartão de Débito'),
('Doação de Christiano de Jesus', 'Entrada', 2076.00, '2024-05-11', 'Cartão de Débito'),
('Doação de Daniel Nair', 'Entrada', 5033.00, '2024-05-27', 'Cartão de Débito'),
('Doação de Guilherme Ribeiro', 'Entrada', 3594.00, '2024-05-14', 'Cartão de Crédito'),
('Doação de Heloise Alya', 'Entrada', 938.00, '2024-05-05', 'Cartão de Crédito'),
('Doação de Jade Aaira', 'Entrada', 4151.00, '2024-05-22', 'Cartão de Débito'),
('Doação de Junior Mario', 'Entrada', 676.00, '2024-05-29', 'Cartão de Débito'),
('Doação de Lorena Cristina', 'Entrada', 1333.00, '2024-05-17', 'Cartão de Débito'),
('Doação de Maria Alice', 'Entrada', 9783.00, '2024-05-10', 'Cartão de Débito'),
('Doação de Maria Cecilia', 'Entrada', 5963.00, '2024-05-28', 'Cartão de Débito'),
('Doação de Maria Liz', 'Entrada', 4432.00, '2024-05-01', 'Cartão de Crédito'),
('Doação de Patricia Marques', 'Entrada', 182.00, '2024-05-15', 'Cartão de Crédito'),
('Doação de Rafael Helio', 'Entrada', 2274.00, '2024-05-09', 'Cartão de Débito'),
('Doação de Sandra Ciro', 'Entrada', 9935.00, '2024-05-23', 'Cartão de Débito'),
('Doação de Velma Eduarda', 'Entrada', 436.00, '2024-05-20', 'Cartão de Débito');

SELECT * FROM Adoptions;

INSERT INTO Adoptions (animal_id, adopter_id, adoption_date, documentation) VALUES
(3, 3, '2023-06-20', 'Contrato de adoção assinado por Marcos Silva'),
(4, 4, '2023-07-25', 'Contrato de adoção assinado por Ana Oliveira'),
(5, 5, '2023-08-30', 'Contrato de adoção assinado por Pedro Santos'),
(6, 6, '2023-09-05', 'Contrato de adoção assinado por Laura Costa'),
(7, 7, '2023-10-10', 'Contrato de adoção assinado por Gabriel Pereira'),
(8, 8, '2023-11-15', 'Contrato de adoção assinado por Sofia Martins'),
(9, 9, '2023-12-20', 'Contrato de adoção assinado por Lucas Ferreira'),
(10, 10, '2024-01-25', 'Contrato de adoção assinado por Mariana Vieira'),
(11, 11, '2024-02-28', 'Contrato de adoção assinado por Thiago Silva'),
(12, 12, '2024-03-05', 'Contrato de adoção assinado por Julia Santos'),
(13, 13, '2024-04-10', 'Contrato de adoção assinado por Mateus Oliveira'),
(14, 14, '2024-05-15', 'Contrato de adoção assinado por Ana Clara'),
(15, 15, '2024-06-20', 'Contrato de adoção assinado por Leonardo Costa'),
(16, 16, '2024-07-25', 'Contrato de adoção assinado por Isabela Pereira'),
(17, 17, '2024-08-30', 'Contrato de adoção assinado por Guilherme Martins'),
(18, 18, '2024-09-05', 'Contrato de adoção assinado por Sophia Ferreira'),
(19, 19, '2024-10-10', 'Contrato de adoção assinado por Gabriel Oliveira'),
(20, 20, '2024-11-15', 'Contrato de adoção assinado por Amanda Vieira'),
(21, 21, '2024-12-20', 'Contrato de adoção assinado por Matheus Silva'),
(22, 22, '2025-01-25', 'Contrato de adoção assinado por Larissa Santos'),
(23, 23, '2025-02-28', 'Contrato de adoção assinado por Joãozinho Oliveira'),
(24, 24, '2025-03-05', 'Contrato de adoção assinado por Mariazinha Pereira'),
(25, 25, '2025-04-10', 'Contrato de adoção assinado por Lucaszinho Martins'),
(26, 26, '2025-05-15', 'Contrato de adoção assinado por Anazinha Ferreira'),
(27, 27, '2025-06-20', 'Contrato de adoção assinado por Pedrinho Oliveira'),
(28, 28, '2025-07-25', 'Contrato de adoção assinado por Mariazinha Vieira'),
(29, 29, '2025-08-30', 'Contrato de adoção assinado por Joãozinho Silva'),
(30, 30, '2025-09-05', 'Contrato de adoção assinado por Ana Maria Santos');

INSERT INTO Income (source, total_amount) VALUES
('ONGs', 10000.00),
('Prefeitura', 5000.00),
('Pessoa Jurídica (PJ)', 20000.00),
('Pessoa Física (PF)', 100000.00),
('Subsídio Governamental', 35000.00),
('Parcerias', 40000.00),
('Campanha Online', 60000.00);