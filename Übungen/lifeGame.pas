{$B+}
{$R+}
program game (intput, output);
{Fraegt Benutzer welches Spiel er starten will
***********************************************
***                 1 = GameOfLife          ***
***********************************************}


{
*******************************************************
***                 0 = Tod                         ***
***                 1 = Leben                       ***
***                 9 = Rand                        ***
***                99 = Fehler                      ***
*******************************************************
}
uses Crt;

const
BREITE = 50;
HOEHE = 50;

type
tBreite = 1..BREITE;
tHoehe = 1..HOEHE;
tStatus = 1..100;
tFeld = array[tBreite, tHoehe] of tStatus;

var
auswahl : integer;
spielfeld : tFeld;

procedure loescheBildschirm();
{loescht Bildschirmausgabe}
begin
    ClrScr;
end;

procedure generiereStartFeld(var ioFeld : tFeld);
{Erzeugt erstmalig das Spielfeld mit Zufallswerten}

var
i, j : integer;
begin
    Randomize;
    readln();
    for i := 0 to BREITE do
    begin
    readln();
        for j := 0 to HOEHE do
        begin
            {Erzeugt Rand}
            readln();
            writeln(j);
            if (i = 0) or (i = BREITE) or (j = 0) or (j = HOEHE) then
            begin
                ioFeld[i,j] := 9;
            end
            else
            begin
                ioFeld[i,j] := random(2);
            end;
        end;
    end;
end;

procedure feldAusgeben(var inFeld : tFeld);
{Gibt Feld auf Bildschirm aus}
var
i, j : integer;

begin
    ClrScr;
    for i := 1 to BREITE do
    begin
        for j := 1 to HOEHE do
        begin
            write('0');
            if (inFeld[i,j] = 1) then
            begin
                GotoXY(i,j);
                write('0')
            end;
        end;
    end;
end;

begin
    Randomize;
    writeln('Welches Spiel wollen Sie starten ?');
    readln(auswahl);

    {Auswahl der Eingabe}
    if (auswahl = 1) then
    begin
        writeln('Sie haben GameOfLife gewählt');
        loescheBildschirm();
        generiereStartFeld(spielfeld);
        writeln('Spielfeld erzeugt');
    end;
    readln();
end.