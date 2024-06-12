CREATE DATABASE donationsPet; -- ARQUIVO CRIAÇÃO DO BANCO DE DADOS
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
    transaction_id INT PRIMARY KEY,
    transaction_description TEXT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    payment_method VARCHAR(50),
    campaign_id INT,  -- Relaciona com Campaigns
    resource_id INT,  -- Relaciona com Inventory
    FOREIGN KEY (transaction_id) REFERENCES Donations(donation_id),
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