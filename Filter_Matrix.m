function [Vergleichsspieler_Zwischenresultate]=Filter_Matrix(Matrix)
% in dieser Funktion wird �berpr�ft, �ber welche Vergleichsspieler gen�gend
% Daten vorhanden sind
  global Spielerliste Originalspieler Input_data;
  
  Matrix_gefiltert=[];
  Zahl=1;
  Zahl_0=1;
  % die 50 "�hnlichsten" Spieler mit gen�gend Daten werden in die Matrix_gefiltert
  % Variabel abgespeichert 
  while (size(Matrix_gefiltert))(1) < 50
    % die Vergleichsspieler werden auf das Vorhandensein von Daten �berpr�ft,
    % je h�her der SI, desto eher werden sie �berpr�ft
    w=Matrix(Zahl,:);
      % sind keine Daten �ber einen Vergleichsspieler im n�chsten Jahr vorhanden,
      % so wird dieser nicht abgespeichert
      if isempty(find(Spielerliste(:,1)==w(1) & Spielerliste(:,5)==(w(2)+1)));
      
      % sollte dies nicht der Fall sein, werden seine Daten in der Matrix_gefiltert
      % Variabel abgespeichert
      else
        % wird ein Spieler abgespeichert wird die Zahl_0 um 1 erh�ht
        Matrix_gefiltert(Zahl_0,:)=w;
        Zahl_0+=1;
      endif
      % Nach jedem Durchlauf wird die Zahl1 um 1 erh�ht
      Zahl+=1;
  endwhile
  
  % sobald die 50 �hnlichsten Spieler mit vorhandenen Daten aussortiert sind,
  % werden ihre Daten aus dem n�chsten Jahr extrahiert
  for Zahl_1=1:50
    v=Matrix_gefiltert(Zahl_1,:);
    % die Vergleichsspieler nach einem Jahr werden identifiziert
    Stelle=find(Spielerliste(:,1)==v(1) & Spielerliste(:,5)==(v(2)+1));
    % sollten doppelte Datens�tze vorhanden sein, wird stets der erste genommen
    if isscalar(Stelle)
   
    else
      Stelle=Stelle(1);
    endif
    % ihre Daten werden abgespeichert
    Daten_Vergleichsspieler=Spielerliste(Stelle,:);
    for Zahl_2=6:53
      % die Werte aller Attribute werden extrahiert und die Attributwerte
      % werden bereits vorl�ufig mit dem SI multipliziert
      Vergleichsspieler_Zwischenresultate(Zahl_1,(Zahl_2-2))=...
      Daten_Vergleichsspieler(Zahl_2)*v(3);
    endfor
  endfor
  % ist die evolution�re Vorhersage ausgew�hlt m�ssen zus�tzlich auch die
  % Spielerdaten im gleichen Jahr extrahiert werden
  if strcmp(Input_data(6),'EVO')
    for Zahl_3=1:50
      v=Matrix_gefiltert(Zahl_3,:);
      Stelle=find(Spielerliste(:,1)==v(1) & Spielerliste(:,5)==v(2));
      if isscalar(Stelle)
     
      else
        Stelle=Stelle(1);
      endif
      Daten_Vergleichsspieler_Vorjahr=Spielerliste(Stelle,:);
      for Zahl_4=6:53
        Vergleichsspieler_Zwischenresultate_Vorjahr(Zahl_3,(Zahl_4-2))=...
        Daten_Vergleichsspieler_Vorjahr(Zahl_4)*v(3);
      endfor
    endfor
    % von den Zwischenresultaten nach einem Jahr werden nun die Zwischenresultaten
    % aus dem Vorjahr abgez�hlt
    Vergleichsspieler_Zwischenresultate-=Vergleichsspieler_Zwischenresultate_Vorjahr;
  else
    
  endif
  Vergleichsspieler_Zwischenresultate(:,1:3)=Matrix_gefiltert;
  Vergleichsspieler_Zwischenresultate(:,2)+=1;
endfunction