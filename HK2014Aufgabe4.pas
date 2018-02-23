program Aufgabe4 (output);

    type
    tNatZahl = 1..maxint;
    tRefBinBaum = ^tBinBaum;
    tBinBaum = record
                Wert : tNatZahl;
                links : tRefBinBaum;
                rechts : tRefBinBaum;
            end;

    var
    baum1, baum2, neuElement, lauf : tRefBinBaum;

function checkBaum(inWurzel : tRefBinBaum; inMax : integer) : Boolean;
{Prueft ob die Blätter die größten Werte besitzen}

    var statusLinks, statusRechts : Boolean;
        max : tNatZahl;

begin
    statusLinks := true;
    statusRechts := true;
    if inWurzel^.Wert < inMax then
    begin
        max := inMax;
    end
    else
    begin
        max := inWurzel^.Wert;
    end;
    if inWurzel^.links <> nil then
    begin
        statusLinks := checkBaum(inWurzel^.links, max);
    end;
    if inWurzel^.rechts <> nil then
    begin
        statusRechts := checkBaum(inWurzel^.rechts, max);
    end;
    if (inWurzel^.links = nil) and (inWurzel^.rechts = nil) then
    begin
        if inWurzel^.Wert > inMax then
        begin
            checkBaum := true;
        end
        else
        begin
            checkBaum := false;
        end;
    end
    else
    begin
        if (statusLinks = false) or (statusRechts = false) then
        begin
            checkBaum := false;
        end
        else
        begin
            checkBaum := true;
        end;
    end;
end;

begin
    new (neuElement);
    neuElement^.Wert := 11;
    baum1 := neuElement;
    new (neuElement);
    neuElement^.Wert := 8;
    baum1^.links := neuElement;
    lauf := neuElement;
    new (neuElement);
    neuElement^.Wert := 15;
    lauf^.links := neuElement;
    new (neuElement);
    neuElement^.Wert := 9;
    lauf^.rechts := neuElement;
    new (neuElement);
    neuElement^.Wert := 8;
    baum1^.rechts := neuElement;
    lauf := neuElement;
    new (neuElement);
    neuElement^.Wert := 14;
    lauf^.rechts := neuElement;

    writeln(checkBaum(baum1,0));
end.