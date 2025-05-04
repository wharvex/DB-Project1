WITH ed AS (SELECT d.department_id,
                   d.department_name,
                   COUNT(e.employee_id) AS employee_count
            FROM hr.employees e
                     JOIN hr.departments d
                          ON e.department_id = d.department_id
            GROUP BY d.department_id, d.department_name),
     ed_filtered AS (SELECT ed.department_id,
                            ed.department_name,
                            ed.employee_count
                     FROM ed
                     WHERE ed.employee_count > 1)
SELECT e2.last_name,
       j.job_title,
       edf.department_name,
       edf.employee_count departmental_employee_count
FROM hr.employees e2
         JOIN hr.jobs j ON e2.job_id = j.job_id
         JOIN ed_filtered edf
              ON e2.department_id = edf.department_id
;