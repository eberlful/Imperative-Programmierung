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

function korrekterBaum(inBinBaum : tRefBinBaum; inMaxWert : integer) : Boolean;
{Prueft ob die Blätter die größten Werte besitzen}

begin
    if inMaxWert > 
end;

begin
    new (neuElement);
    neuElement^.Wert := 11;
    baum1 := neuElement;
    new (neuElement);
    neuElement^.Wert := 5;
    baum1^.links := neuElement;
    lauf := neuElement;
    new (neuElement);
    neuElement^.Wert := 13;
    lauf^.links := neuElement;
    new (neuElement);
    neuElement^.Wert := 12;
    lauf^.rechts := neuElement;
    new (neuElement);
    neuElement^.Wert := 8;
    baum1^.rechts := neuElement;
    lauf := neuElement;
    new (neuElement);
    neuElement^.Wert := 14;
    lauf^.rechts := neuElement;

    
end.