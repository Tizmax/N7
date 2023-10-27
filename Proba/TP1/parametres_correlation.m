% Fonction parametres_correlation (exercice_1.m)

function [r,a,b] = parametres_correlation(Vd,Vg)

    moyenneX = mean(Vd);
    moyenneY = mean(Vg);

    varX = mean(Vd.*Vd) - moyenneX*moyenneX;
    varY = mean(Vg.*Vg) - moyenneY*moyenneY;

    sigmaX = sqrt(varX);
    sigmaY = sqrt(varY);

    cov = mean(Vg.*Vd) - moyenneX*moyenneY;

    r = cov/(sigmaX*sigmaY);

    a = cov/(sigmaX*sigmaX);

    b = moyenneY - moyenneX*a;
end