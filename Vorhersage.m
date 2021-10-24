function Vorhersage
  
  % Einspeicherung der globalen Variablen
  global AW RAW Spielerliste Name SLgefiltert Gewichtung Stelle Positionszahl...
         Ergebnisse Originalspieler fi Vergleichsspieler_SI Knopf_Beenden;
  % die Eingabeformular Funktion erstellt das Eingabeformular
  % sobald 'Berechnen' gedrueckt wird, werden die eingegebenen Daten ueber die
  % Dateninput Funktion eingelesen und als Input abgespeichert
  Input=Eingabeformular;
  % das Eingabeformular kann nun geschlossen werden
  clf;
  % je nach Auswahl wird die Gewichtung festgelegt
  if char(Input(5))=='POS'
    Gewichtung=AW;
  else
    Gewichtung=RAW;
  endif
  % Die Daten zum ausgewaehlten Spieler werden abgespeichert
  Positionszahl=Input{4};
  Alter=str2num(Input{2});
  UID=str2num(Input{1});
  Stelle=find(Spielerliste(:,1)==UID & Spielerliste(:,5)==Alter);
  % Sollte der Spieler zwei Profile im gleichen Alter haben (kommt selten
  % vor) wird das erste gewaehlt
  if isscalar(Stelle)
    
  else
    Stelle=Stelle(1);
  endif
  % Die Attribute des ausgewaehlten Spielers werden nun in v abgespeichert
  v=Spielerliste(Stelle,:);
  % der SI der Vergleichsspieler wird mit der SI Funktion berechnet
  Vergleichsspieler_SI=SI(v);
  % die Vergleichsspieler werden nach SI sortiert
  Zwischenergebnis=sortrows(Vergleichsspieler_SI,3);
  % danach wird das Zwischenergebnis gewendet und die 100 "aehnlichsten" Spieler
  % werden in die Matrix Variabel abgespeichert
  Matrix=flipud(Zwischenergebnis(end-99:end,:));
  % der aehnlichste Spieler ist stets der Originalspieler, dieser wird in eine
  % separate Variabel abgespeichert und aus der Matrix entfernt
  Originalspieler=Matrix(1,:);
  Matrix(1,:)=[];
  % die Spieler mit den erforderlichen Daten werden rausgefiltert und in eine
  % Variabel abgespeichert
  Vergleichsspieler_Zwischenresultate=Filter_Vergleichsspieler(Matrix);
  % in der Ergebnis Funktion werden die finalen Vorhersagewerte kalkuliert und
  % Teile des Ergebnis GUI's erstellt
  Ergebnisse=Ergebnis(Vergleichsspieler_Zwischenresultate);
  Daten=Ergebnisse;
  Barchart(Daten);
  % die Funktion wird pausiert bis entweder der Beenden oder Neustart Knopf
  % gedrueckt wird
  waitfor(Knopf_Beenden,'value');
  % wird einer dieser Knoepfe geedrueckt wird das Ergebnis GUI geschlossen  
  close all;
  
endfunction