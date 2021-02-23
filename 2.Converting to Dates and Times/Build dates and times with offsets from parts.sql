SELECT
	-- Fill in the millisecond PRIOR TO chaos
	DATETIMEOFFSETFROMPARTS(2038, 01, 19, 3, 14, 07, 999, 0, 0, 3) AS LastMoment,
    -- Fill in the date and time when we will experience the Y2.038K problem
    -- Then convert to the Eastern Standard Time time zone
	DATETIMEOFFSETFROMPARTS(2038, 01, 19, 3, 14, 08, 0, 0, 0, 3) AT TIME ZONE 'Eastern Standard Time' AS TimeForChaos;
