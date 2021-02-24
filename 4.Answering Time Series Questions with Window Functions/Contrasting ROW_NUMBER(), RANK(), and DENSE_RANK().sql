SELECT
	ir.IncidentDate,
	ir.NumberOfIncidents,
    -- Fill in each window function and ordering
    -- Note that all of these are in descending order!
	ROW_NUMBER() OVER (ORDER BY ir.NumberOfIncidents DESC) AS rownum,
	RANK() OVER (ORDER BY ir.NumberOfIncidents DESC) AS rk,
	DENSE_RANK() OVER (ORDER BY ir.NumberOfIncidents DESC) AS dr
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentTypeID = 3
	AND ir.NumberOfIncidents >= 8
ORDER BY
	ir.NumberOfIncidents DESC;
