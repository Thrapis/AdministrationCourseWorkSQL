CREATE OR ALTER PROCEDURE GetSetsByName @Name nvarchar(50)
AS
    SELECT ID, RAM_PRODUCT_NAME RamProductName, SET_SIZE SetSize,
           COST_CHANGE CostChange, CURRENCY, COUNT
    FROM RAM_SET WHERE RAM_PRODUCT_NAME = @Name;
GO;


CREATE OR ALTER PROCEDURE GetSetsByNameInCurrency @Name nvarchar(50), @InCurrencyIsoName nvarchar(3)
AS
    SELECT ID, RAM_PRODUCT_NAME "RamProductName", SET_SIZE "SetSize",
           COST_CHANGE * (SELECT ISNULL(MULTIPLIER, 1) FROM CURRENCY_CONVERSION WHERE FROM_CURRENCY = RS.CURRENCY AND TO_CURRENCY = @InCurrencyIsoName) "CostChange",
           @InCurrencyIsoName "Currency",
           COUNT
    FROM RAM_SET RS WHERE RAM_PRODUCT_NAME = @Name;
GO;