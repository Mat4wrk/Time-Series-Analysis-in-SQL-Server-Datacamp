-- Try out how fast the TRY_CAST() function is
-- by try-casting each DateText value to DATE
DECLARE @StartTimeCast DATETIME2(7) = SYSUTCDATETIME();
SELECT TRY_CAST(DateText AS DATE) AS TestDate FROM #DateText;
DECLARE @EndTimeCast DATETIME2(7) = SYSUTCDATETIME();

-- Determine how much time the conversion took by
-- calculating the date difference from @StartTimeCast to @EndTimeCast
SELECT
    DATEDIFF(MILLISECOND, @StartTimeCast, @EndTimeCast) AS ExecutionTimeCast;
    
    
-- Try out how fast the TRY_CONVERT() function is
-- by try-converting each DateText value to DATE
DECLARE @StartTimeConvert DATETIME2(7) = SYSUTCDATETIME();
SELECT TRY_CONVERT(Date, DateText) AS TestDate FROM #DateText;
DECLARE @EndTimeConvert DATETIME2(7) = SYSUTCDATETIME();

-- Determine how much time the conversion took by
-- calculating the difference from start time to end time
SELECT
    DATEDIFF(MILLISECOND, @StartTimeConvert, @EndTimeConvert) AS ExecutionTimeConvert;
    
    
 -- Try out how fast the TRY_PARSE() function is
-- by try-parsing each DateText value to DATE
DECLARE @StartTimeParse DATETIME2(7) = SYSUTCDATETIME();
SELECT TRY_PARSE(DateText AS DATE) AS TestDate FROM #DateText;
DECLARE @EndTimeParse DATETIME2(7) = SYSUTCDATETIME();

-- Determine how much time the conversion took by
-- calculating the difference from start time to end time
SELECT
    DATEDIFF(MILLISECOND, @StartTimeParse, @EndTimeParse) AS ExecutionTimeParse;
