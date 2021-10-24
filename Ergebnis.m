function [Ergebnisse]=Ergebnis(Vergleichsspieler_Zwischenresultate)
  
  global Name Club Positionsliste CA UID Spielerliste fi Originalspieler...
         Ergebnisse Liste_Vergleichsspieler Input_data CA_Min CA_Max Alter_Min...
         Alter_Max O_Positionen Knopf_Beenden;
  % Der Name der Vergleichsspieler_Zwischenresultate Variable wird abgekuerzt
  VZ=Vergleichsspieler_Zwischenresultate;
  % der Originalspieler wird identifiziert
  Stelle=find(Spielerliste(:,1)==Originalspieler(1) & Spielerliste(:,5)==...
  Originalspieler(2));
  % bei doppelten Datensaetzen wird stets der erste gewaehlt
  if isscalar(Stelle)
    
  else
    Stelle=Stelle(1);
  endif
  % alle Infos zum Originalspieler (Name, Club, Position etc...) werden
  % abgespeichert
  O_Name=cell2mat(Name(Stelle));
  O_Position=cell2mat(Positionsliste(Stelle));
  O_Club=cell2mat(Club(Stelle));
  O_CA=CA(Stelle);
  O_UID=UID(Stelle);
  % Attribute und Daten ueber den Originalspieler werden im richtigen Format
  % abgespeichert
  Originalspieler_Ratings(1:3)=Originalspieler;
  Vektor=Spielerliste(Stelle,6:53);
  Originalspieler_Ratings(4:51)=Vektor;
  % die vorhergesagten Werte fuer die Attribute werden als Vektor abgespeichert
  for Zahl_1=1:51
    % die Werte fuer jedes einzelne Attribut werden berechnet indem die Summe,
    % der mit dem SI multiplizierten Werte durch die Summe der SI's geteilt wird
    Predicted_Ratings(Zahl_1)=sum(VZ(:,Zahl_1))/sum(VZ(:,3));
  endfor
  % sollte die evolutionaere Vorhersage ausgewaehlt sein, muessen die berechneten
  % Entwicklungswerte mit den Werten des Originalspielers angerechnet werden
  if strcmp(Input_data(6),'EVO')
    Predicted_Ratings(7:51)+=Originalspieler_Ratings(7:51);
    % Werte die unter 0 oder ueber 20 sind werden als 0 bzw. 20 definiert
    Predicted_Ratings(find(Predicted_Ratings(7:51)>20)+6)=20;
    Predicted_Ratings(find(Predicted_Ratings(7:51)<0)+6)=0;
  else
    
  endif
  Predicted_Changes=Predicted_Ratings-Originalspieler_Ratings;
  % Die Originalspieler und vorhergesagten Ratings werden in eine Matrix 
  % abgespeichert und um 270 Grad gedreht
  Ergebnisse=flip([rot90(Originalspieler_Ratings),rot90(Predicted_Ratings)]);
  % nun werden die Infos zu den Vergleichsspielern abgespeichert
  for Zahl=1:50;
    % jeder Vergleichsspieler wird einzeln identifiziert
    Stelle=find(Spielerliste(:,1)==VZ(Zahl,1) & Spielerliste(:,5)==VZ(Zahl,2));
    % bei Duplikaten wird stets der erste gewaehlt
    if isscalar(Stelle)
    
    else
      Stelle=Stelle(1);
    endif
    % Alle relevanten Daten werden abgespeichert
    V_Name(Zahl,1)=Name(Stelle);
    V_Position(Zahl,1)=Positionsliste(Stelle);
    V_Club(Zahl,1)=Club(Stelle);
    V_CA(Zahl,1)=CA(Stelle);
    V_UID(Zahl,1)=UID(Stelle);
  endfor
  
  % der SI der Vergleichsspieler wird aus der VZ Variable extrahiert
  V_SI=VZ(:,3);
  % nun wird das Ergebnis GUI erstellt
  set(fi,'name','Ergebnis');
  % in einer Liste werden alle Infos zu den Vergleichsspielern angegeben
  Liste_Vergleichsspieler=uitable(fi,'data',[V_Name,num2cell(VZ(:,2)),V_Club,...
                          V_Position,num2cell(V_CA),num2cell(V_SI),...
                          num2cell(V_UID)],'columnformat',{[] 'long' [] []...
                          'long' 'short' 'long'},'units','normalized',...
                          'columnwidth',{180 50 100 120 50 80 80},'position',...
                          [0.1 0.65 0.375 0.3],'columnname',{'Name','Alter',...
                          'Club','Position','CA','SI','UID'});
  % Die Infos zum Originalspieler werden in einem Textfeld angegeben
  Text_Originalspieler=uicontrol(fi,'units','normalized','style','text',...
                       'string',sprintf('%s\n%s\n%s\n%g\n%g\n%10d',O_Name,...
                       O_Position,O_Club,O_CA,str2num(Input_data{2}),O_UID),...
                       'position',[0.5 0.8 0.15 0.15]);
  % Der String fuer O_Positionen wird je nach Laenge der Variable definiert
  if length(O_Positionen)==2
    O_Positionen=sprintf('%s,%s',O_Positionen{1},O_Positionen{2});
  elseif length(O_Positionen)==3
    O_Positionen=sprintf('%s,%s,%s',O_Positionen{1},O_Positionen{2},O_Positionen{3});
  else
    O_Positionen=sprintf('%s',O_Positionen{1});
  endif
  % Ein Textfeld mit allen ausgewaehlten Optionen zur Vorhersage wird erstellt
  Text_Auswahl=uicontrol('units','normalized','style','text','string',...
               sprintf('Vorhersage: %s-%s-%s\n Positionen: %s\n Alter: %g-%g\n CA: %g-%g',...
               Input_data{6},Input_data{5},Input_data{7},O_Positionen,Alter_Min,...
               Alter_Max,CA_Min,CA_Max),'position',[0.7 0.8 0.15 0.15]);
  % Es werden Knoepfe erstellt mit denen das Programm weitersimuliert, neugestartet,
  % oder beendet werden kann
  Knopf_Weitersimulieren=uicontrol(fi,'units','normalized','style','pushbutton',...
                         'string','Weitersimulieren','position',[0.5 0.75 ...
                         0.075 0.03],'callback', @Weitersimulieren);
  Knopf_Neustart=uicontrol(fi,'units','normalized','style','pushbutton',...
                 'string','Neustart','position',[0.6 0.75 0.075 0.03],...
                 'callback', @Neustart);
  Knopf_Beenden=uicontrol(fi,'units','normalized','style','pushbutton',...
                'string','Beenden','position',[0.7 0.75 0.075 0.03],...
                'callback', @Beenden);
endfunction 
  