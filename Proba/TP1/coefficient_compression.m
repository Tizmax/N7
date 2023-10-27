% Fonction coefficient_compression (exercice_2.m)

function coeff_comp = coefficient_compression(signal_non_encode,signal_encode)
    
    [a,b] = size(signal_non_encode);
    [c,d] = size(signal_encode);

    coeff_comp = a*b/(c*d);

end