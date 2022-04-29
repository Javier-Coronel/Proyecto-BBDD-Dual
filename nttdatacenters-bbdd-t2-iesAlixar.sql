/* 
Dado el excelente trabajo realizado por los alumnos, se pretende cambiar su puntuaci�n a 10 en SQL,
se crea un procedimiento para poder cambiar las notas seg�n el �mbito e instituto, como par�metro se introduce
la nota, instituto y el �mbito y se comprueba que los par�metros sean v�lidos
*/
use dual_nttdata;

DROP FUNCTION IF EXISTS existe_instituto;
DELIMITER //
CREATE FUNCTION existe_instituto ( instto varchar(30) ) 
						RETURNS tinyint DETERMINISTIC
BEGIN
 
	/* ----------------------------------------------
	 * Declaraci�n de variable
	 * ---------------------------------------------*/
	declare existe_insti tinyint(1);

	-- cu�ntos institutos encuentra (0 o 1)
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
	 * Declaraci�n de variable
	 * ---------------------------------------------*/
	declare existe_ambito tinyint(1);

	-- cu�ntos �mbitos encuentra (0 o 1)
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
COMMENT 'poner notas por instituto y �mbito'
BEGIN

	/* ----------------------------------------------
	 * Variables hecho (para el cursor), dni y nota
	 * ---------------------------------------------*/
	declare done bool default FALSE;
	declare dni_alumno varchar(9);


	/* -------------------------------------------------
	 * Se declara el cursor (se�ala al dni del alunno)
	 * del instituto pasado por par�metro y el �mbito
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
	 * Comprobar que los par�metros son v�lidos
	 * ---------------------------------------------*/
	if (existe_instituto(instto) = 0) THEN
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los par�metros, el instituto insertado no existe';
	end if;
	if (existe_ambito(ambt) = 0) then
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los par�metros, el �mbito insertado no existe';
	end if;
	if (puntcn < 0 or puntcn > 10) then
		SIGNAL SQLSTATE '45000' SET
				Message_text = 'Revise los par�metros, la nota debe estar entre 0 y 10';
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