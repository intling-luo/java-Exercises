/*仅写SQL语句,不需要创建表:

表STUDENT（学生）：
        列:
        学号(主)	STUDENT_ID
        姓名	NAME
        年龄	AGE
        性别	SEX

表SCORE（成绩）：
    学号(外)	STUDENT_ID
    课程名	SUBJECT
    成绩	SCORE

根据上表结构,实现以下要求:

*/
-- 1)	用Sql找出姓名有重名的学生，查询字段包括：姓名及对应的人数
SELECT s.name ,count(1)
FROM student s
GROUP BY s.name
HAVING COUNT(1) > 1;


-- 2)	查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程名降序排列，查询字段包括：课程名、平均成绩。
SELECT SUBJECT , AVG(score)
FROM score
GROUP BY SUBJECT
ORDER BY AVG(score) ASC,SUBJECT DESC


-- 3)	查询所有科目成绩都在80分以上的学生信息,查询字段包括:学号,姓名
-- 方法1 子查询
SELECT s.student_id,s.name
FROM student s
WHERE s.student_id in (SELECT student_id 
FROM score
GROUP BY student_id
HAVING min(score)>=80
)
-- 方法2 内连接
SELECT s.student_id,s.name
FROM student s INNER JOIN score c on s.student_id=c.student_id 
GROUP BY s.student_id ,s.name
HAVING min(c.score)>=80

-- 4)	查询平均分高于80分的学生信息,查询字段包括:学号,姓名
SELECT s.student_id,s.name
FROM student s INNER JOIN score c on s.student_id = c.student_id
GROUP BY s.student_id , s.name
HAVING AVG(c.score)>=80

-- 5) 查询参加过补考的学生信息(学号,姓名,课程名)
SELECT s.student_id ,s.name , c.SUBJECT
FROM student s join score c on s.student_id = c.student_id
WHERE (s.student_id,c.SUBJECT) in (SELECT student_id,subject FROM score GROUP BY student_id ,SUBJECT HAVING count(*)>1)




SELECT gd.goods_id,gd.goods_name,gd.goods_price,gd.goods_num,gd.goods_type_id,gt.type_name
from goods gd left join goodstype gt on gd.goods_type_id = gt.type_id

