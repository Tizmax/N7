with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Alea;

procedure jeu_devin_exo1 is
    --Package Alea pour tirer un nombre aléatoire
    package Mon_Alea is
    new Alea (1, 999);
    use Mon_Alea;

    --Variables
    X: Integer; --Nombre aléatoire à deviner
    Y: Integer; --Nombre proposé par l'utilisateur
    nb_tenta: Integer := 0; --compteur pour le nombre de tentatives effectuées

begin
    --Choisir un nombre aléatoire entre 1 et 999
    Get_Random_Number(X);

    --Faire deviner le nombre à l'utilisateur
    loop
        --Demander à l'utilisateur de choisir un nombre
        Put_Line("Choisir un nombre entre 1 et 999 inclus");
        Get(Y);
        nb_tenta := nb_tenta + 1;
        
        --Indiquer à l'utilisateur si sa proposition est plus grande, plus petite
        -- ou égale au nombre à deviner
        if y > x then
            Put_Line("Trop grand !");
        elsif y < x then
            Put_Line("Trop petit !");
        else
            Put_Line("Trouvé en " & Integer'Image(nb_tenta) & " essai(s)");
        end if;
        
        exit when x = y; --le jeu se finit lorsque l'utilisateur a trouvé le nombre

    end loop;
end jeu_devin_exo1;
