/*tarting with the TRY_CONVERT() function, fill in the function name and input parameter for each example.*/
DECLARE
	@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

SELECT
	-- Fill in the correct data type based on our input
	TRY_CONVERT(DATETIME2(3), @GoodDateINTL) AS GoodDateINTL,
	-- Fill in the correct function
	TRY_CONVERT(DATE, @GoodDateDE) AS GoodDateDE,
	TRY_CONVERT(DATE, @GoodDateUS) AS GoodDateUS,
	-- Fill in the correct input parameter for BadDate
	TRY_CONVERT(DATETIME2(3), NULL) AS BadDate;
  

/*With the prior TRY_CONVERT() solution in mind, use TRY_CAST() to see how they compare.*/
DECLARE
	@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

-- The prior solution using TRY_CONVERT
SELECT
	TRY_CONVERT(DATETIME2(3), @GoodDateINTL) AS GoodDateINTL,
	TRY_CONVERT(DATE, @GoodDateDE) AS GoodDateDE,
	TRY_CONVERT(DATE, @GoodDateUS) AS GoodDateUS,
	TRY_CONVERT(DATETIME2(3), @BadDate) AS BadDate;

SELECT
	-- Fill in the correct data type based on our input
	TRY_CAST('04/01/2019' AS DATETIME2(3)) AS GoodDateINTL,
    -- Be sure to match these data types with the
    -- TRY_CONVERT() examples above!
	TRY_CONVERT(DATETIME2(3), @GoodDateINTL) AS GoodDateINTL,
	TRY_CONVERT(DATE, @GoodDateDE) AS GoodDateDE,
	TRY_CONVERT(DATE, @GoodDateUS) AS GoodDateUS,
	TRY_CONVERT(DATETIME2(3), @BadDate) AS BadDate;
  
  
/*One of our good dates returns NULL. Use TRY_PARSE() and specify de-de for the German date and en-us for the US date.*/  
DECLARE
	@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

-- The prior solution using TRY_CAST
SELECT
	TRY_CAST(@GoodDateINTL AS DATETIME2(3)) AS GoodDateINTL,
	TRY_CAST(@GoodDateDE AS DATE) AS GoodDateDE,
	TRY_CAST(@GoodDateUS AS DATE) AS GoodDateUS,
	TRY_CAST(@BadDate AS DATETIME2(3)) AS BadDate;

SELECT
	TRY_PARSE(@GoodDateINTL AS DATETIME2(3)) AS GoodDateINTL,
    -- Fill in the correct region based on our input
    -- Be sure to match these data types with the
    -- TRY_CAST() examples above!
	TRY_PARSE(@GoodDateDE AS DATE USING 'de-de') AS GoodDateDE,
	TRY_PARSE(@GoodDateUS AS DATE USING 'en-us') AS GoodDateUS,
    -- TRY_PARSE can't fix completely invalid dates
	TRY_PARSE(@BadDate AS DATETIME2(3) USING 'sk-sk') AS BadDate;
