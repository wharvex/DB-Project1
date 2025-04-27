WITH e2 AS (SELECT e.*,
                   ROW_NUMBER() OVER (ORDER BY e.HIRE_DATE) AS seqnum,
                   COUNT(*) OVER ()                         AS cnt
            FROM EMPLOYEES e)
SELECT *
FROM e2
WHERE seqnum = 1;


