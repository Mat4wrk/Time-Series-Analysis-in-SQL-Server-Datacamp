-- This section focuses on entrances:  CustomerVisitStart
SELECT
	dsv.CustomerID,
	dsv.CustomerVisitStart AS TimeUTC,
	1 AS EntryCount,
    -- We want to know each customer's entrance stream
    -- Get a unique, ascending row number
	ROW_NUMBER() OVER (
      -- Break this out by customer ID
      PARTITION BY dsv.CustomerID
      -- Ordered by the customer visit start date
      ORDER BY dsv.CustomerVisitStart
    ) AS StartOrdinal
FROM dbo.DaySpaVisit dsv
UNION ALL
-- This section focuses on departures:  CustomerVisitEnd
SELECT
	dsv.CustomerID,
	dsv.CustomerVisitEnd AS TimeUTC,
	-1 AS EntryCount,
	NULL AS StartOrdinal
FROM dbo.DaySpaVisit dsv
