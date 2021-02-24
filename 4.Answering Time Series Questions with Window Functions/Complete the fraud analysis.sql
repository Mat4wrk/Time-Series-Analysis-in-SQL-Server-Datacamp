SELECT
	s.CustomerID,
	MAX(2 * s.StartOrdinal - s.StartOrEndOrdinal) AS MaxConcurrentCustomerVisits
FROM #StartStopOrder s
WHERE s.EntryCount = 1
GROUP BY s.CustomerID
-- The difference between 2 * start ordinal and the start/end
-- ordinal represents the number of concurrent visits
HAVING MAX(2 * s.StartOrdinal - s.StartOrEndOrdinal) > 2
-- Sort by the largest number of max concurrent customer visits
ORDER BY MaxConcurrentCustomerVisits;
