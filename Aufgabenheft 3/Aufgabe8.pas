{$R+}
{$B+}

program Aufgabe8 (input, output);

type
tPerson = record
            Name : string[20];
            Alter : integer
            end;

var
pPerson1, pPerson2 : ^tPerson;
Zahl1, Zahl2 : integer;
pZahl1, pZahl2 : ^integer;
Auswahl : char;

begin
    writeln('Geben sie eine Auswahl an (A, B, C)');
    readln(Auswahl);

    if (Auswahl = 'A') or (Auswahl = 'a') then
        begin
            new (pPerson1);
            pPerson1^.Name := 'Monika';
            pPerson1^.Alter := 31;
        end;
    if (Auswahl = 'B') or (Auswahl = 'b') then
        begin          
            new (pZahl1);
            new (pZahl2);
            pZahl1^ := 15;
            pZahl2 := pZahl1;
        end;
    if (Auswahl = 'C') or (Auswahl = 'c') then
        begin
            Zahl1 := 35;
            new (pPerson1);
            pPerson1^.Name := 'Till';
            pPerson1^.Alter := Zahl1;    
        end;
    if (Auswahl = 'D') or (Auswahl = 'd') then
        begin
            new (pZahl1);
            new (pZahl2);
            Zahl1 := 23;
            Zahl2 := 75;
            if (Zahl1 < Zahl2) then 
                pZahl1^ := 23
            else
                pZahl1^ := 75;
        end;
    if (Auswahl = 'E') or (Auswahl = 'e') then
        begin
            new (pZahl1);
            Zahl1 := 34;
            pZahl1^ := Zahl1;
            pZahl2 := pZahl1;
        end;
end.

{
    A[]     -> Falsche Schreibweise des Zeigers

    B[]     -> Falsche Schreibweise bei der Wertzuweisung

    C[x]

    D[]     -> Falsche Schreibweise bei der Wertzuweisung

    E[x]
}