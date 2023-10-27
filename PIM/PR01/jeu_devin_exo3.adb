with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Alea;

--Code complet
Procedure jeu_devin_exo3 is
    -- Variables du code principal
    Choix: Integer; --nombre qui indique le jeu auquel l'utilisateur veut jouer
    Quit: Boolean := False; --condition pour arrêter le jeu
    
    --Code du premier Jeu Devin
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
    
    --Code du second Jeu Devin
    procedure jeu_devin_exo2 is
        --Variables
        rep: Character; --reponse n°1 de l'utilisateur dans la  ligne de commandes
        nbChoisi: Boolean; --indique si l'utilisateur a choisi un nombre
        min: Integer; --borne minimale pour la dichotomie
        max: Integer; --borne maximale pour la dichotomie
        trouve: Boolean; --indique si le nombre a été trouvé
        triche: Boolean; --indique si l'utilisateur triche
        cpt: Integer; --compteur pour le nombre de tentatives
        p: Integer; --nombre proposé par l'ordinateur
        rep2: Character; --reponse de l'utilisateur dans la ligne de commande
        
    begin
        -- Demander à l'utilisateur de choisir un nombre
        nbChoisi:= false;
        while (not nbChoisi) loop
            Put_Line("Avez-vous choisi un nombre entre 1 et 999? (o/n)");
            Get(rep);
            -- On considère que l'utilisateur a choisi un nombre que s'il répond 'o' ou 'O'
            if rep='o' or rep='O' then
                nbChoisi:= true;
            else
                Put_Line("J'attends...");
            end if;
        end loop;

        -- Determiner le nombre choisi par l'utilisateur
        -- Initialisation des variables
        min:=1;
        max:=999+1;
        trouve:=false;
        triche:= false;
        cpt:=0;

        loop
            -- Proposer un nombre à mi-chemin entre min et max
            p:=(min+max)/2;
            cpt:=cpt+1;
            Put("Proposition ");
            Put(cpt, 1);
            Put(" : ");
            Put(p, 1);
            New_Line;
            Put_Line("Trop (g)rand, trop (p)etit ou (t)rouvé? ");
            -- Lire et traiter la réponse de l'utilisateur
            Get(rep2);
            case rep2 is
                when 'g'|'G' => max:=p-1;
                when 'p'|'P' => min:=p+1;
                when 't'|'T' => trouve:=true;
                when others => Put_Line("Je n’ai pas compris. Merci de répondre: g si ma proposition est trop grande, p si ma proposition est trop petite, t si j’ai trouvé le bon nombre");
            end case;
            -- Vérifier que l'utilisateur ne triche pas
            if (max<=min) then
                triche:=true;
            end if;
        exit when (trouve or triche); -- la partie s'arrête lorsque l'ordinateur trouve le nombre ou en cas de triche
        end loop;

        --Mettre fin à la partie
        if triche then --cas de triche
            Put_Line("Vous trichez. J'arrête cette partie.");
        else --cas où l'ordinateur a trouvé le bon nombre
            Put("J'ai trouvé ");
            Put(p, 1);
            Put(" en ");
            Put(cpt, 1);
            Put(" essai(s).");
            New_Line;
        end if;
       
    end jeu_devin_exo2;

--Code du jeu complet   
begin 
    loop
        --Permettre à l'utilisateur de choisir s'il souhaite deviner, faire deviner ou quitter
        New_Line;
		Put_Line("1- L'ordinateur choisit un nombre et vous le devinez");
        Put_Line("2- Vous choisissez un nombre et l'ordinateur le devine");
        Put_Line("0- Quitter le programme");
        Put("Votre choix : ");
        Get(Choix);
        New_Line;
        
        --Lancer l'action voulue par l'utilisateur
        Case Choix is
            When 1 => jeu_devin_exo1;
            When 2 => jeu_devin_exo2;
            When 0 => Quit := True;
            When others => Put_Line("Choix incorrect.");
        End Case;

        Exit when Quit; --Le programme s'arrête lorsque l'utilisateur a demandé de quitter le jeu
    End loop;

    Put_Line("Au revoir...");

End jeu_devin_exo3; --fin du programme
