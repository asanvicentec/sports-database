drop database if exists sports;
create database sports;
use sports;

/*hola*/
/*ola ke ase*/

create table participant (
dni char(9) not null,
nationality varchar(30) not null,
p_name varchar(60),
last_name varchar(60),
birth_date date,
gender set("Male","Female"),
height double(3,2),
weight double(6,3),
type varchar(50),
is_active set("Yes","No"),
back_number tinyint,
primary key(dni)
);

create table team(
id_team int not null,
t_name varchar(50),
nationality varchar(40) not null,
logo blob,
primary key(id_team)
);

/*Intermediate table between participant and team*/
create table have(
dni char(9) not null,
id_team int not null,
foreign key (dni) references participant(dni) on update cascade on delete cascade,
foreign key (id_team) references team(id_team) on update cascade on delete cascade
);

create table sport(
sport_name varchar(30),
num_of_players tinyint,
primary key(sport_name)
);

/*Intermediate table between team and sport*/
create table participate(
sport_name varchar(30),
id_team int,
FOREIGN KEY (sport_name) REFERENCES sport(sport_name) on update cascade on delete cascade,
FOREIGN KEY (id_team) REFERENCES team(id_team) on update cascade on delete cascade
);

create table competition(
id_competition int not null,
c_name varchar(30),
edition tinyint,
start_date date,
end_date date,
sport_name varchar(30),
primary key(id_competition),
FOREIGN KEY (sport_name) REFERENCES sport(sport_name) on update cascade on delete cascade
);

create table game(
id_match int not null auto_increment,
duration int,
date datetime,
stadium varchar(30),
result varchar(20),
id_competition int not null,
primary key(id_match),
foreign key (id_competition) REFERENCES competition(id_competition) on update cascade on delete cascade
);

/*Intermediate table between participant and game(match)*/
create table play(
dni char(9) not null,
id_match int,
FOREIGN KEY (dni) REFERENCES participant(dni) on update cascade on delete cascade,
FOREIGN KEY (id_match) REFERENCES game(id_match) on update cascade on delete cascade
);

create table penalty (
id_penalty int auto_increment,
date_of_penalty time,
type varchar(20),
severity varchar(20),
primary key(id_penalty)
);

/*Intermediate table between participant and penalty*/
create table commit(
id_penalty int,
dni char(9) not null,
FOREIGN KEY (id_penalty) REFERENCES penalty(id_penalty) on update cascade on delete cascade,
FOREIGN KEY (dni) REFERENCES participant(dni) on update cascade on delete cascade
);

create table injury (
id_injury int not null auto_increment,
i_name varchar(40),
start_date date,
end_date date,
PRIMARY KEY(id_injury)
);

/*Intermediate table between injury and participant*/
create table suffer(
dni char(9) not null,
id_injury int,
foreign key(dni) REFERENCES participant(dni) on update cascade on delete cascade,
foreign key(id_injury) REFERENCES injury(id_injury) on update cascade on delete cascade
);

