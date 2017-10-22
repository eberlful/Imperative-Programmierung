program GameOfLife (input, output);
{Programm zum simulieren des Game-of-Life-Algorithmus darzustellen}

uses Crt;                   //Wird verwendet um Bildschirm zu clearen

const
STARTELEMENTE = 50;
HOEHE = 50;                 //in Pixel
BREITE = 50;                //in Pixel

{Außenring um die toten Element leichter zu simulieren, spiegeln kann dann auch leichter eingefuegt werden}
type
spielFeldHoehe = 0..HOEHE+1;
spielFeldBreite = 0..BREITE+1;

var
spielFeld : array [spielFeldHoehe, spielFeldBreite] of boolean;
spielZuege : integer;
anzahlLebendedeElementeMatrix : integer;
lebendenElemente : integer;
i, j : integer;             //Zaehlvariablen
k, l : integer;//Zaehlvariablen fuer 3x3 Matrix
zufallsZahl1 : integer;
zufallsZahl2 : integer;

//Bildschirm aktuallisieren
procedure bildschirmAktuallisieren;//(xKor, yKor : Integer);
begin
    //spielFeld[xKor, yKor] := true;
    ClrScr;
    for i := 1 to HOEHE do
        begin
            for j := 1 to BREITE do
                begin
                    if spielFeld[i,j] = true then
                        begin
                            write('0');
                        end
                    else
                        begin
                            write(' ')
                        end;
                end;
        writeln('');
        end;
end;

//Checkt Element auf 3x3 Matrix mit Nachbarn
procedure checkSpielfeld;
begin
    for i := 1 to HOEHE do
        begin
            for j := 1 to BREITE do
                begin
                    for k := 0 to 2 do
                        begin
                            for l := 0 to 2 do
                                begin
                                    if spielFeld[i-1+k, j-1+k] = true then
                                        begin
                                            anzahlLebendedeElementeMatrix := anzahlLebendedeElementeMatrix +1;
                                        end;
                                end;
                        end;

                        //Element am Leben
                        if spielFeld[i,j] = true then
                            begin
                                if anzahlLebendedeElementeMatrix > 3 then
                                    begin
                                        spielFeld[i,j] := false;
                                    end;
                                if anzahlLebendedeElementeMatrix <= 1 then
                                    begin
                                        spielFeld[i,j] := false;
                                    end;
                            end
                        
                        //Element nicht am Leben
                        else
                        begin
                            if anzahlLebendedeElementeMatrix = 3 then
                                begin
                                    spielFeld[i,j] := true;
                                end;
                        end;

                        //Zuruecksetzen der Zaehlvariable
                        anzahlLebendedeElementeMatrix := 0;    
                end;
        end;
    writeln('Prozedur gestartet');
    //Bildschirm wird aktualliesiert
    Delay(1000);
    bildschirmAktuallisieren;
end;

begin
    ClrScr;
    //Zur�cksetzen der Variablen
    anzahlLebendedeElementeMatrix := 0;
    
    writeln('');
    writeln('');
    writeln('Lade Spiel');
    for i := 0 to 50 do
        begin
            write('*');
            Delay(50);
        end;
    ClrScr;

    //Spielfeld initialisieren (alle auf false setzen)
    for i := 0 to HOEHE+1 do
        begin
            for j := 0 to BREITE+1 do
                begin
                    spielFeld[i,j] := false;
                end;               
        end;
    writeln('Fertig mit Array initialisieren');    
    //Startfeld erstellen
    //while Schleife
    i := 1;
    while i <= STARTELEMENTE do
        begin
            zufallsZahl1 := random(HOEHE);
            //writeln(zufallsZahl1);
            zufallsZahl2 := random(BREITE);
            //writeln(zufallsZahl2);
            //_______________________________________________________________
            {Pruefung, dass kein Element des Außenrings ueberschrieben wird -> Problem: kann nicht mit or alles vergleichen, weil 2 unterschiedliche Datentypen}
            if zufallsZahl1 = 0 then
                begin
                    writeln('Ein Schleifendurchgang wurde Aufgrund eines falschen Speichers uebersprungen');
                    continue;
                end;
            if zufallsZahl1 = HOEHE+1 then
                begin
                    writeln('Ein Schleifendurchgang wurde Aufgrund eines falschen Speichers uebersprungen');
                    continue;
                end;
            if zufallsZahl2 = 0 then
                begin
                    writeln('Ein Schleifendurchgang wurde Aufgrund eines falschen Speichers uebersprungen');
                    continue;
                end;
            if zufallsZahl2 = BREITE+1 then
                begin
                    writeln('Ein Schleifendurchgang wurde Aufgrund eines falschen Speichers uebersprungen');
                    continue;
                end;
            //______________________________________________________________
            if spielFeld[zufallsZahl1, zufallsZahl2] <> true then
                begin
                    spielFeld[zufallsZahl1, zufallsZahl2] := true;
                    i := i + 1;
                end;
        end;
    //readKey;

    //Ausgabe des Bildschirms
    for i := 1 to HOEHE do
        begin
            for j := 1 to BREITE do
                begin
                    if spielFeld[i,j] = true then
                        begin
                            write('0');
                        end
                    else
                        begin
                            write(' ')
                        end;
                end;
            writeln('');
        end;
    writeln('');
    writeln('Zum Starten eine Taste druecken');
    readKey;
    while true do
        begin
            checkSpielfeld;
        end;  
    end.