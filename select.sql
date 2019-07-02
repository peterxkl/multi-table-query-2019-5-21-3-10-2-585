# 1.查询同时存在1课程和2课程的情况
select * from student where id in(select studentId from student_course where courseId=1) 
                            and id in (select studentId from student_course where courseId=2);
# 2.查询同时存在1课程和2课程的情况
select * from student where id in(select studentId from student_course where courseId=1) 
                            and id in (select studentId from student_course where courseId=2);
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select a.id as "学号",a.name as "学生姓名",avg(a.score) as "平均成绩" 
from (select student.id,student.name,student_course.score 
from student inner join student_course on student.id=student_course.studentId) a
group by a.id having avr(a.score>=60);

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select studentId from student_course);

# 5.查询所有有成绩的SQL
select * from student_course;
         
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student where id in(select studentId from student_course where courseId=1) 
                            and id in (select studentId from student_course where courseId=2);

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student where id in (select studentId from student_course where courseId=1 and score<60 order by score desc);

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select avg(score) from student_course group by studentId order by avg(score) desc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select student.name,student_course.score from student,student_course where student.id=student_course.studentId and student_course.courseId=2 and student_course.score<60;
