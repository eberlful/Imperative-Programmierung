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
        eVListe, ringListe : tRefAnfang;
        min, max, eingabe : integer;

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

    {Ende dieser Liste zeigt wieder auf Anfang -> Ringliste}
    function ringListeErzeugen() : tRefAnfang;
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
        laufZeiger^.next := listenAnfang;
        ringListeErzeugen := listenAnfang;
    end;

    procedure ringListeAusgeben(inListenAnfang : tRefAnfang);
    {Gibt eine einfach verkettete Liste aus}

    var listenAnfang : tRefAnfang;
        listenEnde : Boolean;
        i : integer;

    begin
        i := 0;
        listenAnfang := inListenAnfang;
        listenEnde := false;
        while (i < 7) do
        begin
            i := i + 1;
            if inListenAnfang^.info = listenAnfang^.info then
            begin
                listenEnde := true;
            end;
            writeln(inListenAnfang^.info);
            inListenAnfang := inListenAnfang^.next;
        end;
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
        outMax := -maxint;
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

    {NK 2009 - Aufgabe 2}
    procedure LoescheErstesElement (var ioAnfang : tRefAnfang);
    {Löscht das erste Element aus der nicht leeren zyklischen Liste
    mit Anfangszeiger ioAnfang.}

    var letztesElement, aktuell,
        nachfolger, listenAnfang : tRefAnfang;

    begin
        if (ioAnfang^.next = nil) then
        begin
            dispose(ioAnfang);
            ioAnfang := nil;
        end
        else
        begin
            listenAnfang := ioAnfang;
            aktuell := ioAnfang;
            nachfolger := aktuell^.next;
            ioAnfang := nachfolger;
            while (nachfolger <> listenAnfang) do
            begin
                nachfolger := nachfolger^.next;
                aktuell := aktuell^.next;
            end;
            aktuell^.next := ioAnfang;
            dispose(listenAnfang);
        end;
    end;

    {NK 2009 - Aufgabe 4}
    procedure rueckwaertsAddieren (var ioAnfang : tRefAnfang);
    {Addiert rekursiv das vorherige Element zu dem vorvorherigen}

    var hilfszeiger : tRefAnfang;

    begin
        hilfszeiger := ioAnfang;
        if (ioAnfang^.next <> nil) then
        begin
            rueckwaertsAddieren(hilfszeiger);
            ioAnfang^.info := ioAnfang^.info + hilfszeiger^.info;
        end
        else
        begin
            
        end;
    end;

    procedure rueckwaertsAddieren2 (ioAnfang : tRefAnfang);
    {.....................................................}

    var hilfszeiger : tRefAnfang;

    begin
        if (ioAnfang^.next <> nil) then
        begin
            hilfszeiger := ioAnfang^.next;
            rueckwaertsAddieren2(hilfszeiger);
            ioAnfang^.info := ioAnfang^.info + hilfszeiger^.info;
        end;
    end;

    {HK 2010 - Aufgabe 1}
    procedure NachVorn (inWert : integer; var ioRefAnfang : tRefAnfang);
    {Sucht eine Liste nach inWert und setzt dieses Element an erster Position}

        var anfangsZeiger, prev, aktuell, inWertZeiger : tRefAnfang;
            gefunden : Boolean;
    begin
        gefunden := false;
        anfangsZeiger := ioRefAnfang;
        aktuell := ioRefAnfang;
        if aktuell^.info <> inWert then
        begin
            prev := aktuell;
            aktuell := aktuell^.next;
            while (aktuell <> nil) and (gefunden = false) do
            begin
                if aktuell^.info = inWert then
                begin
                    inWertZeiger := aktuell;
                    gefunden := true;
                    prev^.next := aktuell^.next;
                    inWertZeiger^.next := anfangsZeiger;
                    ioRefAnfang := inWertZeiger;
                end;
                if gefunden = false then
                begin
                    prev := aktuell;
                    aktuell := aktuell^.next;
                end;
                
            end;
        end;
    end;

    begin
        eVListe := einfachVerketteteListeErzeugen();
        einfachVerketteteListeAusgeben(eVListe);

        writeln('Geben sie ein Wert ein');
        readln(eingabe);
        NachVorn(eingabe, eVListe);
        einfachVerketteteListeAusgeben(eVListe);
    end.