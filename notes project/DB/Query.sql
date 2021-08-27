create database my_notes;

use my_notes;

create table notes (
	`id` int primary key auto_increment,
	`title` varchar(500) not null,
    `content` text not null,
    `is_complete` tinyint default 0,
    `folder_id` int default null,
    `created_at` datetime not null default current_timestamp(),
    `updated_at` datetime not null default current_timestamp() on update now(),
    `deleted_at` datetime default null 
);

create table folder (
	`id` int primary key auto_increment,
    `name` varchar(500) not null,
    `created_at` datetime not null default current_timestamp(),
    `updated_at` datetime not null default current_timestamp() on update now(),
    `deleted_at` datetime default null 
);

alter table notes
ADD CONSTRAINT FK_FolderId
foreign key (`folder_id`) references folder(`id`);
insert into notes (`title`,`content`)values 
('Note 1','This is my first note'),
('Note 2','This is my second note'),
('Note 3','This is my third note'),
('Note 4','This is my fourth note');

Select * from notes;
Select * from Users;
Select * from folder;
Select * from token;

insert into folder (`name`)values
('Django'),
('Python'),
('Flask');
drop table Users;

alter table notes
add user_id int not null default 3;

alter table notes
add constraint FK_notes_user
foreign key(user_id) references users(id);

Select * from notes;
delete from notes where id =  14;
delete from Users where id = 2 ;