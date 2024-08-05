SELECT e.ENAME,e.JOB,e.MGR,e.HIREDATE,e.SAL,e.COMM,e.DEPTNO,d.DEPTNO,d.DNAME
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
ORDER BY e.DEPTNO;

-- 1 查询工资低于1000的员工信息(编号,姓名,职位,工资,部门名称)
SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,d.DNAME
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.sal <1000
ORDER BY e.DEPTNO;


-- 2 查询职位为'salesman' 和'clerk'的员工信息(编号,姓名,职位,工资,部门名称)
SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,d.DNAME
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.job='salesman' or e.job='clerk'
ORDER BY e.DEPTNO;

-- 3 查询每个部门的平均工资 (部门编号,部门名称,平均工资)
SELECT e.DEPTNO,d.DNAME,AVG(e.sal)
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
GROUP BY e.DEPTNO
ORDER BY e.DEPTNO;


-- 4 查询10号部门中,工资在1000~2000之间的员工人数(部门编号,部门名称,员工人数)
SELECT e.DEPTNO,d.DNAME,COUNT(*)
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.DEPTNO=10 and e.sal BETWEEN 1000 and 2000
GROUP BY e.EMPNO;


-- 5 查询20号部门中姓名中包含's'的员工信息(编号,姓名,职位,工资,部门名称)
SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,d.DNAME
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.DEPTNO=20 and e.ENAME like '%s%'

-- 6 查询员工姓名中不包含'a'的员工信息(编号,姓名,职位,工资,部门名称)
SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,d.DNAME
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.ENAME not like '%a%'


-- 7 查询30号部门中工资低于2000 的员工信息
SELECT *
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.DEPTNO=30 and e.SAL<2000

-- 8 查询每个部门中工资低于1500的员工人数(部门编号,部门名称,员工人数),并按人数升序显示
SELECT e.DEPTNO,d.DNAME, COUNT(1)
from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.sal<1500
GROUP BY e.DEPTNO
ORDER BY count(1)


SELECT e.DEPTNO ,e.ENAME,m.ENAME as MNAME
FROM emp e INNER JOIN emp m on e.mgr = m.EMPNO


 -- 1 查询10号部门员工的信息(编号,姓名,职位,工资,工资等级,部门名称,领导姓名)
 SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,s.GRADE,d.DNAME,m.ENAME
 FROM emp e INNER JOIN emp m on e.MGR = m.EMPNO INNER JOIN salgrade s on e.SAL <s.HISAL and e.sal>s.LOSAL INNER JOIN dept d on e.DEPTNO=d.DEPTNO
 where e.DEPTNO=10;
 
-- 2 查询工资在1000-2000之间的员工信息 (编号,姓名,职位,工资,工资等级,部门名称,领导姓名)
 SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,s.GRADE,d.DNAME,m.ENAME
 FROM emp e INNER JOIN emp m on e.MGR = m.EMPNO INNER JOIN salgrade s on e.SAL <s.HISAL and e.sal>s.LOSAL INNER JOIN dept d on e.DEPTNO=d.DEPTNO
 where e.SAL BETWEEN 1000 and 2000;

-- 3 查询没有奖金的员工信息 (编号,姓名,职位,工资,工资等级,部门名称,领导姓名)
 SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,s.GRADE,d.DNAME,m.ENAME
 FROM emp e INNER JOIN emp m on e.MGR = m.EMPNO INNER JOIN salgrade s on e.SAL <s.HISAL and e.sal>s.LOSAL INNER JOIN dept d on e.DEPTNO=d.DEPTNO
 where e.COMM is NULL or e.COMM=0;

-- 4 查询比领导工资高的员工信息( 员工编号,姓名,职位,工资,工资等级,部门名称,领导姓名,领导工资)
 SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,s.GRADE,d.DNAME,m.ENAME,m.SAL
 FROM emp e INNER JOIN emp m on e.MGR = m.EMPNO INNER JOIN salgrade s on e.SAL <s.HISAL and e.sal>s.LOSAL INNER JOIN dept d on e.DEPTNO=d.DEPTNO
where e.SAL>m.SAL
 

-- 5 查询比领导入职早的员工信息( 员工编号,姓名,职位,工资,工资等级,部门名称,入职日期,领导姓名,领导入职日期)
 SELECT e.EMPNO,e.ENAME,e.JOB,e.SAL,s.GRADE,d.DNAME,e.HIREDATE, m.ENAME,m.HIREDATE MHIREDATE
 FROM emp e INNER JOIN emp m on e.MGR = m.EMPNO INNER JOIN salgrade s on e.SAL <s.HISAL and e.sal>s.LOSAL INNER JOIN dept d on e.DEPTNO=d.DEPTNO
 where e.HIREDATE< m.HIREDATE
 
 
 
 
 
 
 