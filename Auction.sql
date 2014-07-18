create database if not exists `Auction` /*! default character set utf8 */;
use `Auction` ;

drop table if exists `user`;

create table `user`(
	`id` int not null auto_increment,
	`fullname` varchar(40) not null,
	`username` varchar(20) not null,
	`password` varchar(20) not null,
	`phonenumber` varchar(12) not null,
	`email` varchar(45) not null,
	`address` varchar(45) not null,
	`status` bit default 1,
	primary key(`id`),
	unique(`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `category`;

create table `category`(
	`categoryid` int not null auto_increment,
	`name` varchar(20) not null unique,
	primary key(`categoryid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `category`(`name`) values('Mobile');
insert into `category`(`name`) values('Laptop');
insert into `category`(`name`) values('Computer');
insert into `category`(`name`) values('Camera');
insert into `category`(`name`) values('Headphone');
select * from `category`;
drop table if exists `auctions`;

create table `auction`(
	`auctionid` int not null auto_increment,
	`category_id` int not null,
	`seller_id` int not null,
	`title` varchar(100) not null,
	`description` text not null,
	`image` text not null,
	`start_date` timestamp not null,
	`end_date` timestamp not null,
	`starting_price` double not null,
	`reserve_price` double not null,
	`buy_now_price` double not null,
	`status` varchar(20) not null,
	primary key(`auctionid`),
	foreign key(`category_id`) references `category`(`categoryid`),
	foreign key(`seller_id`) references `user`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`,`status`) values('Pham Van Tu','phamtu','123','09867','tupvse02404@fpt.vn','Hai Duong',0);
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`,`status`) values('Nguyen Van Nam','nguyennam','123','09867','namnv@fpt.vn','Ha Noi',0);
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`,`status`) values('Nguyen Dinh Hieu','nguyenhieu','123','09867','hieund@fpt.vn','Bac Ninh',0);

select * from `user`