DECLARE
	@OlympicsClosingUTC DATETIME2(0) = '2016-08-21 23:00:00';

SELECT
	-- Fill in 7 hours back and a '-07:00' offset
	TODATETIMEOFFSET(DATEADD(HOUR, -7, @OlympicsClosingUTC), '-07:00') AS PhoenixTime,
	-- Fill in 12 hours forward and a '+12:00' offset.
	TODATETIMEOFFSET(DATEADD(HOUR, 12, @OlympicsClosingUTC), '+12:00') AS TuvaluTime;
