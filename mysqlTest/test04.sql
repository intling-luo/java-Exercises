-- 1 查询与员工'smith' 相同部门的员工信息
SELECT *
FROM emp 
WHERE DEPTNO=(SELECT DEPTNO FROM emp WHERE ENAME = 'smith')
-- 2 查询与员工'james' 同职位的员工信息
SELECT *
FROM emp
WHERE job = (SELECT job FROM emp WHERE ENAME = 'james')

-- 3 查询比员工'miller'入职晚的员工信息
SELECT *
FROM emp
WHERE HIREDATE > (SELECT HIREDATE FROM emp WHERE ENAME='miller')

-- 4 查询10号部门中最高工资的员工信息
SELECT *
FROM emp 
WHERE sal=(SELECT max(sal) FROM emp WHERE DEPTNO =10 ) and DEPTNO=10; 

-- 5 查询30号部门中最低工资的员工信息
SELECT *
FROM emp 
WHERE sal=(SELECT min(sal) FROM emp WHERE DEPTNO =30) and DEPTNO =30;

-- 6 查询与'scott'同一个领导的员工信息


-- 1 查询比任意部门平均工资高的员工信息
SELECT *
FROM emp
WHERE sal > any(SELECT AVG(sal) FROM emp GROUP BY DEPTNO)
-- 2 查询与20号部门员工同职位的其他部门的员工信息
SELECT *
FROM emp
WHERE job in (SELECT DISTINCT JOB FROM emp WHERE DEPTNO=20) and DEPTNO !=20


-- 3 查询比10号部门所员工资都高员工信息
SELECT *
FROM emp
WHERE SAL > all(SELECT DISTINCT SAL FROM emp WHERE DEPTNO=10)


-- 4 查询比每个部门平均工资都高的员工信息
SELECT *
FROM emp
WHERE SAL > all(SELECT AVG(sal) FROM emp GROUP BY DEPTNO)

-- 5 查询所有领导的信息
SELECT *
FROM emp
WHERE EMPNO in (SELECT DISTINCT d.EMPNO FROM emp e INNER JOIN emp d on d.EMPNO=e.MGR)

-- 6 查询平均工资最高的部门信息(部门编号,部门名称)
SELECT d.DEPTNO , d.DNAME
FROM emp e INNER JOIN dept d on e.DEPTNO = d.DEPTNO
GROUP BY e.DEPTNO 
HAVING AVG(sal)=(SELECT MAX(avg_sal) FROM (SELECT AVG(sal) as avg_sal FROM emp GROUP BY DEPTNO) as avgtable)


SELECT *
FROM emp
WHERE (DEPTNO , SAL ) in (SELECT DEPTNO,min(SAL) FROM emp GROUP BY DEPTNO)


SELECT *
FROM emp
WHERE (JOB , SAL ) in (SELECT JOB,max(SAL) FROM emp GROUP BY JOB)


SELECT *
FROM emp
WHERE (JOB , SAL ) in (SELECT JOB,min(SAL) FROM emp GROUP BY JOB)


SELECT *
FROM emp
WHERE (DEPTNO,HIREDATE)  in (SELECT DEPTNO,HIREDATE FROM emp GROUP BY HIREDATE,DEPTNO HAVING COUNT(*)>1) 


SELECT *
FROM emp
WHERE HIREDATE  in (SELECT HIREDATE FROM emp GROUP BY HIREDATE HAVING COUNT(*)>1) 


SELECT *
FROM emp e, (SELECT DEPTNO,AVG(sal) sal FROM emp GROUP BY DEPTNO) d
WHERE e.sal >d.sal and e.DEPTNO = d.DEPTNO

SELECT *
FROM emp e
WHERE sal >(SELECT avg(sal) FROM emp e2 WHERE e2.DEPTNO = e.DEPTNO)

SELECT *
FROM dept d 
WHERE d.DEPTNO not in (SELECT DEPTNO FROM emp e )

SELECT *
FROM emp m
WHERE empno = (SELECT DISTINCT mgr FROM emp e where e.mgr = m.empno)


SELECT *
FROM emp m
WHERE EMPNO not in (SELECT DISTINCT mgr FROM emp e WHERE e.mgr = m.EMPNO)

SELECT *
FROM emp m
where EXISTS (SELECT 1 FROM emp e WHERE e.mgr=m.EMPNO)

SELECT *
FROM emp m
where not EXISTS (SELECT 1 FROM emp e WHERE e.mgr=m.EMPNO)

SELECT *
FROM dept d
WHERE not EXISTS (SELECT 1 FROM emp e WHERE e.DEPTNO = d.DEPTNO)

SELECT *
FROM salgrade s
WHERE not EXISTS (SELECT 1 FROM emp e WHERE e.sal BETWEEN s.LOSAL and s.HISAL )