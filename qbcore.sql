
-- Use underscore_names instead of CamelCase
-- Table names should be plural
-- Spell out id fields (item_id instead of id)
-- Don't use ambiguous column names
-- When possible, name foreign key columns the same as the columns they refer to


CREATE TABLE weapons (
    weapon_name VARCHAR(255) PRIMARY KEY,
    weapon_label VARCHAR(255),
    weapon_type VARCHAR(255),
    weapon_ammo VARCHAR(255),
    weapon_damage_reason VARCHAR(255)
);

CREATE TABLE weapon_attachments (
    weapon_attachment_id SERIAL PRIMARY KEY,
    weapon_attachment_name VARCHAR(255),
    weapon_attachment_label VARCHAR(255),
    weapon_attachment_weight INT,
    weapon_attachment_type VARCHAR(255),
    weapon_attachment_image VARCHAR(255),
    weapon_attachment_unique BOOLEAN,
    weapon_attachment_useable BOOLEAN,
    weapon_attachment_shouldClose BOOLEAN,
    weapon_attachment_description VARCHAR(255),
    weapon_name VARCHAR(255),
    FOREIGN KEY (weapon_name) REFERENCES weapons(weapon_name)
);

CREATE TABLE weapon_tints (
    tint_id SERIAL PRIMARY KEY,
    tint_name VARCHAR(255),
    tint_label VARCHAR(255),
    tint_weight INT,
    tint_type VARCHAR(255),
    tint_image VARCHAR(255),
    tint_unique BOOLEAN,
    tint_useable BOOLEAN,
    tint_shouldClose BOOLEAN,
    tint_description VARCHAR(255)
);

CREATE TABLE vehicleshops (
    vehicleshop_name VARCHAR(255) PRIMARY KEY,
    vehicleshop_managed BOOLEAN
);

CREATE TABLE vehicles (
    vehicle_model VARCHAR(255) PRIMARY KEY,
    vehicle_name VARCHAR(255),
    vehicle_brand VARCHAR(255),
    vehicle_price INT,
    vehicle_category VARCHAR(255),
    vehicle_type VARCHAR(255),
    shop_name VARCHAR(255),
    FOREIGN KEY (vehicles_name) REFERENCES vehicleshops(vehicleshop_name)
);

CREATE TABLE items (
    item_name VARCHAR(255) PRIMARY KEY,
    item_label VARCHAR(255),
    item_weight INT,
    item_type VARCHAR(255),
    item_image VARCHAR(255),
    item_unique BOOLEAN,
    item_useable BOOLEAN,
    item_shouldClose BOOLEAN,
    item_description VARCHAR(255),
    item_min_amount FLOAT,
    item_max_amount FLOAT
);

CREATE TABLE organizations (
    organization_name VARCHAR(255) PRIMARY KEY,
    organization_label VARCHAR(255),
    organization_type VARCHAR(255)
);

CREATE TABLE organizations_grades (
    organization_id INT AUTO_INCREMENT PRIMARY KEY,
    organization_name VARCHAR(255),
    organization_grade INT,
    organization_grade_name VARCHAR(255),
    organization_isboss BOOLEAN,
    organization_payment FLOAT,
    FOREIGN KEY (organization_name) REFERENCES organizations(organization_name)
);