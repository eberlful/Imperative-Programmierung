program Aufgabe3 (output);
{Programm zur Aufgabe 3 HK2011}

    const FELDGROESSE = 5;

    type tIndex = 1..FELDGROESSE;
         tFeld = array[tIndex] of integer;

    var feldFirst, feldSecond : tFeld;
        stat : Boolean;

function enthaeltElement(feld1, feld2 : tFeld) : Boolean;
{gibt true zurueck, wenn jeder Wert eines Feldes auch im anderem Feld enthalten ist}

    var i, j : integer;
        status, value : Boolean;
    
begin
    status := true;
    value := false;
    for i := 1 to FELDGROESSE do
    begin
        for j := 1 to FELDGROESSE do
        begin
            if feld1[i] = feld2[j] then
            begin
                value := true;
            end;
        end;
        if value = false then
        begin
            status := false;
            enthaeltElement := false;
        end;
        value := false;
    end;
    if status = true then
    begin
        enthaeltElement := true;
    end;
end;

begin
    feldFirst[1] := 1;
    feldFirst[2] := 2;
    feldFirst[3] := 3;
    feldFirst[4] := 3;
    feldFirst[5] := 1;

    feldSecond[1] := 1;
    feldSecond[2] := 2;
    feldSecond[3] := 4;
    feldSecond[4] := 4;
    feldSecond[5] := 5;

    stat := enthaeltElement(feldFirst, feldSecond);
    writeln(stat);
end.