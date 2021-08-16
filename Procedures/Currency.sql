CREATE OR ALTER PROCEDURE GetAllCurrencies
AS
    SELECT ISO_NAME IsoName, FULL_NAME FullName, ABBREVIATED from Currency;
GO;

CREATE OR ALTER PROCEDURE GetCurrencyByIsoName @IsoName nvarchar(3)
AS
    SELECT ISO_NAME IsoName, FULL_NAME FullName, ABBREVIATED
        FROM Currency where ISO_NAME = @IsoName;
GO;