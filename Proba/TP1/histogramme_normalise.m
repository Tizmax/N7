% Fonction histogramme_normalise (exercice_2.m)

function [vecteurs_frequences,vecteur_Imin_a_Imax] = histogramme_normalise(I)

    Imin = min(I(:));
    Imax = max(I(:));

    vecteur_Imin_a_Imax = (Imin:1:Imax);

    [histogramme, ~] = histcounts(I,Imax-Imin+1);
    vecteurs_frequences = histogramme/sum(histogramme);
end