% Fonction decorrelation_colonnes (exercice_2.m) 

function I_decorrelee = decorrelation_colonnes(I)

    Vd = I(:,2:end);
    Vg = I(:, 1:end-1);

    I_decorrelee = I;
    I_decorrelee(:,2:end) = Vd-Vg;
end