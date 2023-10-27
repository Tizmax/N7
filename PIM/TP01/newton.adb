with ada.float_text_io; use ada.float_text_io;
with ada.text_io; use ada.text_io;

Procedure newton is
    Number: Float;
    Precision: Float;
    Current_A: Float := 1.0;
    Last_A: Float;
    Method: Character;
Begin
    Put_Line("Number ?");
    Get(Number);
    Put_Line("Precision ?");
    Get(Precision);  
    Put_Line("Put S for Square Method");
    Get(Method);
    if Method = 'S' then
        loop
            Current_A := (Current_A + Number/Current_A)/2.0;
            exit when abs(Current_A**2 - Number) < Precision;
        end loop;
        Put_Line("Square Method :");
    else
        loop
            Last_A := Current_A;
            Current_A := (Current_A + Number/Current_A)/2.0;
            exit when abs(Current_A - Last_A) < Precision;
        end loop;
        Put_Line("Classic Method :");
    end if;
    Put(Current_A);
end newton;
