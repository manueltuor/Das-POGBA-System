function Filter_Name()
  global list1 fi Feld4 Name Age Club Positionsliste UID CA;
  % Die Eingabe in das Suchfeld wird eingelesen
    pattern=get(Feld4,'string');
    str = Name;
    contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
    % es wird geschaut welche Spielernamen die Eingabe beinhalten
    res = contains(str, pattern);
      % Die Suchliste wird mit den zutreffenden Spielern neu erstellt
      NameGefiltert=Name;
      NameGefiltert(find(res==0),:)=[];
      ClubGefiltert=Club;
      ClubGefiltert(find(res==0),:)=[];
      PositionGefiltert=Positionsliste;
      PositionGefiltert(find(res==0),:)=[];
      AlterGefiltert=Age;
      AlterGefiltert(find(res==0),:)=[];
      CAGefiltert=CA;
      CAGefiltert(find(res==0),:)=[];
      UIDGefiltert=UID;
      UIDGefiltert(find(res==0),:)=[];
   set(list1,'data',[NameGefiltert,num2cell(AlterGefiltert),ClubGefiltert,PositionGefiltert,num2cell(CAGefiltert),num2cell(UIDGefiltert)]);
   % Die Anzahl der Suchergebnisse wird auf einem Feld abgedruckt
   Feld6=uicontrol(fi,'units','normalized','position',[0.05 0.1 0.2 0.06],'style','text','string',sprintf('Ergebnisse: %g',length(NameGefiltert))); 
endfunction