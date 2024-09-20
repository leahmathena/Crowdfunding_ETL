-- Drop tables if they exist
DROP TABLE IF EXISTS campaign, contacts, subcategory, category;

-- Create Contacts table
CREATE TABLE Contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create Category table
CREATE TABLE Category (
    category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Create Subcategory table
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY,
    subcategory_name VARCHAR(50) NOT NULL
);

-- Create Campaign table
CREATE TABLE Campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL REFERENCES Contacts(contact_id),
    company_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    goal NUMERIC(10, 2) NOT NULL,
    pledged NUMERIC(10, 2) NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(10) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(10) NOT NULL REFERENCES Category(category_id),
    subcategory_id VARCHAR(10) NOT NULL REFERENCES Subcategory(subcategory_id)
);

-- Select all records from each table
SELECT * FROM Campaign;
SELECT * FROM Category;
SELECT * FROM Subcategory;
SELECT * FROM Contacts;
