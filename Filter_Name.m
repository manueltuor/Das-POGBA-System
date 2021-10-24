function Filter_Name()
  
  global fi Liste_Suche Feld_Name Name Age Club Positionsliste UID CA;
  % Die Eingabe in das Suchfeld wird eingelesen
    pattern=get(Feld_Name,'string');
    string=Name;
    contains=@(string, pattern) ~cellfun('isempty', strfind(string, pattern));
    % es wird geschaut welche Spielernamen die Eingabe beinhalten
    Treffer=contains(string, pattern);
      % Die Suchliste wird fuer die zutreffenden Spieler neu erstellt
      Name_Gefiltert=Name;
      Name_Gefiltert(find(Treffer==0),:)=[];
      Club_Gefiltert=Club;
      Club_Gefiltert(find(Treffer==0),:)=[];
      Position_Gefiltert=Positionsliste;
      Position_Gefiltert(find(Treffer==0),:)=[];
      Alter_Gefiltert=Age;
      Alter_Gefiltert(find(Treffer==0),:)=[];
      CA_Gefiltert=CA;
      CA_Gefiltert(find(Treffer==0),:)=[];
      UID_Gefiltert=UID;
      UID_Gefiltert(find(Treffer==0),:)=[];
   set(Liste_Suche,'data',[Name_Gefiltert,num2cell(Alter_Gefiltert),...
       Club_Gefiltert,Position_Gefiltert,num2cell(CA_Gefiltert),...
       num2cell(UID_Gefiltert)]);
   % Die Anzahl der Suchergebnisse wird auf einem Feld abgedruckt
   Feld_Suchergebnisse=uicontrol(fi,'units','normalized','position',...
                       [0.05 0.1 0.2 0.06],'style','text','string',...
                       sprintf('Ergebnisse: %g',length(Name_Gefiltert))); 
                       
endfunction