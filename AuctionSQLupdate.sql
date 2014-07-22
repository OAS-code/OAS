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
	`role` enum('Admin','Staff','Customer') default 'Customer',
	`status` enum('Active','Deactive') default 'Deactive',
	fulltext key `fullname` (`fullname`,`username`),
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
drop table if exists `auction`;

create table `auction`(
	`auctionid` int not null auto_increment,
	`category_id` int not null,
	`seller_id` int not null,
	`title` varchar(100) not null,
	`description` text not null,
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
insert into `auction`(`category_id`,`seller_id`,`title`,`description`,`start_date`,`end_date`,`starting_price`,`reserve_price`,`buy_now_price`,`status`) 
values(1,1,'Camera canon','Like new',STR_TO_DATE('22/07/2014', '%d/%m/%Y'),STR_TO_DATE('23/07/2014', '%d/%m/%Y'),100,400,500,'Future');
select * from `auction`;
drop table if exists `digital`;
create table `digital`(
	`auction_id` int not null,
	`image1` text,
	`image2` text,
	`image3` text,
	`image4` text,
	`image5` text,
	`video` text,
	primary key(`auction_id`),
	foreign key(`auction_id`) references `auction`(`auctionid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `digital`(`auction_id`,`image1`,`image2`,`image3`,`image4`,`image5`,`video`) 
values(1,'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg',
'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg',
'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg',
'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg',
'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg',
'http://upload.wikimedia.org/wikipedia/commons/0/0d/Canon_EOS_5D_Mark_III.jpg');

select * from `digital`;
ALTER TABLE `user` ADD FULLTEXT(`fullname`, `username`);
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`) values('Nguyen Van Nam','nguyennam','123','09867','namnv@fpt.vn','Ha Noi');
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`,`status`) values('Pham Van Tu','phamtu','123','09867','tupvse02404@fpt.vn','Hai Duong','Active');
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`,`role`,`status`) values('Chu Nhu Duc','chuduc','123','09867','chuduc@fpt.vn','Ha Noi','Admin','Active');
insert into `user`(`fullname`,`username`,`password`,`phonenumber`,`email`,`address`) values('Nguyen Dinh Hieu','nguyenhieu','123','09867','hieund@fpt.vn','Bac Ninh');
select * from `user`;
select * from `auction` left outer join `digital` on `auction`.`auctionid` = `digital`.`auction_id`
union
select * from `auction` right outer join `digital` on `auction`.`auctionid` = `digital`.`auction_id`;
