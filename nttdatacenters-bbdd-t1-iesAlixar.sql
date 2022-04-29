-- ============================================================================
-- BBDD DUAL_NTTDATA
-- Authors : Mario Cantero Shimizu, Javier Coronel Ortiz, Isabel Pastor López
-- Date : 28/04/2022
-- Description :
-- 	La empresa NTT DATA tiene como necesidad tener una base de datos 
-- 	para gestionar la formación DUAL de los alumnos de distintos centros. 
-- 	Por eso hemos basado el modelo estructural de nuestra base de datos 
-- 	unicamente en esta empresa y sus necesidades
--  Se crean las tablas - persona - mentor - 
-- 						- instituto - alumno 
--                      - nota - cuenta
-- ============================================================================
drop database if exists DUAL_NTTDATA;
create database DUAL_NTTDATA;
use DUAL_NTTDATA;
-- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`persona`
-- -----------------------------------------------------
create table `persona`(

	DNI Varchar(9) primary key, 
	nombre varchar(30) not null,
	edad int,
	email_personal varchar(30),
	telefono int
	
);
-- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`mentor`
-- -----------------------------------------------------
create table mentor(

	DNI Varchar(9) primary key,
	especializacion varchar(20),
	FOREIGN KEY (DNI) REFERENCES persona(DNI)
	
);
 -- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`instituto`
-- -----------------------------------------------------
create table instituto(

	nombre varchar(30) primary key,
	provincia varchar(30)

);
 -- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`alumno`
-- -----------------------------------------------------
create table `alumno`(

	DNI Varchar(9) primary key,
	graduado bool,
	instituto  varchar(30),
	FOREIGN KEY (DNI) REFERENCES persona(DNI),
	FOREIGN KEY (instituto) REFERENCES instituto(nombre)
	
);
 -- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`nota`
-- -----------------------------------------------------
create table nota (

	alumno varchar(9),
	fecha date,
	puntuacion int(2),
	ambito varchar(30),
	FOREIGN KEY (alumno) REFERENCES alumno(DNI),
	primary key (alumno, fecha, ambito)
	
);
 -- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`cuenta`
-- -----------------------------------------------------
create table cuenta (
	
	email varchar (30) primary key,
	dni varchar(9),
	salario double (9,2) ,
	FOREIGN KEY (DNI) REFERENCES persona(DNI)

);
 -- -----------------------------------------------------
-- Table `DUAL_NTTDATA`.`ensenanza`
-- -----------------------------------------------------
create table ensenanza (

	alumno varchar(9),
	mentor varchar(9),
	fechainicio date,
	fechafin date,
	FOREIGN KEY (alumno) REFERENCES alumno(DNI),
	FOREIGN KEY (mentor) REFERENCES mentor(DNI),
	primary key (alumno, mentor)
	
);


-- ============================================================================
-- BBDD DUAL_NTTDATA
-- INSERCIÓN DE DATOS
-- ============================================================================

-- inserción en la tabla persona


insert into persona (DNI, nombre, edad, email_personal, telefono) values ('12817428L', 'Cody Bachshell', 35, 'cbachshell0@huffingtonpost.com', 808639681);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('25063422V', 'Boony Froud', 45, 'bfroud1@comcast.net', 253953703);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('42459387E', 'Liam Skippen', 44, 'lskippen2@creativecommons.org', 219707396);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('19468858A', 'Leroy Arthy', 39, 'larthy3@gnu.org', 474311983);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('19123780G', 'Dimitry End', 36, 'dend4@illinois.edu', 328676178);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('38846391I', 'Ben Clemendot', 26, 'bclemendot5@plala.or.jp', 253019723);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('40823899B', 'Roberto Noakes', 35, 'rnoakes6@cnn.com', 298331397);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('97061136V', 'Tomlin Bernardino', 43, 'tbernardino7@mayoclinic.com', 805261443);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('14218867F', 'Lynna Kayser', 36, 'lkayser8@google.ru', 963899258);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('09278546V', 'Edgar Rickets', 40, 'erickets9@fotki.com', 416721139);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('98039802M', 'Flory Dugood', 34, 'fdugooda@weebly.com', 425745590);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('03471659X', 'Ruth Laugherane', 20, 'rlaugheraneb@ftc.gov', 625501714);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('39639874L', 'Francklin Crummey', 28, 'fcrummeyc@nbcnews.com', 746446688);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('43319372X', 'Therine Boyen', 23, 'tboyend@tiny.cc', 965400412);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('73858049Z', 'Dynah Grimes', 25, 'dgrimese@youku.com', 850018686);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('26369015I', 'Falkner Sanders', 38, 'fsandersf@flickr.com', 318554082);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('85502371O', 'Lelah Jell', 39, 'ljellg@newsvine.com', 789361706);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('65720477F', 'Ingar Kacheller', 19, 'ikachellerh@amazonaws.com', 236499985);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('52896934U', 'Shel McGlashan', 34, 'smcglashani@latimes.com', 729446393);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('64521522D', 'Keane Hardware', 31, 'khardwarej@independent.co.uk', 275014663);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('89554422O', 'Maite Muñoz', 33, 'smcglashdi@latimes.com', 729846393);
insert into persona (DNI, nombre, edad, email_personal, telefono) values ('11577522D', 'Ernesto Lacueva', 54, 'khaddarej@independent.co.uk', 215014663);

-- inserción en la tabla persona


insert into cuenta (email, dni, salario) values ('cstruss0@nttdata.net', '12817428L', 2435);
insert into cuenta (email, dni, salario) values ('kthoday1@nttdata.com', '25063422V', 2060);
insert into cuenta (email, dni, salario) values ('twasielews@nttdata.com', '42459387E', 1896);
insert into cuenta (email, dni, salario) values ('cshimwall3@nttdata.com', '19468858A', 1194);
insert into cuenta (email, dni, salario) values ('lcoad4@nttdata.au', '19123780G', 1881);
insert into cuenta (email, dni, salario) values ('dhelling5@nttdata.com', '38846391I', 1146);
insert into cuenta (email, dni, salario) values ('wlyenyng6@nttdata.com', '40823899B', 2102);
insert into cuenta (email, dni, salario) values ('npatkin7@nttdata.com', '97061136V', 1787);
insert into cuenta (email, dni, salario) values ('dcreasy8@nttdata.com', '14218867F', 1610);
insert into cuenta (email, dni, salario) values ('ndienes9@nttdata.com', '09278546V', 1305);
insert into cuenta (email, dni, salario) values ('kpinwilla@nttdata.com', '98039802M', 1390);
insert into cuenta (email, dni, salario) values ('fhusseyb@nttdata.com', '03471659X', 1730);
insert into cuenta (email, dni, salario) values ('ldimmnec@nttdata.gov', '39639874L', 2446);
insert into cuenta (email, dni, salario) values ('dardyd@nttdata.edu', '43319372X', 2656);
insert into cuenta (email, dni, salario) values ('hdupree@nttdata.com', '73858049Z', 1849);
insert into cuenta (email, dni, salario) values ('gcamilif@nttdata.com', '26369015I', 2120);
insert into cuenta (email, dni, salario) values ('nsudellg@nttdata.gov', '85502371O', 1268);
insert into cuenta (email, dni, salario) values ('dvinsenh@nttdata.com', '65720477F', 2039);
insert into cuenta (email, dni, salario) values ('srowatti@nttdata.com', '52896934U', 1300);
insert into cuenta (email, dni, salario) values ('rwaldockj@nttdata.au', '64521522D', 1084);

-- inserción en la tabla instituto

insert into instituto (nombre, provincia) values ('IES Alixar', 'Sevilla');
insert into instituto (nombre, provincia) values ('IES Cesur Malaga', 'Malaga');
insert into instituto (nombre, provincia) values ('IES Sotero Hernandez', 'Sevilla');
insert into instituto (nombre, provincia) values ('IES Campanillas', 'Malaga');

-- inserción en la tabla alumno

insert into alumno (DNI, graduado, instituto) values ('12817428L', true, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('25063422V', false, 'IES Cesur Malaga');
insert into alumno (DNI, graduado, instituto) values ('42459387E', false, 'IES Cesur Malaga');
insert into alumno (DNI, graduado, instituto) values ('19468858A', true, 'IES Campanillas');
insert into alumno (DNI, graduado, instituto) values ('19123780G', false, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('38846391I', false, 'IES Campanillas');
insert into alumno (DNI, graduado, instituto) values ('40823899B', false, 'IES Campanillas');
insert into alumno (DNI, graduado, instituto) values ('97061136V', true, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('14218867F', true, 'IES Campanillas');
insert into alumno (DNI, graduado, instituto) values ('09278546V', true, 'IES Sotero Hernandez');
insert into alumno (DNI, graduado, instituto) values ('98039802M', true, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('03471659X', true, 'IES Sotero Hernandez');
insert into alumno (DNI, graduado, instituto) values ('39639874L', false, 'IES Cesur Malaga');
insert into alumno (DNI, graduado, instituto) values ('43319372X', false, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('73858049Z', true, 'IES Sotero Hernandez');
insert into alumno (DNI, graduado, instituto) values ('26369015I', true, 'IES Alixar');
insert into alumno (DNI, graduado, instituto) values ('85502371O', true, 'IES Sotero Hernandez');

-- inserción en la tabla mentor

insert into mentor (DNI, especializacion) values ('65720477F', 'Front End');
insert into mentor (DNI, especializacion) values ('52896934U', 'Back End');
insert into mentor (DNI, especializacion) values ('64521522D', 'Full Stack');
insert into mentor (DNI, especializacion) values ('89554422O', 'Full Stack');
insert into mentor (DNI, especializacion) values ('11577522D', 'Full Stack');

-- inserción en la tabla notas

insert into nota (alumno, fecha, ambito, puntuacion) values ('25063422V', '2021-09-13', 'Java', 9);
insert into nota (alumno, fecha, ambito, puntuacion) values ('19123780G', '2021-07-10', 'SQL', 2);
insert into nota (alumno, fecha, ambito, puntuacion) values ('19123780G', '2021-10-19', 'Java', 1);
insert into nota (alumno, fecha, ambito, puntuacion) values ('14218867F', '2021-04-26', 'Java', 7);
insert into nota (alumno, fecha, ambito, puntuacion) values ('26369015I', '2022-01-13', 'SQL', 8);
insert into nota (alumno, fecha, ambito, puntuacion) values ('03471659X', '2021-09-25', 'Git', 9);
insert into nota (alumno, fecha, ambito, puntuacion) values ('14218867F', '2021-09-04', 'Maven', 3);
insert into nota (alumno, fecha, ambito, puntuacion) values ('19123780G', '2021-09-27', 'Maven', 8);
insert into nota (alumno, fecha, ambito, puntuacion) values ('09278546V', '2021-05-18', 'HTML', 3);
insert into nota (alumno, fecha, ambito, puntuacion) values ('85502371O', '2021-05-05', 'HTML', 10);
insert into nota (alumno, fecha, ambito, puntuacion) values ('40823899B', '2022-04-04', 'SQL', 6);
insert into nota (alumno, fecha, ambito, puntuacion) values ('39639874L', '2021-12-11', 'SQL', 7);
insert into nota (alumno, fecha, ambito, puntuacion) values ('38846391I', '2021-09-30', 'Git', 5);
insert into nota (alumno, fecha, ambito, puntuacion) values ('98039802M', '2022-02-12', 'Git', 2);
insert into nota (alumno, fecha, ambito, puntuacion) values ('14218867F', '2021-12-19', 'Java', 1);
insert into nota (alumno, fecha, ambito, puntuacion) values ('09278546V', '2021-07-20', 'Java', 4);
insert into nota (alumno, fecha, ambito, puntuacion) values ('85502371O', '2021-06-03', 'HTML', 6);
insert into nota (alumno, fecha, ambito, puntuacion) values ('14218867F', '2021-08-20', 'Java', 7);
insert into nota (alumno, fecha, ambito, puntuacion) values ('19468858A', '2022-02-22', 'Java', 10);
insert into nota (alumno, fecha, ambito, puntuacion) values ('19468858A', '2022-04-07', 'HTML', 10);

-- inserción en la tabla ensenanza

insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('12817428L', '65720477F', '2022-04-08', '2021-07-22');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('25063422V', '65720477F', '2022-01-01', '2022-03-22');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('42459387E', '65720477F', '2021-10-29', '2021-04-29');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('19468858A', '65720477F', '2021-08-09', '2022-01-25');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('19123780G', '65720477F', '2022-02-22', '2022-03-02');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('38846391I', '52896934U', '2022-02-04', '2021-05-16');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('40823899B', '52896934U', '2021-09-07', '2022-01-30');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('97061136V', '52896934U', '2021-05-22', '2022-02-05');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('14218867F', '52896934U', '2021-08-27', '2021-07-10');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('09278546V', '52896934U', '2021-06-09', '2021-12-16');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('98039802M', '52896934U', '2022-01-18', '2021-07-12');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('03471659X', '64521522D', '2021-12-08', '2021-09-20');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('39639874L', '64521522D', '2022-04-12', '2021-12-13');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('43319372X', '64521522D', '2021-12-11', '2022-03-31');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('73858049Z', '64521522D', '2022-04-19', '2022-02-15');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('26369015I', '64521522D', '2022-01-25', '2021-07-24');
insert into ensenanza (alumno, mentor, fechainicio, fechafin) values ('85502371O', '64521522D', '2021-11-16', '2022-03-18');


-- ============================================================================
-- BBDD DUAL_NTTDATA
-- CONSULTAS
-- ============================================================================

-- ------------------------------------------
/* CONSULTAS SIMPLES */
-- ------------------------------------------

-- Contar cuántos alumnos están graduados 
select * 
from alumno 
where graduado=1;

-- Mostrar las personas que cuyos nombres empiezen por R y tengan menos de 30 años
select p.*
from persona p 
where nombre like '%R' and edad < 30;

-- Mostrar institutos de sevilla
select i.nombre 
from instituto i 
where i.provincia  like 'Sevilla';

-- Las personas que tengan entre 20  y 30 años
select * 
from persona p 
where p.edad between 20 and 30;

-- La media de edad de las personas
select avg(p.edad) 
from persona p;


-- ------------------------------------------
/* CONSULTAS MEDIAS */
-- ------------------------------------------

-- Ámbito y notas máximas , agrupados por ámbitos, donde la nota máxima sea 8
select max(puntuacion), ambito 
from nota 
group by ambito
having max(puntuacion)=8;

--  alumnos graduados agrupados por graduado siendo su nota mayor a 5
select a.graduado, avg(n.puntuacion) 
from persona p 
inner join alumno a 
on p.DNI = a.DNI 
inner join nota n 
on a.DNI = n.alumno
group by a.graduado  
having avg(n.puntuacion) >= 5;

-- Seleccionar mentores, especialidad, agrupados por especialidad , donde existan más de 3 mentores
select m.especializacion
from mentor m 
group by m.especializacion 
having count(m.DNI) >= 3;

-- ------------------------------------------
/* CONSULTAS COMPLEJAS */
-- ------------------------------------------

--  La nota media entre todos los alumnos del instituto IES Alixar
select avg(puntuacion) 
from nota join alumno
on alumno.DNI = nota.alumno 
where alumno.instituto like "IES Alixar";

-- Mostrar los alumnos a los que ha enseñado el mentor con nombre Shel McGlashan  y su fecha de inicio y de fin.
select a.DNI, e.fechainicio , e.fechafin
from alumno a 
inner join ensenanza e on a.DNI = e.alumno 
inner join mentor m on m.DNI = e.mentor 
inner join persona p ON p.DNI = m.DNI 
where p.nombre like 'Shel McGlashan';

-- La media de los salarios de los mentores
select avg(c.salario) 
from cuenta c 
inner join persona p ON c.dni = p.DNI 
inner join mentor m on p.DNI = m.DNI;
