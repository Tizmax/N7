with ada.float_text_io; use ada.float_text_io;

Procedure puissance is
    Puissance: Integer;
    Reel: Float;
    Resultat: Float := 1.0;
Begin
    Get(Reel);
    Get(Puissance);
        For i in 1..Puissance loop
            Resultat := Resultat*Reel;
        end loop;
    Put(Resultat);
End puissance;
