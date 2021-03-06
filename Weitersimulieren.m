function Weitersimulieren
  
  % in dieser Funktion wird die Karriere des Spielers um ein weiteres Jahr
  % simuliert, in dieser Funktion sind ausserdem viele Codezeilen aus anderen 
  % Funktionen reinkopiert worden
  global Name Club Positionsliste CA UID Stelle fi Ergebnisse SL_gefiltert_1... 
         SL_gefiltert Spielerliste Liste_Vergleichsspieler Originalspieler...
         Input_data Vergleichsspieler_SI;
  
  Daten=[];
  % das Alter des Originalspielers wird um 1 erhoeht
  Ergebnisse(2,1)=Ergebnisse(2,1)+1;
  % Das Format der Ergebnisse Matrix wird veraendert
  Daten(1:3,:)=Ergebnisse(1:3,:);
  Daten(4:5,:)=zeros;
  Daten(6:53,:)=Ergebnisse(4:51,:);
  % Als Alter wird das erhoehte Alter des Originalspielers definiert
  Alter=Daten(2,1);
  % wurde die Option neue Vergleichsspieler ausgewaehlt, muss der SI
  % neu berechnet werden
  if strcmp(Input_data(7),'neu')
    % die Matrix mit den Vergleichsspielern nach Position kann uebernommen werden
    Spieleraltersliste=SL_gefiltert_1(:,5);
    % nun werden die Spieler rausgefiltert, die das neue Alter haben
    SL_gefiltert=SL_gefiltert_1(find(Spieleraltersliste==Alter),:);
    % die vorhergesagten Werte aus dem letzten Jahr fungieren nun als Werte des
    % Originalspielers, mit denen wird der neue SI der Vergleichsspieler berechnet 
    v=Daten(:,end);
    Vergleichsspieler_SI=SI(v);
  else
    % bleiben die Vergleichsspieler gleich, wird einfach ihr Alter +1 gerechnet
    Vergleichsspieler_SI(:,2)+=1;
  endif
  % die Vergleichsspieler werden wieder nach SI sortiert
  Zwischenergebnis=sortrows(Vergleichsspieler_SI,3);
  % die Variable Laenge wird als Anzahl der Vergleichsspieler definiert
  Laenge=size(Zwischenergebnis)(1);
  % ist diese ueber 99 wird sie als 99 definiert
  if Laenge > 99
    Laenge=99;
  else
    
  endif
  % als Matrix werden die ersten (maximal 99) Vergleichsspieler eingespeichert
  Matrix=flipud(Zwischenergebnis(end-Laenge:end,:));
  % wenn der Originalspieler unter den Vergleichsspielern ist, wird er entfernt
  if isempty(find(Matrix(:,1)==Ergebnisse(1,1)))
    
  else
    Matrix(find(Matrix(:,1)==Ergebnisse(1,1)),:)=[];
  endif
  % wurde die neue Vergleichsspieler Option ausgewaehlt, werden die Spieler gefiltert
  if strcmp(Input_data(7),'neu')
    Vergleichsspieler_Zwischenresultate=Filter_Vergleichsspieler(Matrix);
  % wenn die gleiche Vergleichsspieler Option ausgewaehlt wurde, sind ein Paar
  % Schritte anders
  else
    Matrix_gefiltert=[];
    Zahl_3=1;
    Zahl_2=1;
    % wurde die absolute Vorhersage ausgewaehlt muss nur ueberprueft werden ob im
    % naechsten Jahr Daten ueber die Vergleichsspieler vorhanden sind
    if strcmp(Input_data(6),'ABS')
      for Zahl_3=1:50
        w=Matrix(Zahl_3,:);
        if isempty(find(Spielerliste(:,1)==w(1) & Spielerliste(:,5)==(w(2)+1)));
          
        else
          Matrix_gefiltert(Zahl_2,:)=w;
          Zahl_2+=1;
        endif
        Zahl_3+=1;
      endfor
    else
    % wurde die evolutionaere Vorhersage ausgewaehlt muessen im naechsten und im
    % gleichen Jahr Daten vorhanden sein
      for Zahl_3=1:50
        w=Matrix(Zahl_3,:);
        if isempty(find(Spielerliste(:,1)==w(1) & Spielerliste(:,5)==(w(2)+1)))||...
           isempty(find(Spielerliste(:,1)==w(1) & Spielerliste(:,5)==w(2)));
          
        else
          Matrix_gefiltert(Zahl_2,:)=w;
          Zahl_2+=1;
        endif
        Zahl_3+=1;
      endfor
    endif
    % sobald die Vergleichsspieler mit ausreichenden Daten aussortiert wurden,
    % werden die Daten der Vergleichsspieler extrahiert 
    for Zahl_0=1:size(Matrix_gefiltert)(1)
      v=Matrix_gefiltert(Zahl_0,:);
      Stelle=find(Spielerliste(:,1)==v(1) & Spielerliste(:,5)==(v(2)+1));
      if isscalar(Stelle)
     
      else
        Stelle=Stelle(1);
      endif
      Daten_Vergleichsspieler=Spielerliste(Stelle,:);
      for Zahl_1=6:53
        Vergleichsspieler_Zwischenresultate(Zahl_0,(Zahl_1-2))=...
        Daten_Vergleichsspieler(Zahl_1)*v(3);
      endfor
    endfor
  % wurde die evolutionaere Vorhersage ausgewaehlt muessen noch die Daten vom
  % Vorjahr extrahiert werden
  if strcmp(Input_data(6),'EVO')
    for Zahl_4=1:size(Matrix_gefiltert)(1)
      v=Matrix_gefiltert(Zahl_4,:);
      Stelle=find(Spielerliste(:,1)==v(1) & Spielerliste(:,5)==v(2));
      if isscalar(Stelle)
     
      else
        Stelle=Stelle(1);
      endif
      Daten_Vergleichsspieler_Vorjahr=Spielerliste(Stelle,:);
      for Zahl_5=6:53
        Vergleichsspieler_Zwischenresultate_Vorjahr(Zahl_4,(Zahl_5-2))=...
        Daten_Vergleichsspieler_Vorjahr(Zahl_5)*v(3);
      endfor
    endfor
    % Die Daten vom Vorjahr werden von den Daten von dem Jahr abgezogen
    Vergleichsspieler_Zwischenresultate-=Vergleichsspieler_Zwischenresultate_Vorjahr;
  else
    
  endif
    % UID, Alter und SI werden in die Zwischenresultate eingefuegt
    Vergleichsspieler_Zwischenresultate(:,1:3)=Matrix_gefiltert;
    % das Alter wird um 1 erhoeht
    Vergleichsspieler_Zwischenresultate(:,2)+=1;
  endif
  
  VZ=Vergleichsspieler_Zwischenresultate;
  Laenge=size(VZ)(1);
  % Die Infos der Vergleichsspieler werden neu abgespeichert
  for Zahl=1:Laenge;
    Stelle=find(Spielerliste(:,1)==VZ(Zahl,1) & Spielerliste(:,5)==VZ(Zahl,2));
    if isscalar(Stelle)
    
    else
      Stelle=Stelle(1);
    endif
    V_Name(Zahl,1)=Name(Stelle);
    V_Position(Zahl,1)=Positionsliste(Stelle);
    V_Club(Zahl,1)=Club(Stelle);
    V_CA(Zahl,1)=CA(Stelle);
    V_UID(Zahl,1)=UID(Stelle);
  endfor
  
  V_SI=VZ(:,3);
  % die Liste der Vergleichsspieler im Ergebnis GUI wird neu erstellt
  set(Liste_Vergleichsspieler,'data',[V_Name,num2cell(VZ(:,2)),V_Club,...
      V_Position,num2cell(V_CA),num2cell(V_SI),num2cell(V_UID)]);
  % die neuen Ratings werden berechnet
  for Zahl_1=1:51
    Predicted_Ratings(Zahl_1)=sum(VZ(:,Zahl_1))/sum(VZ(:,3));
  endfor
  % wurde die evolutionaere Vorhersage ausgewaehlt, muessen diese denen vom
  % Vorjahr angezaehlt werden
  if strcmp(Input_data(6),'EVO')
    Originalspieler_Ratings=Ergebnisse(:,end);
    Predicted_Ratings=flip(rot90(Predicted_Ratings));
    Predicted_Ratings(7:51)+=Originalspieler_Ratings(7:51);
    Predicted_Ratings(find(Predicted_Ratings(7:51)>20)+6)=20;
    Predicted_Ratings(find(Predicted_Ratings(7:51)<0)+6)=0;
  else
    
  endif
  Ergebnisse(:,end+1)=Predicted_Ratings;
  Daten=Ergebnisse;
  % das Balkendiagramm wird mit den kalkulierten Werten neu erstellt
  Barchart(Daten);
  
endfunction