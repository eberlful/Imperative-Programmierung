{$B+}
{$R+}
program gameOfLife (output);
{Erzeugt ein Spielfeld mit zufällig erzeugtem Spielfeld
*******************************************************
***                 0 = true                        ***
***                 1 = false                       ***
***                 9 = Rand                        ***
***                99 = Fehler                      ***
*******************************************************}

const
xSpielfeld = 50;
ySpielfeld = 50;

type
tSpielfeld = array [0..xSpielfeld, 0..ySpielfeld] of integer;
txSpielfeld = 0..xSpielfeld;
tySpielfeld = 0..ySpielfeld;

var
spielfeld, ersatzFeld : tSpielfeld;
fehler : ^boolean;

procedure aktMonitor(feld : tSpielfeld);
{Aktuallisiert am Monitor die Ausgabe der Änderungen des Spiels}
begin
    
end;

function erzeugeFeld():tSpielfeld;
{Zeugt erstmalig das Spielfeld mit Zufallswerten}
var
xSpielfeld : txSpielfeld;
ySpielfeld : tySpielfeld;
matrix : tSpielfeld;
i, j : integer;
begin
    Randomize;
    for i := 0 to xSpielfeld do
    begin
        for j := 0 to ySpielfeld do
        begin
            {Erzeugt Rand}
            if (i == 0) or (i == xSpielfeld) or (j == 0) or (j == ySpielfeld) then
            begin
                matrix[i,j] := 9;
            end
            else
            begin
                matrix[i,j] := random(2);
            end;
        end;
    end;
    erzeugeFeld := matrix;
end;

function werteSpielAus(matrix : tSpielfeld):tSpielfeld;

var
gameArray : tSpielfeld;
g, h, lifeCounter : integer;

begin
    gameArray := matrix;
    lifeCounter := 0;
    deathCounter := 0;
    for g := 1 to xSpielfeld-1 do
    begin
        for h := 1 to ySpielfeld-1 do
        begin
            {Setzen der Variablen}
            lifeCounter := 0;
            deathCounter := 0;

            {Auswertung des ersten Elements oben links}
            if (matrix[g-1, h-1]==9) or (matrix[g-1, h-1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auwertung des zweiten Elements in der ersten Zeile}
            if (matrix[g, h-1]==9) or (matrix[g, h-1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des dritten Elements in der ersten Zeile}
            if (matrix[g+1, h-1]==9) or (matrix[g, h+1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des ersten Elements in der zweiten Zeile}
            if (matrix[g-1, h]==9) or (matrix[g-1, h]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des zweiten Elements in der zweiten Zeile}
            if (matrix[g, h]==9) or (matrix[g, h]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des dritten Elements in der zweiten Zeile}
            if (matrix[g+1, h]==9) or (matrix[g+1, h]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des ersten Elements in der dritten Zeile}
            if (matrix[g-1, h+1]==9) or (matrix[g-1, h+1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des zweiten Elements in der dritten Zeile}
            if (matrix[g, h+1]==9) or (matrix[g, h+1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung des dritten Elements in der dritten Zeile}
            if (matrix[g+1, h+1]==9) or (matrix[g+1, h+1]==0) then
            begin
                deathCounter := deathCounter + 1;
            end
            else
            begin
                lifeCounter := lifeCounter + 1;
            end;

            {Auswertung der deathCounter und lifeCounter}
            if (deathCounter+lifeCounter <> 9) then
            begin
                writeln('****************************');
                writeln('Fehler bei der Auswertung!!!');
                writeln('****************************');
                gameArray[g, h] := 99; 
            end
            else
            begin
                {Tote Zelle}
                if (matrix[g, h] == 0) then
                begin
                    if (lifeCounter == 3) then
                    begin
                        gameArray[g, h] := 1;
                    end;
                end
                else
                begin
                    gameArray[g, h] := 0;
                end;

                {Lebende Zelle}
                if (matrix[g, h] == 1) then
                begin
                    if (lifeCounter<=1) then
                    begin
                        gameArray[g, h] := 0;
                    end
                    else
                    begin
                        if (lifeCounter <= 3) then
                        begin
                            gameArray[g, h] := 1;
                        end
                        else
                        begin
                            gameArray[g, h] := 0;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

begin
    
end;

begin
    {Erzeugen eines Feldes}
    spielfeld := erzeugeFeld();

    {stateFlage -> true = Spiel noch nicht zu Ende / false = Spiel zu Ende}
    while (stateFlag == true) do
    begin
        {Werte Spiel aus}
        ersatzFeld := werteSpielAus(spielfeld);
        stateFlag := compareGame(spielfeld, ersatzFeld);
        aktMonitor(ersatzFeld);
    end;

    
end.