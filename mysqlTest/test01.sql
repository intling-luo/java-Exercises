select * from emp;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

SELECT empno,ename,job,sal
from emp;

SELECT empno as 员工编号,ename as 姓名
from emp;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
WHERE empno>7800;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
WHERE ename in ('BLAKE','smith');

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
WHERE sal BETWEEN 1000 and 3000;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
WHERE hiredate BETWEEN '1981-01-01' and '1982-12-31';

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
WHERE comm is null;


/*test
*/


SELECT *
FROM emp
where ename like'%A%';

SELECT *
FROM emp
where job ='salesman' or job ='CLERK' ;


SELECT *
FROM emp
where sal<1000;

SELECT *
FROM emp
where sal BETWEEN 1000 and 3000;

SELECT *
FROM emp
where hiredate BETWEEN '1981-01-01' and '1981-12-31' ;

SELECT *
FROM emp
where comm is null;


/*test02*/
-- 1
SELECT empno,ename,job,sal,deptno
FROM emp
where deptno=10;

-- 2
SELECT empno,ename,job,sal,deptno
FROM emp
where deptno=20 and (sal BETWEEN 1000 and 2000)

-- 3
SELECT empno,ename,job,sal,deptno
FROM emp
where job!='salesman' and job!='clerk'

-- 4
SELECT empno,ename,job,sal,comm,deptno
FROM emp
where deptno=10 and comm is null;

-- 5
SELECT empno,ename,job,sal,deptno
FROM emp
where (deptno=10 or deptno=20) and sal>1000;

-- 6
SELECT empno,ename,job,mgr,sal,deptno
FROM emp
where mgr=7698;

-- 7
SELECT empno,ename,job,mgr,sal,deptno
FROM emp
where ename like '%T_';

-- 8

SELECT empno,ename,job,mgr,sal,deptno
FROM emp
where ename like '%s%' and deptno = 20;




-- 1 查询10号部门中的员工信息,按工资降序显示(编号,姓名,职位,领导编号,工资,部门编号)
SELECT empno,ename,job,mgr,sal,deptno
FROM emp
where deptno=10
ORDER BY sal DESC;

-- 2 查询30号部门中职位为'SALEsman'的员工信息,按工资升序显示
SELECT *
FROM emp
where deptno=30 and job ='salesman'
ORDER BY sal ;

-- 3 查询员工姓名中不包含'A'字符的员工信息, 按部门编号升序显示
SELECT *
FROM emp
where ename not like '%A%' 
ORDER BY deptno ;

-- 4 查询20号部门中工资不在1000-1500之间的员工信息,按工资降序显示


-- 5 查询工资小于1000的员工信息,按部门升序显示
SELECT *
FROM emp
where sal<1000
ORDER BY deptno;

-- 6 查询领导编号为7566且工资大于1000的员工信息,按部门降序显示
SELECT *
FROM emp
where mgr=7566 and sal >1000
ORDER BY deptno DESC;


SELECT 2
-- 函数
-- 查询第一个a出现的下标
SELECT ename ,instr(ename,'a')
from emp;
-- 员工姓名后三位
SELECT ename ,substr(ename,-3)
from emp;
-- 日期函数
select now(),curDate(),curTime(),day(now()),month(now()),year(now())

-- 添加新员工
insert into emp(empno,ename,job,mgr,hiredate,sal,deptno)
VALUES(1001,'老王','社长',7839,now(),5000,10);

select DATE_FORMAT(CURDATE(),'%d-%m-%y')
-- 查询1987入职的员工
SELECT empno as 编号,ename as 姓名, DATE_FORMAT(hiredate,'%Y年%m月%d日') as 入职日期
from emp
where year(hiredate)=1987

SELECT empno as 编号,ename as 姓名, DATE_FORMAT(hiredate,'%Y年%m月%d日') as 入职日期 
from emp
where year(now())-year(hiredate)>40





-- 1
SELECT count(empno) as 人数
FROM emp;
-- 2
SELECT max(sal) as 最高工资
FROM emp;
-- 3
SELECT min(sal) as 最低工资
FROM emp;
-- 4
SELECT sum(sal) as 总和工资
FROM emp;
-- 5
SELECT AVG(sal) as 平均工资
FROM emp;

SELECT deptno,count(*)
FROM emp
GROUP BY DEPTNO;


-- 1 查询公司中最高工资,最低工资
SELECT  MAX(sal) 最高,MIN(sal) 最低
FROM emp

-- 2 查询公司员工人数,平均工资,最高工资
SELECT  count(*),AVG(sal),Max(sal)
FROM emp

-- 3 统计10号部门的人数
SELECT count(*)
FROM emp
WHERE DEPTNO =10;
-- 4 查询10号部门中工资高于1000的员工人数
SELECT count(*)
FROM emp
WHERE DEPTNO =10 and sal>1000;

-- 6 查询公司中有奖金的员工人数
SELECT count(*)
FROM emp
WHERE comm is not null;

-- 7 查询30号部门中工资在1000-2000之间的人数,及平均工资
SELECT count(*),AVG(sal)
FROM emp
WHERE (sal BETWEEN 1000 and 3000) and deptno=30;

-- 8  查询每个部门中工资在1000-3000之间的员工人数,按人数降序显示
SELECT deptno , count(*)
FROM emp
WHERE sal BETWEEN 1000 and 3000
GROUP BY deptno 
ORDER BY count(*) DESC;

-- 9 查询每个部门中工资大1500以上人数,及平均工资,按人数降序显示
SELECT deptno , count(*),AVG(sal)
FROM emp
WHERE sal >1500
GROUP BY deptno 
ORDER BY count(*) DESC;

SELECT AVG(sal)
FROM emp
GROUP BY deptno ;

-- 10  查询每个部门中各职位的员工人数

SELECT job, count(*)
FROM emp
GROUP BY job;

SELECT max(sal),min(sal),
