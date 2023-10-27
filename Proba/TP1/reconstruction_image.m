% Fonction reconstruction_image (exercice_3.m)

function I_reconstruite = reconstruction_image(I_encodee,dictionnaire,hauteur,largeur)

    I_decodee = huffmandeco(I_encodee,dictionnaire);
    I_reconstruite = reshape(I_decodee,hauteur,largeur);
    
    for i = 2:largeur
        I_reconstruite(:,i) = I_reconstruite(:,i) + I_reconstruite(:,i-1);
    end

end