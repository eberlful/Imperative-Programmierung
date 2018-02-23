program Aufgabe2 (output);

    const   MAXFELD = 20;

    type    tIndex = 1..MAXFELD;
            tFeld = array[tIndex] of integer;

    var     feld : tFeld;
            i : integer;

procedure feldDurchlaufen(var ioFeld : tFeld);
{Ersetzt alle doppelten Werte durch Null}

    var i, j : integer;

begin
    for i := 1 to MAXFELD do
    begin
        for j := i + 1 to MAXFELD do
        begin
            if ioFeld[i] = ioFeld[j] then
            begin
                ioFeld[j] := 0;
            end;
        end;
    end;
end;

begin
    Randomize;
    for i := 1 to MAXFELD do
    begin
        feld[i] := Random(10);
        writeln(feld[i]);
    end;

    feldDurchlaufen(feld);
    writeln('________________________________');
    for i := 1 to MAXFELD do
    begin
        writeln(feld[i]);
    end;
end.