with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Afficher la somme des valeurs d'un série dont les valeurs sont lues au
-- clavier. Pour marquer la fin de la série, la dernière valeur est doublée.
-- En conséquence, il ne peut pas y avoir deux valeurs consécutives égales dans
-- la série.
--
-- Exemples :
--
-- série                   ->  longueur
-- ------------------------------------
--  1  2  3  3             ->    6
--  1  2  1  3  1  4  1  1 ->   13
-- -4  8  1  3 29 29       ->   37
--  0  0                   ->    0
-- -5 -1 -5 -5             ->  -11
--
procedure Somme_Serie_Double is

	Somme: Integer;     	-- Somme des valeurs de la série
	Current_int: Integer;
	Last_int: Integer;
	Stop: Boolean;

begin
	-- Déterminer la somme des valeurs d'une série lue un clavier
	Stop := False;
	Get(Current_int);
	Somme := Current_int;
	Last_int := Current_int;
	while not Stop loop
	    Get(Current_int);
	    if Last_int = Current_int then
	        Stop := True;
	    else
	        Somme := Somme + Current_int;
	        Last_int := Current_int;
	    end if;
	end loop;
	

	-- Afficher la longueurNone
	Put ("Somme : ");
	Put (Somme, 1);
	New_Line;

end Somme_Serie_Double;
