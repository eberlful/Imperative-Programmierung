program Aufgabe5 (output);

    type    tRefBinBaum = ^tBinBaum;
            tBinBaum = record
                        Wert : Integer;
                        links, rechts : tRefBinBaum;
                    end;

    var anfangBaum, erzeuger : tRefBinBaum;

function enthaeltWert(inBaum : tRefBinBaum; inWert : integer) : Boolean;
{Prueft einen Baum ob inWert in einem Element existiert}

    var uebergabe : Boolean;

begin
    if inBaum = nil then
    begin
        enthaeltWert := false;
    end
    else
    begin
        if inWert > inBaum^.Wert then
        begin
            uebergabe := enthaeltWert(inBaum^.rechts, inWert);
        end;
        if inWert < inBaum^.Wert then
        begin
            uebergabe := enthaeltWert(inBaum^.links, inWert);
        end;
        if inWert = inBaum^.Wert then
        begin
            enthaeltWert := true;
        end
        else
        begin
            enthaeltWert := uebergabe;
        end;
    end;
end;

begin
    new (erzeuger);
    anfangBaum := erzeuger;
    erzeuger^.Wert := 10;
    new (erzeuger);
    erzeuger^.Wert := 3;
    anfangBaum^.links := erzeuger;
    new (erzeuger);
    erzeuger^.Wert := 13;
    anfangBaum^.rechts := erzeuger;

    writeln(enthaeltWert(anfangBaum, 5));
end.