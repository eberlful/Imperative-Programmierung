program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
const
FELDLAENGE1 = 5;
FELDLAENGE2 = 8;
ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }
        
type
tFeld1 = array [1..FELDLAENGE1] of integer;
tFeld2 = array [1..FELDLAENGE2] of integer;
tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

var
Feld1 : tFeld1 = (11, 14, 18, 80, 100);
Feld2 : tFeld2 = (8, 11, 11, 17, 22, 30, 55, 70);
ErgebnisFeld : tErgebnisFeld;
i : integer;
j : integer;
k : integer;
h : integer;

begin

{ sortierte Felder einlesen }
writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
{for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);}

for i := 1 to FELDLAENGE1 do
    begin
        write(Feld1[i]);
    end;

{ Verschmelzungsprozess beginnen }
k := 1;
j := 1;
i := 1;

while (i <= FELDLAENGE1) or (j <= FELDLAENGE2) do
    begin
        {Prüfen ob Abfrage noch in beiden Feldern statt findet}
        if (i <= FELDLAENGE1) and (j <= FELDLAENGE2) then
            begin
                if Feld1[i] < Feld2[j] then
                    begin
                        ErgebnisFeld[k] := Feld1[i];
                        i := i + 1;
                        k := k + 1;
                    end
                else
                    begin
                        ErgebnisFeld[k] := Feld2[j];
                        j := j + 1;
                        k := k + 1;
                    end;
            end;
        {Läuft wenn j fertig ist, um den Rest von i abzuarbeiten}
        if (i <= FELDLAENGE1) and not(j <= FELDLAENGE2) then
            begin
                ErgebnisFeld[k] := Feld1[i];
                k := k + 1;
                i := i + 1;
            end;
        {Läuft wenn i fertig ist, um den Rest von j abzuarbeiten}
        if not (i <= FELDLAENGE1) and (j <= FELDLAENGE2) then
            begin
                ErgebnisFeld[k] := Feld2[j];
                k := k + 1;
                j := j + 1; 
            end;
    end;

writeln ('Das Ergebnisfeld ist:');
for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
writeln
end.
