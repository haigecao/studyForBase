## mysql 学习


    
### msyql 安装 dmg 一路next

### 快捷键 ctrl ＋ l 清屏

### 使用
    
    PATH="$PATH":/usr/local/mysql/bin
    vim /etc/path 加入目录

### 登陆

    mysql -u root -p 回车
    输入密码

### 操作,记得在mac上面，需要输入';'.分号。
    
    显示当前数据库
    show databases;     

    创建数据库
    create database hsx;

    使用数据库
    use hsx;

    删除数据库
    drop database hsx;

    创建数据库表
        创建了3张表格，分别是学生，课程，和
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

    删除表
        drop table Student;

    修改表名
        alter table 表名    

    插入数据
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

    
    操作：sql语句

    游戏规则:

            select <目标列名序列>

                        from <数据源>

                                [where <检索条件表达式>]
                                
                                    [group by <分组依据列>]
                                
                                        [having <组提取条件>]
                                
                                            [order by <排序依据列>]

    
                            








    

