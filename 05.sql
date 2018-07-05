
--删除旧的触发器
DROP TRIGGER audit_salary_change ON salaries;

--增加查看方法
CREATE OR REPLACE FUNCTION get_salary(text)
RETURNS integer
AS $$
    --如果你查看其他人的薪资，这个操作就会被日志记录下来
    INSERT INTO salary_change_log(salary_op,emp_name,new_salary)
    SELECT 'SELECT',emp_name,salary
      FROM salaries
      WHERE upper(emp_name)=upper($1)
      AND upper(emp_name) != upper(CURRENT_USER);--不记录查看自己薪资的操作
    --返回被请求的薪资
    SELECT salary FROM salaries WHERE upper(emp_name) = upper($1);
$$ LANGUAGE SQL SECURITY DEFINER;



CREATE OR REPLACE FUNCTION set_salary(i_emp_name text, i_salary int)
RETURNS TEXT AS $$
DECLARE
    old_salary integer;
BEGIN
    SELECT salary INTO old_salary  FROM salaries WHERE upper(emp_name) = upper(i_emp_name);
    IF NOT FOUND THEN
        INSERT INTO salaries VALUES(i_emp_name, i_salary);
        INSERT INTO salary_change_log(salary_op,emp_name,new_salary)VALUES('INSERT',i_emp_name,i_salary);
        RETURN 'INSERTED USER' || i_emp_name;
    ELSIF i_salary > 0 THEN
        UPDATE salaries SET salary = i_salary WHERE upper(emp_name) = upper(i_emp_name);
        INSERT INTO salary_change_log(salary_op,emp_name,old_salary,new_salary)VALUES('UPDATE',i_emp_name,old_salary,i_salary);
        RETURN 'UPDATED USER'|| i_emp_name;
    ELSE -- salary set to 0
        DELETE FROM salaries WHERE upper(emp_name) = upper(i_emp_name);
        INSERT INTO salary_change_log(salary_op,emp_name,old_salary)VALUES('DELETE',i_emp_name,old_salary);
        RETURN 'DELETE USER' || i_emp_name;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


SELECT set_salary('Figo',50)