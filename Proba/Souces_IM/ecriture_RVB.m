% Fonction ecriture_RVB

function image_RVB = ecriture_RVB(image_originale)

B = image_originale(2:2:1024,1:2:1024);
R = image_originale(1:2:1024,2:2:1024);
V1 = image_originale(1:2:1024,1:2:1024);
V2 = image_originale(2:2:1024,2:2:1024);
V = (V1 + V2)*0.5;

image_RVB = cat(3,R,V,B);

end