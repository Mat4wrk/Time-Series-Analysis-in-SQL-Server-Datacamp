SET LANGUAGE 'GERMAN'

SELECT
	d.DateText AS String,
	-- Convert to DATE
	CONVERT(Date, d.DateText) AS StringAsDate,
	-- Convert to DATETIME2(7)
	CONVERT(DATETIME2(7), d.DateText) AS StringAsDateTime2
FROM dbo.Dates d;
