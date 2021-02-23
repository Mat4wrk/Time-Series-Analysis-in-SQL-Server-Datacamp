SELECT
	-- Downsample to a weekly grain
	DATEPART(WEEK, dsv.CustomerVisitStart) AS Week,
	SUM(dsv.AmenityUseInMinutes) AS AmenityUseInMinutes,
	-- Find the customer with the largest customer ID for that week
	MAX(dsv.CustomerID) AS HighestCustomerID,
	COUNT(1) AS NumberOfAttendees
FROM dbo.DaySpaVisit dsv
WHERE
	dsv.CustomerVisitStart >= '2020-01-01'
	AND dsv.CustomerVisitStart < '2021-01-01'
GROUP BY
	-- When we use aggregation functions like SUM or COUNT,
    -- we need to GROUP BY the non-aggregated columns
	DATEPART(WEEK, dsv.CustomerVisitStart)
ORDER BY
	Week;
