-- Drop tables if they exist
DROP TABLE IF EXISTS Campaign, Contacts, Subcategory, Category CASCADE;

-- Create Contacts table
CREATE TABLE Contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
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
    contact_id INT REFERENCES Contacts(contact_id) ON DELETE CASCADE,
    company_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    goal NUMERIC(10, 2) NOT NULL,
    pledged NUMERIC(10, 2) NOT NULL,
    outcome VARCHAR(50) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launch_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    category_id VARCHAR(10) REFERENCES Category(category_id) ON DELETE CASCADE,
    subcategory_id VARCHAR(10) REFERENCES Subcategory(subcategory_id) ON DELETE CASCADE
);
