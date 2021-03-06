CREATE TABLE CURRENCY(
    ISO_NAME nvarchar(3) PRIMARY KEY NOT NULL,
    FULL_NAME nvarchar(20) NOT NULL,
    ABBREVIATED nvarchar(5) NOT NULL,
);

CREATE TABLE CURRENCY_CONVERSION(
    ID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    FROM_CURRENCY nvarchar(3) NOT NULL,
    TO_CURRENCY nvarchar(3) NOT NULL,
    MULTIPLIER decimal(38, 19) NOT NULL,
    FOREIGN KEY (FROM_CURRENCY) REFERENCES CURRENCY(ISO_NAME),
    FOREIGN KEY (TO_CURRENCY) REFERENCES CURRENCY(ISO_NAME)
);

CREATE TABLE RAM_PRODUCT(
    NAME nvarchar(100) PRIMARY KEY NOT NULL,
    MANUFACTURER nvarchar(100) NOT NULL,
    TYPE nvarchar(100) NOT NULL,
    VOLUME nvarchar(10) NOT NULL,
    FREQUENCY nvarchar(10) NOT NULL,
    VOLTAGE nvarchar(10) NOT NULL,
    PHOTO varbinary(max) NOT NULL,
    COST decimal(38, 2) NOT NULL,
    NEW_COST decimal(38, 2),
    CURRENCY nvarchar(3) NOT NULL,
    DATE_ADDED datetime DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (CURRENCY) REFERENCES CURRENCY(ISO_NAME)
);

CREATE TABLE RAM_SET(
    ID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    RAM_PRODUCT_NAME nvarchar(100) NOT NULL,
    SET_SIZE int NOT NULL,
    COST_CHANGE decimal(38, 2),
    CURRENCY nvarchar(3) NOT NULL,
    COUNT int,
    FOREIGN KEY (RAM_PRODUCT_NAME) REFERENCES RAM_PRODUCT(NAME),
    FOREIGN KEY (CURRENCY) REFERENCES CURRENCY(ISO_NAME)
);

CREATE TABLE ACCOUNT(
    EMAIL nvarchar(254) PRIMARY KEY NOT NULL,
    HASH_PASSWORD nvarchar(32) NOT NULL,
    FIRST_NAME nvarchar(100) NOT NULL,
    LAST_NAME nvarchar(100) NOT NULL,
    ACCESS int NOT NULL
);