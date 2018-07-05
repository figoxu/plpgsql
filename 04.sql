CREATE TABLE salaries (
    emp_name text PRIMARY KEY,
    salary integer NOT NULL
);

CREATE TABLE salary_change_log(
    changed_by text DEFAULT CURRENT_USER,
    changed_at timestamp DEFAULT CURRENT_TIMESTAMP,
    salary_op text,
    emp_name text,
    old_salary integer,
    new_salary integer
);

-- 修订的阅读权限
REVOKE ALL ON salary_change_log FROM PUBLIC;
GRANT ALL ON salary_change_log TO managers;

-- 创建函数给触发器使用
CREATE OR REPLACE FUNCTION log_salary_change () RETURNS trigger AS $$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            INSERT INTO salary_change_log(salary_op,emp_name,new_salary)
            VALUES(TG_OP,NEW.emp_name,NEW.salary);
        ELSIF TG_OP = 'UPDATE' THEN
            INSERT INTO salary_change_log(salary_op,emp_name,old_salary,new_salary)
            VALUES(TG_OP,NEW.emp_name,OLD.salary,New.salary);
        ELSIF TG_OP = 'DELETE' THEN
            INSERT INTO salary_change_log(salary_op,emp_name,old_salary)
            VALUES(TG_OP,NEW.emp_name,OLD.salary);
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 绑定触发器
CREATE TRIGGER audit_salary_change
AFTER INSERT OR UPDATE OR DELETE ON salaries
FOR EACH ROW EXECUTE PROCEDURE log_salary_change();

-- 创建数据测试

INSERT INTO salaries values('Bob',1000);
UPDATE salaries SET salary = 1100 WHERE emp_name='Bob';

INSERT INTO salaries values('Mary',1000);
UPDATE salaries set salary = salary + 200;
select * from salaries;


