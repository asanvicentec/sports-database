drop database if exists sports;
create database sports;
use sports;


#Relationship: team, participant_have_team, participant_play_game.
#The type of table is InnoDB, it has a lot of data.
create table participant (
	dni varchar(50) not null, /* different nations */
	nationality varchar(30) not null,
	name varchar(200) not null,
	last_name1 varchar(200) not null,
	last_name2 varchar(200),
	age tinyint not null,
	birth_date date not null,
	gender set("Male","Female") not null,
	height smallint,
	weight double(6,3),
	type set("Coach","Player","Referee") not null,
	is_active set("Yes","No") not null,
	back_number tinyint,
	primary key(dni)
);


#Relationship: have, participant_have_team, team_participate_sport.
#The type of table is InnoDB, it has a lot of data.
create table team (
id_team int not null auto_increment,
name varchar(50),
country varchar(150) not null,
logo blob(65000),
primary key(id_team)
);


/* Intermediate table between participant and team */
create table participant_have_team (
dni varchar(50) not null,
id_team int not null,
foreign key (dni) references participant(dni) on update cascade on delete cascade,
foreign key (id_team) references team(id_team) on update cascade on delete cascade
);


create table sport (
id_sport int not null auto_increment,
name varchar(70) not null,
category_name varchar(100) not null,
primary key(id_sport)
);


/* Intermediate table between team and sport */
create table team_participate_sport (
id_sport int,
id_team int,
FOREIGN KEY (id_sport) REFERENCES sport(id_sport) on update cascade on delete cascade,
FOREIGN KEY (id_team) REFERENCES team(id_team) on update cascade on delete cascade
);


create table competition (
id_competition int not null auto_increment,
name varchar(40),
start_date date,
end_date date,
id_sport int,
primary key(id_competition),
FOREIGN KEY (id_sport) REFERENCES sport(id_sport) on update cascade on delete cascade
);


create table game (
id_game int not null auto_increment,
duration int,
date datetime,
location varchar(200),
result blob(65000),
num_players int,
id_competition int not null,
primary key(id_game),
foreign key (id_competition) REFERENCES competition(id_competition) on update cascade on delete cascade
);


/* Intermediate table between participant and game(match) */
create table participant_play_game (
dni char(9) not null,
id_game int,
FOREIGN KEY (dni) REFERENCES participant(dni) on update cascade on delete cascade,
FOREIGN KEY (id_game) REFERENCES game(id_game) on update cascade on delete cascade
);


create table penalty (
id_penalty int auto_increment not null,
date_of_penalty datetime not null,
name varchar(60) not null,
description text(1000) not null,
primary key(id_penalty)
);


create table injury (
id_injury int not null auto_increment,
name varchar(40) not null,
start_date date not null,
end_date date not null,
dni varchar(50) not null,
id_game int not null,
PRIMARY KEY(id_injury),
FOREIGN KEY (dni) REFERENCES participant(dni) on update cascade on delete cascade,
FOREIGN KEY (id_game) REFERENCES game(id_game) on update cascade on delete cascade
);


/* ------------------------------------------------------------------ INSERTS ------------------------------------------------------------------ */


/* participant */
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
VALUES (1,'Jose', 'Gutiérrez', 'Fernandez', 25, 'Male','99999999A','Spain',165,70,'Player','Yes', '1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (3,'Maria', 'Diaz', 'Terrassa', 27, 'Female','99999999B','Spain',175,80,'Coach','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (4,'Eva', 'Espases', 'Cuart', 24, 'Female','99999999C','Spain',160,60,'Referee','No','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (5,'Roberto', 'Marti', 'Timoner', 25, 'Male','99999999D','Italy',183,93,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (2,'Ivan', 'Paredes', 'Berber', 25, 'Male','99999978C','Spain',167,70,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (6,'Marcos', 'Febrer', 'Rebasa', 26, 'Male','99999999T','Austria',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (7,'Carlos', 'Sainz', 'Lorente', 27, 'Male','99999999J','Inglatera',165,70,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (8,'Sonia', 'Florit', 'Cabellos', 24, 'Female','99999999X','Nigeria',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (9,'Jorge', 'Frau', 'Terrasa', 25, 'Male','99999999L','Mexico',160,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (10,'Ana', 'Florit', 'Ledesma', 26, 'Female','99999990F','Austria',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (11,'David', 'Ruiz', 'Artellano', 27, 'Male','99999991F','Russia',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (12,'Marta', 'Pascual', 'Gutiérrez', 24, 'Female','99999992F','Siria',199,90,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (13,'Laura', 'Febrer', 'Rodriguez', 25, 'Female','99999993F','Austria',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (14,'Susana', 'Rebassa', 'Álvarez', 26, 'Female','99999994F','Spain',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (15,'Alex', 'Rodrígez', 'Gomez', 27, 'Male','99999995F','Russia',183,93,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (16,'David', 'Sánchez', 'Rios', 24, 'Male','99999996F','France',149,50,'Player','No','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (17,'Cristina', 'Martinez', 'Ramirez', 25, 'Female','99999997F','Austria',159,60,'Player','Yes','1999-11-17');
INSERT INTO participant(back_number,name,last_name1,last_name2,age,gender,dni,nationality,height,weight,type,is_active, birth_date)
 VALUES (18,'Miquel', 'Vidal', 'Timoner', 26, 'Male','99999998F','Austria',159,60,'Player','Yes','1999-11-17');


/* Team */
INSERT INTO team(id_team,name,country) VALUES(1, 'No team', 'No Nationality');
INSERT INTO team(name,country) VALUES('Betis CF', 'Spain');
INSERT INTO team(name,country) VALUES('New York Knicks', 'United States');
INSERT INTO team(name,country) VALUES('RCD Mallorca', 'Spain');
INSERT INTO team(name,country) VALUES('Real Sociedad', 'Spain');
INSERT INTO team(name,country) VALUES('Yamaha', 'Japan');
INSERT INTO team(name,country) VALUES('Real Madrid', 'Spain');
INSERT INTO team(name,country) VALUES('Barcelona FC', 'Spain');
INSERT INTO team(name,country) VALUES('Iberostar Tenerife', 'Spain');
INSERT INTO team(name,country) VALUES('Movistar Estudiantes', 'Spain');
INSERT INTO team(name,country) VALUES('Ferrari', 'Italy');
INSERT INTO team(name,country) VALUES('España', 'Spain');
INSERT INTO team(name,country) VALUES('Netherlands', 'Netherlands');


/* Sport */
INSERT INTO sport(name, category_name) VALUES('Futbol', 'Primera');
INSERT INTO sport(name, category_name) VALUES('Tennis', 'Individual');
INSERT INTO sport(name, category_name) VALUES('Tennis', 'Dobles');
INSERT INTO sport(name, category_name) VALUES('Fórmula', 'Primera');
INSERT INTO sport(name, category_name) VALUES('Baloncesto', 'Primera');
INSERT INTO sport(name, category_name) VALUES('Golf', 'Primera');
INSERT INTO sport(name, category_name) VALUES('Ciclisme', 'Primera');
INSERT INTO sport(name, category_name) VALUES('Atletisme', '100m lisos');


/* Competition */
INSERT INTO competition (name,start_date,end_date,id_sport) VALUES ('Campionat nacional','2016-06-19','2016-06-21',1);
INSERT INTO competition (name,start_date,end_date,id_sport) VALUES ('Campionat Internacional','2016-06-19','2016-06-21',1);
INSERT INTO competition (name,start_date,end_date,id_sport) VALUES ('Eurocopa','2016-06-19','2016-06-21',1);
INSERT INTO competition (name,start_date,end_date,id_sport) VALUES ('Mundial','2016-06-19','2016-06-21',1);


/* Participant plays on a team */
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999A', 2);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999B', 3);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999C', 4);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999D', 5);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999978C', 6);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999T', 7);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999J', 2);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999X', 8);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999999L', 6);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999990F', 4);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999991F', 9);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999992F', 1);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999993F', 1);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999994F', 1);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999995F', 6);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999996F', 4);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999997F', 7);
INSERT INTO participant_have_team (dni, id_team) VALUES ('99999998F', 10);


/* Games */
INSERT INTO game (duration, date, location, num_players, id_competition) VALUES (12600, '2016-06-23', 'London', 2, 2);
INSERT INTO game (duration, date, location, num_players, id_competition) VALUES (12355, '2018-09-12', 'Spain', 2, 2);


/* Participant plays a game */
INSERT INTO participant_play_game (dni, id_game) VALUES ('99999999A', 1);
INSERT INTO participant_play_game (dni, id_game) VALUES ('99999999B', 1);
INSERT INTO participant_play_game (dni, id_game) VALUES ('99999999C', 2);
INSERT INTO participant_play_game (dni, id_game) VALUES ('99999999D', 2);


# ------------ show all tables ------------
/*
select * from competition;
select * from game;
select * from injury;
select * from penalty;
select * from sport;
select * from team;
*/


		  The End
⢀⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆ 
⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠁⠸⣼⡿ 
⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉⠀⠀⠀⠀⠀ 
⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 
⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠿⠿⠛⠉*/
