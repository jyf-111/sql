create table teacher(
    Tno char(3) not null primary key,
    Tname varchar(8),
    tsex char(2) check (tsex = '男' or tsex= '女'),
    Tbirthday Date,
    Tdept char(16)
);

create table Teaching(
    Cno char(5) not null ,
    Tno char(3) not null ,
    Cterm Tinyint(1) check (Cterm between 1 and 8),
    FOREIGN KEY (Cno) references course (cno),
    FOREIGN KEY (Tno) references teacher (tno)
);

insert into Teacher value ('101','李新','男','1977-01-12','CS');
insert into Teacher value ('102','钱军','男','1978-06-04','CS');
insert into Teacher value ('201','王小华','女','1979-12-23','IS');
insert into Teacher value ('202','张小青','男','1978-08-25','IS');

insert into Teaching value ('C01','101',2);
insert into Teaching value ('C02','102',1);
insert into Teaching value ('C04','201',3);
insert into Teaching value ('C04','202',4);

select sno,sname from student where ssex='女' and datediff(CURDATE(),sbirthday)/365>=20;

select Tname,Tdept from teacher;

select * from sc where degree=77 or degree=88 or degree=99;

select AVG(degree) from sc where cno='C01';

select sno from sc where degree is not null;

select * from student where sname like '刘%';

select sdept,COUNT(sdept) from student group by sdept;

select cno,COUNT(cno) as 人数 from sc group by cno;

select cno,COUNT(cno) as 人数 ,MAX(degree) from sc group by cno;

select sno,COUNT(cno) as 门数,SUM(degree) as 总成绩 from sc group by sno order by COUNT(cno) desc;