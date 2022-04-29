/* 
Dado el excelente trabajo realizado por los alumnos, se pretende cambiar su puntuación a 10 en SQL,
se crea un procedimiento para poder cambiar las notas según el ámbito e instituto, como parámetro se introduce
la nota, instituto y el ámbito y se comprueba que los parámetros sean válidos
*/
use dual_nttdata;

DROP FUNCTION IF EXISTS existe_instituto;
DELIMITER //
CREATE FUNCTION existe_instituto ( instto varchar(30) ) 
						RETURNS tinyint DETERMINISTIC
BEGIN
 
	/* ----------------------------------------------
	 * Declaración de variable
	 * ---------------------------------------------*/
	declare existe_insti tinyint(1);

	-- cuántos institutos encuentra (0 o 1)
	select count(instituto.nombre)
	from instituto 
	where instituto.nombre = instto
	into existe_insti;

	return existe_insti;
	
END //
DELIMITER ;

DROP FUNCTION IF EXISTS existe_ambito;
DELIMITER //
CREATE FUNCTION existe_ambito ( ambt varchar(30) ) 
						RETURNS tinyint DETERMINISTIC
BEGIN
 
	/* ----------------------------------------------
	 * Declaración de variable
	 * ---------------------------------------------*/
	declare existe_ambito tinyint(1);

	-- cuántos ámbitos encuentra (0 o 1)
	select count(nota.ambito)
	from nota
	where nota.ambito = ambt
	into existe_ambito;

	return existe_ambito;
	
END //
DELIMITER ;





DROP PROCEDURE IF EXISTS
puntuar;
DELIMITER //
CREATE PROCEDURE puntuar (instto varchar(30),ambt varchar(30),puntcn int(2))
COMMENT 'poner notas por instituto y ámbito'
BEGIN

	/* ----------------------------------------------
	 * Variables hecho (para el cursor), dni y nota
	 * ---------------------------------------------*/
	declare done bool default FALSE;
	declare dni_alumno varchar(9);


	/* -------------------------------------------------
	 * Se declara el cursor (señala al dni del alunno)
	 * del instituto pasado por parámetro y el ámbito
	 * por el que se pretende puntuar
	 * -------------------------------------------------*/
	declare alm cursor for
	select nota.alumno
	from alumno join nota 
	on alumno.DNI = nota.alumno 
	where 
		alumno.instituto like instto
		and nota.ambito like ambt;
	
	/* --------------------------------------------------
	 * * Variable para salir del cursor
	 *--------------------------------------------------*/
	declare continue HANDLER FOR NOT FOUND SET done = TRUE;

	/* ----------------------------------------------
	 * Comprobar que los parámetros son válidos
	 * ---------------------------------------------*/
	if (existe_instituto(instto) = 0) THEN
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los parámetros, el instituto insertado no existe';
	end if;
	if (existe_ambito(ambt) = 0) then
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los parámetros, el ámbito insertado no existe';
	end if;
	if (puntcn < 0 or puntcn > 10) then
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los parámetros, la nota debe estar entre 0 y 10';
	end if;

	/* ---------------------------------------------------
	 * Recorrer la tabla con el cursor
	 * ---------------------------------------------------*/
	open alm;
		
		-- mientras haya registros
		 while (NOT done) do
		 
			-- introducir las variables del cursor actual
		 	fetch alm into dni_alumno ; 
		
		 	-- prevenir que no intente entrar en un registro inexistente al final del cursor
		 	if (NOT done) then
		
		 		-- actualizar nota del alumno
		 		update nota 
		 		set nota.puntuacion = puntcn
		 		where nota.alumno = dni_alumno
		 		and nota.ambito = ambt;
		
		 	end if;
		
		 end while;
	
	close alm; 
END //
DELIMITER ;

 -- Llamada al procedimiento
 CALL puntuar('IES Alixar','SQL',10);

-- Comprobar que se han cambiado las notas
select nota.puntuacion, alumno.DNI , alumno.instituto , nota.ambito 
from nota join alumno 
on alumno.DNI = nota.alumno 
where alumno.instituto like '%lixa%'
and nota.ambito like 'SQL';