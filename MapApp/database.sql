create table map_user(
	id varchar(32) primary key,
	username varchar(5) not null,
	password varchar(32) not null,
	gender char(1) not null,
	preference tinyInt not null default 0
);