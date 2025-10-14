WITH SortedQueuePrefixWeights AS (
    SELECT 
        q.person_name, q.turn,
        SUM(q.weight) OVER (ORDER BY q.turn) AS cumulative_weight
    FROM Queue q
)
SELECT TOP (1) person_name
FROM SortedQueuePrefixWeights
WHERE cumulative_weight <= 1000
ORDER BY turn DESC;
