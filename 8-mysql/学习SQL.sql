
create table Student(
	Sno char(7) primary key,
	Sname char(10) not null,
	Ssex char(2),
	Sage tinyint,
	Sdept char(20)
)engine=innodb default charset=utf8 auto_increment=1;


create table Course (
	Cno char(6) not null default '000000',
	Cname char(20) not null default '',
	Credit tinyint,
	Semester tinyint,
	primary key (Cno)
)engine=innodb default charset=utf8 auto_increment=1;

create table SC(
	Sno char(7) not null,
	Cno char(6) not null,
	Grade smallint,
	primary key (Sno, Cno),
	foreign key(Sno) references Student(Sno),
	foreign key(Cno) references Course(Cno)
)engine=innodb default charset=utf8 auto_increment=1;


create table test(
	yaha char(7) not null,
	Grade int
);



/*sql 删除表 drop table  表名*/

drop table SC;


/*修改表 
	alter table 表名
	alter column 《列名》 《新数据类型》	————修改列定义
	alter 《列名》 《数据类型》 《约束》    ————添加新列
	drop column 《列名》					————删除列
	add 【comstraint 《约束名》】 约束定义	————添加约束
	drop 【comstraint 《约束名》】			————删除约束
*/


/*为student添加”专业“列。可以为空*/

alter table Student
	add Spec char(15) null

/*将添加专业的类型改为char(20)*/
/*sqlite 不支持删除一列，但是mysql应该支持*/

alter table Student
	alter column Spec char(20)

alter table Student
	drop column Spec

数据完整性
主键			primary key
alter table 工作表
	add constraint PK_EMP
	primary key (员工编号)


列级不能重复	unique
alter table 雇员表
	add constraint UK_SID
	unique （电话号码）
	
外码约束       foreign key
alter table 雇员表
	add constraint FK_job_id
	foreign key (工作编号) references 工作表 （工作编号）
	
	
default
check



insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9512101, "李勇", '男', 19, "计算机系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9512102, "刘晨", '男', 20, "计算机系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9512103, "王敏", '女', 20, "计算机系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9521101, "张立", '男', 22, "信息系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9521102, "吴斌", '女', 21, "信息系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9521103, "张海", '男', 20, "信息系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9531101, "钱小平", '女', 18, "数学系");
insert into Student (Sno, Sname, Ssex, Sage, Sdept)
	values (9531102, "王大力", '男', 19, "数学系");



insert into Course (Cno, Cname, Credit, Semester)
	values ('c01', '计算机文化学', 3, 1);
insert into Course (Cno, Cname, Credit, Semester)
	values ('c02', 'VB', 2, 3);
insert into Course (Cno, Cname, Credit, Semester)
	values ('c03', '计算机网络', 4, 7);
insert into Course (Cno, Cname, Credit, Semester)
	values ('c04', '数据库基础', 5, 6);
insert into Course (Cno, Cname, Credit, Semester)
	values ('c05', '高等数学', 8, 2);
insert into Course (Cno, Cname, Credit, Semester)
	values ('c06', '数据结构', 3, 1);
	
	
insert into SC (Sno, Cno, Grade) 
	values (9512101, 'c01', 90);
insert into SC (Sno, Cno, Grade) 
	values (9512101, 'c02', 86);

insert into SC (Sno, Cno) 
	values (9512101, 'c06');
	
insert into SC (Sno, Cno, Grade) 
	values (9512102, 'c02', 78);
insert into SC (Sno, Cno, Grade) 
	values (9512102, 'c04', 66);
	
insert into SC (Sno, Cno, Grade) 
	values (9521102, 'c01', 82);
insert into SC (Sno, Cno, Grade) 
	values (9521102, 'c02', 75);
insert into SC (Sno, Cno, Grade) 
	values (9521102, 'c04', 92);
insert into SC (Sno, Cno, Grade) 
	values (9521102, 'c05', 50);
	
insert into SC (Sno, Cno, Grade) 
	values (9521103, 'c02', 68);
insert into SC (Sno, Cno) 
	values (9521103, 'c06');
	
insert into SC (Sno, Cno, Grade) 
	values (9531101, 'c01', 80);
insert into SC (Sno, Cno, Grade) 
	values (9531101, 'c05', 95);
	
insert into SC (Sno, Cno, Grade) 
	values (9512102, 'c05', 85);



select <目标列名序列>

			from <数据源>

					[where <检索条件表达式>]
					[group by <分组依据列>]
					[having <组提取条件>]
					[order by <排序依据列>]



/*单表查询*/
（1）查询指定的列：

例子1：
	查询全体学生的姓名，学号，所在的系，
	select Sname, Sno, Sdept from Student
	
例子2：	
	查询全部列
	select * from Student
	
例子3：
	查询全体学生的姓名和出生年月
	select Sname, 2014 - Sage as '出生年月'  from Student 

例子4：在选课表中查询，那些学生选修了课程，列出学号
	select sno from sc 
	select distinct sno from sc		//加入distinct可以去掉重复行，

（2）查询满足条件的元祖
比较		=,>,>=, <,<=,<>或者(!=) 
确定范围     between and, not between and
确定集合	 in， not in
字符匹配	 like， not like
空值         is null, is not null
多重条件     and or

a。比较大小
例子7:查询计算机系全体学生的姓名
	select sno, sname from student where Sdept = '计算机系'

例子8:查询所有20岁以下年龄的学生
	select sno, sname from student where sage < 20

例子9：查询成绩有不及格的学生的学号
select distinct sno from sc where grade < 60 

b。确定范围
例子10：查询年龄在20到30岁之间的学生（这是包含20和30的年龄）
select sno, sdept, sage from student where sage between 20 and 30


c。确定集合
列名 【not】 in （常量1， 常量2。。。 常量n）

例子12：查询信息系，数学系和计算机系的学生姓名和性别
select sname, ssex from student where sdept in ('信息系', '数学系', '计算机系')

例子13：查询不是信息系，数学系，也不是计算机系的学生的姓名和性别
select sname, ssex from student where sdept not in ('信息系', '数学系', '计算机系')
select sname, ssex from student 
	where sdept != '信息系' and sdept != '数学系' and sdept != '计算机系' 

d。字符串匹配
like
列名 【not】 like 《匹配串》
匹配串中可以包含字符常量，也可以包含如下4种通配符
_(下划线)： 匹配任意一个字符；
%（百分号）：匹配0个或多个字符；
【】：匹配【】中的任何一个字符；
【^】:不匹配【】中的任意一个字符

例子15：查找学生表中姓“张”,姓“李”和姓“刘”的学生的信息 
select *from student where sname like '[张李刘]%'
select *from student where sname like '张%' or sname like '李%' or sname like '刘%' 

例子16：查询名字第二个字有“大”或者“小”的学生
select * from Student where Sname like '_[大小]%'

例子17：姓是王的，两个字的名字。
select * from Student where Sname like '王_'

例子18：涉及到空值的查询
is not null
is null 

查询所有考试成绩的学生的学号和课程号
select sno, cno from sc where grade is not null

多重条件查询

例子22：查询计算机系年龄小于20的学生姓名
select sname from student where sdept = "计算机系" and sage < 20


（3）对于查询结果进行排序

order by <列名> 【Asc | Desc】 [.....n]
如果在order by子句中出现了很多列，按照顺序进行排列

例子24：将学生按年龄进行升序排列
select * from student order by Sage ASC

例子25：查询选修了“c02”号课程的学生的学号以及成绩，查询按照成绩降序排列
select  * from sc where cno = 'c02' order by grade desc

例子26：查询全体学生信息，查询结果按所在系的系名升序排列，同一系的学生按照降序排列
select *from student order by sdept, sage desc


(4)使用聚合函数，汇总数据。
count(*)：统计表中元祖的个数
sum(<列名>) 计算列值总和
avg(<列名>) 计算平均值
max(<列名>) 计算最大值
min(<列名>) 计算最小值

以上函数中，除了count意外，其他都是忽视null

例子27：统计学生总人数
select count(sno) as '学生总数' from student

例子28：统计了选修的课程的人数
select count(distinct Sno) as '选课学生人数' from sc

例子29：计算‘9512101’学生的选课门数和考试总成绩
select count(Sno) as '学生选课门数', sum(grade) as '总成绩' 
	from sc where sno = '9512101'

例子30：计算‘c01’课程的考试平均成绩
select avg(grade) from sc where cno = 'c01'

例子31：查询‘c01’课程的最高分和最低分
select max(grade) as 最高分, min(grade) as 最低分 from sc where cno = 'c01'

例子32：查询“9512101”学生的选课门数，以考课程的最高分，最低分和平均分。
select count(cno), max(grade), min(grade) from sc where sno = '9512101'

（1）group by 使用

例子33：统计每门课程的选课人数，列出课程号和选课人数
select cno as '课程号', count(sno) as '选课人数' from sc group by cno

例子34：统计每个学生的选课门数和平均成绩
select sno as 学号, count(cno) as 选课门数, avg(grade) as 平均成绩 from sc group by sno

例子35：统计每个系的学生人数和平均年龄
select count(sno) as 学生人数, avg(sage) as 平均年龄 from student group by sdept

（2）where子句的使用

例子36：统计每个系的女生人数
select sdept，count(sno) as 女生人数 from student where ssex = '女' group by sdept

例子37：按照多列分组，统计每个系的男生和女生人数，以及男生的最大年龄和女生的最大年龄。
select sdept,  ssex, count(*) as 人数, max(sage)  from student group by sdept, ssex order by sdept

（3）使用having子句

例子38：查询选修了3门课程以上的学生的学号和选课门数
select sno, count(*) as 选课门数 
	from sc group by sno
		having count(*) > 3 
执行过程是先group by分组，然后count统计，最后筛选出结果大于3。


例子39：查询选课门数大于等于4门课的学生的平均成绩和选课门数
select count(sno) as 选课门数, avg(grade) 
	from sc group by sno
		having count(*) >= 4 


正确的理解where， group by， having 子句的作用和执行顺序。
where 子句用来筛选from子句中指定的数据源所产生的行数据；
group by 子句来对经where子句筛选后的结果数据进行分组；
having 是分组后的结果进行筛选



多表连接查询。

1.内连接
from 表1 join 表2 on <连接条件> 表1.列名 = 表2.列名

例子40：查询每个学生及选课的详细信息
select * from student join sc on student.sno = sc.sno

这里会出现两个sno，可以去掉重复列
select student.sno, sname, ssex, sage, cno, grade from student join sc on student.sno = sc.sno

这里可以为表提供别名，格式如下：from <源表名> 【as】 <表别名>
如果你给表起了别名，那么在这段sql里面，其他地方都必须要用别名，而不能再用原来的表名了。

例子43：查询‘信息系’谁选修了‘计算机文化学’课程的学生的成绩，要求列出学生姓名课程名和成绩
select sname, cname, grade 
	from student s join sc on s.sno = sc.sno 
		join course c on c.cno = sc.cno 
			where sdept = '信息系' and cname = '计算机文化学'


例子44：查询了所有选修vb学生的情况，列出学生姓名和所在系
select sname, sdept 
	from course as c join sc on sc.cno = c.cno 
	join student s on s.sno = sc.sno
	where cname = 'VB'

	
例子45：有分组的多表连接查询，统计计算机系每门课程的选课人数，平均成绩，最高成绩和最低成绩。
select cno,  count(*) as 选课人数, avg(grade) as 平均成绩, max(grade) as 最高成绩, min(grade) as 最低成绩 
    from sc join student as s on s.sno = sc.sno 
		where sdept = '计算机系' group by cno


自连接：自连接是一种特殊的内连接，在物理上是同一张表，但是在逻辑上将其看成2张表。

例子46：查询与刘晨同一个系的学生
select s2.sname, s2.sdept 
	from student as s1 join student as s2 on s1.sdept = s2.sdept 
		where s1.sname = '刘晨' and s2.sname != '刘晨'

例子47：查询与“数据结构”学分相同的学科
select c1.cname, c1.credit 
	from course as c1 join course c2
	on c1.credit = c2.credit 			--学分相同
		where c2.cname = '数据结构'		--c2作为查询条件


外连接：
外连接只是限制一张表中的数据必须满足连接条件，而另一张表中的数据可以不满足连接条件，
from 表1 left|right 【outer】 join 表2 on <连接条件>

left 【outer】 join是左外连接，
	左外连接是表2数据必须满足连接条件，而不管表1中数据是否满足条件。
	

right【outer】 join是右外连接
	

例子49：查询学生的选课情况，包括选了课程的学生和没选课程的学生。
select  student.sno, sname, cno, grade 
	from student left outer join sc on student.sno = sc.sno

	
TOP
使用TOP限制结果集，
top n 表示查询结果的前n行，
top n persent： 前百分之n

select top 3 sname, sage, sdept
	from student order by sage desc 

子查询
（1）利用子查询进行集合的测试
where 表达式 【not】 in （子查询）

例子53：查询与“刘晨”在同一个系学习的学生
select  * from student
	where sdept = (select sdept from student where sname = '刘晨') 
		and sname != '刘晨' 


例子54：查询考试成绩大于90的学生的姓名和学号
select sname, sno from student 
	where sno in (select sno from sc where grade > 90)

例子55：查询选修了vb课程的学生的学号和姓名
select sno, sname from student 
	where sno in (select sno from sc 
					where cno = (select cno 
									from course where cname = "VB"))

									
子查询进行比较测试

例子57：查询选了‘c04’
















<?php

//要设置这句话，才可以保证输出中文不乱码
header("Content-Type: text/html; charset=utf-8");  

// 连接、选择数据库
$link  =  mysql_connect ( 'localhost' ,  'root' ,  'c6vMmwjbz6qy9CmB' )
    or die( 'Could not connect: '  .  mysql_error ());
echo  'Connected successfully' ;
mysql_select_db ( 'test' ) or die( 'Could not select database' );

// 执行 SQL 查询

$query  =  'SELECT * FROM student' ;

//要设置这句话，才可以保证输出中文不乱码
mysql_query("SET NAMES 'utf8'");  


$result  =  mysql_query ( $query ) or die( 'Query failed: '  .  mysql_error ());

// 以 HTML 打印查询结果
echo  "<table>\n" ;
while ( $line  =  mysql_fetch_array ( $result ,  MYSQL_ASSOC )) {
    echo  "\t<tr>\n" ;
    foreach ( $line  as  $col_value ) {
        echo  "\t\t<td> $col_value </td>\n" ;
    }
    echo  "\t</tr>\n" ;
}
echo  "</table>\n" ;

// 释放结果集
mysql_free_result ( $result );

// 关闭连接
mysql_close ( $link );
?> 

















