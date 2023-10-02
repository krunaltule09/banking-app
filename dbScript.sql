create database banking;
use banking;

drop table if exists `customers`;
create table `customers` (
`customer_id` int(11) not null auto_increment,
`name` varchar(100) not null,
`date_of_birth` date not null,
`city` varchar(100) not null,
`zipcode` varchar(100) not null,
`status` tinyint(1) not null,
primary key(`customer_id`)
) engine=InnoDB auto_increment=2000 default charset=latin1;

insert into `customers` values
(2000,'Steve','1978-12-15','Delhi','110075',1),
(2001,'Arian','1988-05-21','Newburgh','110075',1),
(2002,'Hadley','1988-04-30','Mumbai','110075',1),
(2003,'Ben','1988-01-04','Eaglewood','110075',0),
(2004,'Nina','1988-05-14','Manchester','110075',0),
(2005,'Osman','1988-11-08','Clarkston','110075',1);

drop table if exists `accounts`;

create table `accounts` (
`account_id` int(11) not null auto_increment,
`customer_id` int(11) not null,
`creeated_at` datetime not null default current_timestamp,
`account_type` varchar(10) not null,
`balance` int(11) not null,
`status` tinyint(1) not null,
primary key(`account_id`),
key `account_FK` (`customer_id`),
constraint `account_FK` foreign key(`customer_id`) references `customers` (`customer_id`)
) engine=InnoDB auto_increment=95000 default charset=latin1;


insert into `accounts` values
(95000,2000,'2020-02-27 10:27:22','Checking',110075,1),
(95001,2001,'2020-07-27 12:27:22','Saving',110,1),
(95002,2003,'2020-03-14 10:27:22','Checking',7572,1),
(95003,2004,'1988-01-04','Checking',7123,0),
(95004,2005,'1988-05-14','Saving',1256,0);


drop table if exists `transactions`;

create table `transactions` (
`transaction_id` int(11) not null auto_increment,
`account_id` int(11) not null,
`amount` int(11) not null,
`transaction_type` varchar(10) not null,
`transaction_date` datetime not null default current_timestamp,
primary key(`transaction_id`),
key `transaction_FK` (`account_id`),
constraint `transaction_FK` foreign key(`account_id`) references `accounts` (`account_id`)
) engine=InnoDB auto_increment=40000 default charset=latin1;





