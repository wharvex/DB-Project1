SELECT emp_last_name,
       d.department_name,
       m.last_name mgr_last_name,
       years_of_service
FROM (SELECT hr.employees.last_name                                  emp_last_name,
             hr.employees.department_id                              emp_dept_id,
             hr.employees.manager_id                                 emp_mgr_id,
             ROUND((SYSDATE - hr.employees.hire_date) / 365.2425) AS years_of_service
      FROM hr.employees) e
         JOIN hr.departments d ON emp_dept_id = d.department_id
         JOIN hr.employees m ON emp_mgr_id = m.employee_id
WHERE years_of_service > 20
;