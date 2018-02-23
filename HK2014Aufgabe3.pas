program Aufgabe3 (output);

    type
    tRefListe = ^tListe;
    tListe = record
                wert : integer;
                next : tRefListe;
            end;

    var
    anfangListe, erzeug, laufVar : tRefListe;

function Dreieck(inRefAnfang : tRefListe) : tRefListe;
{Berechnet die nächste Zeile des Pascalsche Dreieck}

    var aktuell, neuErzeug, listenAnfang, prev, lauf : tRefListe;

begin
    aktuell := inRefAnfang;
    if aktuell^.next = nil then
    {Uebergebene Liste hat nur ein Element}
    begin
        writeln('Nur ein Element erkannt');
        new (neuErzeug);
        neuErzeug^.wert := 1;
        listenAnfang := neuErzeug;
        new (neuErzeug);
        neuErzeug^.wert := 1;
        listenAnfang^.next := neuErzeug;
        neuErzeug^.next := nil;
    end
    else
    begin
        prev := aktuell;
        aktuell := aktuell^.next;
        new (neuErzeug);
        neuErzeug^.wert := 1;
        listenAnfang := neuErzeug;
        lauf := neuErzeug;
        while aktuell <> nil do
        begin
            new (neuErzeug);
            neuErzeug^.wert := prev^.wert + aktuell^.wert;
            lauf^.next := neuErzeug;
            lauf := lauf^.next;
            prev := aktuell;
            aktuell := aktuell^.next;
        end;
        new (neuErzeug);
        neuErzeug^.wert := 1;
        lauf^.next := neuErzeug;
        neuErzeug^.next := nil;
    end;

    Dreieck := listenAnfang;
end;

begin
    new (erzeug);
    erzeug^.wert := 1;
    erzeug^.next := nil;
    anfangListe := erzeug;
    new (erzeug);
    erzeug^.wert := 4;
    anfangListe^.next := erzeug;
    new (erzeug);
    erzeug^.wert := 1;
    anfangListe^.next^.next := erzeug;
    erzeug^.next := nil;

    laufVar := Dreieck(anfangListe);

    erzeug := laufVar;
    while (erzeug <> nil) do
    begin
        writeln(erzeug^.wert);
        erzeug := erzeug^.next;
    end;
end.