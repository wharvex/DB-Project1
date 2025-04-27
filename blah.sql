WITH e2 AS (SELECT e.*,
                   ROW_NUMBER() OVER (ORDER BY e.hire_date) AS seqnum,
                   COUNT(*) OVER ()                         AS cnt
            FROM employees e),
     e3 AS (SELECT *
            FROM e2
            WHERE seqnum = 1),
     e4 AS (SELECT *
            FROM e2
            WHERE seqnum = cnt)
SELECT e3.hire_date                                       first_hire_date,
       e4.hire_date                                       last_hire_date,
       ROUND((e4.hire_date - e3.hire_date) / 365.2425) AS years_difference
FROM e3,
     e4;
