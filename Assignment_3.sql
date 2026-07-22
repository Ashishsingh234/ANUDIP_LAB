
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ecom               |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.05 sec)

mysql> use ecom;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_ecom  |
+-----------------+
| clients         |
| customer        |
| del_mum_clients |
| employees       |
| orders          |
| sellers         |
+-----------------+
6 rows in set (0.06 sec)

mysql> Select * from customer;
+-------------+---------+--------+---------+
| Customer_id | NAME    | CITY   | PINCODE |
+-------------+---------+--------+---------+
| C101        | Sujal   | MUMBAI |  400076 |
| C102        | MANISH  | MUMBAI |  400072 |
| C103        | AKASH   | PUNE   |  400071 |
| C104        | SANDESH | KASARA |  400079 |
+-------------+---------+--------+---------+
4 rows in set (0.01 sec)

mysql> DESC customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_id | varchar(10) | NO   | PRI | NULL    |       |
| NAME        | varchar(30) | NO   |     | NULL    |       |
| CITY        | varchar(20) | NO   |     | NULL    |       |
| PINCODE     | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> ALTER TABLE customer ADD EMAIL VARCHAR(30) NOT NULL;
Query OK, 0 rows affected (0.38 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE customer modify name VARCHAR(20) NOT NULL;
Query OK, 4 rows affected (0.25 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> Select * from customer;
+-------------+---------+--------+---------+-------+
| Customer_id | name    | CITY   | PINCODE | EMAIL |
+-------------+---------+--------+---------+-------+
| C101        | Sujal   | MUMBAI |  400076 |       |
| C102        | MANISH  | MUMBAI |  400072 |       |
| C103        | AKASH   | PUNE   |  400071 |       |
| C104        | SANDESH | KASARA |  400079 |       |
+-------------+---------+--------+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table customer rename column name to full_name;
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter table customer modify full_name int(30) not null;
ERROR 1366 (HY000): Incorrect integer value: 'Sujal' for column 'full_name' at row 1
mysql> Alter table student modify age varchar(3) not null;
ERROR 1146 (42S02): Table 'ecom.student' doesn't exist
mysql> Alter table customer modify age varchar(3) not null;
ERROR 1054 (42S22): Unknown column 'age' in 'customer'
mysql> Alter table customer modify CITY varchar(3) not null;
ERROR 1265 (01000): Data truncated for column 'CITY' at row 1
mysql> Alter table customer modify CITY varchar(50) not null;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table CUSTOMER rename to student_details;
Query OK, 0 rows affected (0.02 sec)

mysql> alter table student_details drop column email;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table student_details drop primary key;
Query OK, 4 rows affected (0.06 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> desc student_details;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_id | varchar(10) | NO   |     | NULL    |       |
| full_name   | varchar(20) | NO   |     | NULL    |       |
| CITY        | varchar(50) | NO   |     | NULL    |       |
| PINCODE     | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> alter table student_details add primary key(Customer_id);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student_details;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_id | varchar(10) | NO   | PRI | NULL    |       |
| full_name   | varchar(20) | NO   |     | NULL    |       |
| CITY        | varchar(50) | NO   |     | NULL    |       |
| PINCODE     | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table department(dept_id varchar(30) Primary key, dept_name varchar(30) not null);
Query OK, 0 rows affected (0.02 sec)

mysql> create table employee(emp_id varchar(30) primary key, emp_name varchar(30) not null, dept_id varchar(30), foreign key(dept_id) references department(dept_id));
Query OK, 0 rows affected (0.05 sec)

mysql> insert into department values('D1', 'Manager'), ('D2', 'TECH');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
| D1      | Manager   |
| D2      | TECH      |
+---------+-----------+
2 rows in set (0.00 sec)

mysql> insert into employee values('E1', 'Priyanka', 'D2'),('E2', 'Bhavika', 'D2'), ('E3', 'Milan', 'D1');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+----------+---------+
| emp_id | emp_name | dept_id |
+--------+----------+---------+
| E1     | Priyanka | D2      |
| E2     | Bhavika  | D2      |
| E3     | Milan    | D1      |
+--------+----------+---------+
3 rows in set (0.00 sec)

mysql> select * from student_details;
+-------------+-----------+--------+---------+
| Customer_id | full_name | CITY   | PINCODE |
+-------------+-----------+--------+---------+
| C101        | Sujal     | MUMBAI |  400076 |
| C102        | MANISH    | MUMBAI |  400072 |
| C103        | AKASH     | PUNE   |  400071 |
| C104        | SANDESH   | KASARA |  400079 |
+-------------+-----------+--------+---------+
4 rows in set (0.01 sec)

mysql> select * from student_details limit 2;
+-------------+-----------+--------+---------+
| Customer_id | full_name | CITY   | PINCODE |
+-------------+-----------+--------+---------+
| C101        | Sujal     | MUMBAI |  400076 |
| C102        | MANISH    | MUMBAI |  400072 |
+-------------+-----------+--------+---------+
2 rows in set (0.00 sec)

mysql>