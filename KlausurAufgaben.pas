program KlausurAufaben (output);
{Programm erstellt alle Arten von Listen und Bäume um dann mit
diesen zu Arbeiten}

const MAXANZAHLARRAY = 5;       {Anzahl der Element in Array}
    MAXANZAHLLISTE = 5;         {Anzahl der Listenelemente für Zeigeraufgaben}

type
    {Typen für Arary}
    tIndex = 1..MAXANZAHLARRAY;
    tFeld = array [tIndex] of Integer;

    {Typen für einfach verkettete Listen}
    tRefAnfang = ^tListe;
    tListe = record
                info : integer;
                next : tRefAnfang;
            end;
    
    {Typen für doppelt verkettete Listen}
    tDVRefAnfang = ^tDVListe;
    tDVListe = record
                info : integer;
                prev, next : tDVRefAnfang;
            end;
    
    {Typen für binären Baum}
    tBaumAnfang = ^tBinBaum;
    tBinBaum = record
                info : integer;
                links, rechts : integer;
            end;

    {Typen für binären Baum mit verketteten Listen}
    tRefMultiBaumKn = ^tMultiBaumKn;
    tRefNachfListenElem = ^tNachfListenElement;
    tNachfListenElement = record
                            teilbaumWurzel : tRefMultiBaumKn;
                            next : tRefNachfListenElem;
                        end;
    tMultiBaumKn = record
                    info : integer;
                    nachfListe : tRefNachfListenElem;
                end;

    var feld : tFeld;
        eVListe : tRefAnfang;
        min, max : integer;

    function arrayErzeugen() : tFeld;
    {Erzeugt ein Feld von Array}

    var feldIntern : tFeld;

    begin
        Randomize;
        feldIntern[1] := Random(50);
        feldIntern[2] := Random(50);
        feldIntern[3] := Random(50);
        feldIntern[4] := Random(50);
        feldIntern[5] := Random(50);
        arrayErzeugen := feldIntern;
    end;

    function einfachVerketteteListeErzeugen() : tRefAnfang;
    {Erzeugt eine einfach verkettete Liste}
    var i : integer;
        laufZeiger, listenAnfang, neuElement : tRefAnfang;

    begin
        Randomize;
        new (neuElement);
        neuElement^.info := Random(50);
        listenAnfang := neuElement;
        laufZeiger := listenAnfang;
        for i := 2 to MAXANZAHLLISTE do
        begin
            new (neuElement);
            neuElement^.info := Random(50);
            laufZeiger^.next := neuElement;
            laufZeiger := laufZeiger^.next;
        end;
        einfachVerketteteListeErzeugen := listenAnfang;
    end;

    procedure einfachVerketteteListeAusgeben(inListenAnfang : tRefAnfang);
    {Gibt eine einfach verkettete Liste aus}

    begin
        while inListenAnfang <> nil do
        begin
            writeln(inListenAnfang^.info);
            inListenAnfang := inListenAnfang^.next;
        end;
    end;
    
    procedure arrayAusgeben(inArray : tFeld);
    {Gibt ein Array in der Konsole aus}

    var i : tIndex;

    begin
        for i := 1 to MAXANZAHLARRAY do
        begin
            writeln(inArray[i]);
        end;
    end;

    {NK 2009 - Aufgabe 1}
    procedure FeldMinMax(inFeld : tFeld; var outMin, outMax : integer);
    {Ausgabe: Max und Min im Feld}

    var i : tIndex;

    begin
        outMin := maxint;
        outMax := minint;
        for i := 1 to MAXANZAHLARRAY do
        begin
            if (outMax < inFeld[i]) then
            begin
                outMax := inFeld[i];
            end;
            if (outMin > inFeld[i]) then
            begin
                outMin := inFeld[i];
            end;
        end;
    end;

    begin
        writeln('Array Ausgabe:');
        feld := arrayErzeugen();
        FeldMinMax(feld,min, max);
        arrayAusgeben(feld);
        writeln('Einfach verkettete Liste Ausgabe:');
        eVListe := einfachVerketteteListeErzeugen();
        einfachVerketteteListeAusgeben(eVListe);
    end.