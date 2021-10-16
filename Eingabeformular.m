function Input_data=Eingabeformular 
    
    global Feld1 Feld2 Feld3 Feld4 Feld5 fi Input_data Name Age Club Positionsliste CA UID list1...
           Text6 Text7 Text8 Text9 Text10 Text11 Feld7 Feld8 Feld9 Feld10 Feld11...
           Feld11_b Feld11_c Knopf3 bg1 bg2 bg3;
    
    % eine figure mit dem Eingabeformular wird erstellt 
    fi=figure('name','Eingabeformular');
    
    Text1=uicontrol(fi,'units','normalized','style','text','string','Name:','position',[0.1 0.9 0.15 0.06]);
    % Liste mit Auswahlspielern
    list1=uitable(fi,'data',[Name(1:500),num2cell(Age(1:500)),Club(1:500),Positionsliste(1:500),...
      num2cell(CA(1:500)),num2cell(UID(1:500))],'columnformat',{[] 'long' [] [] 'long' 'long'},...
      'units','normalized','columnwidth',{160 40 120 120 40 70},'position',[0.1 0.25 0.35 0.6],...
      'columnname',{'Name','Alter','Club','Position','CA','UID'});
    Text2=uicontrol(fi,'units','normalized','style','text','string','UID:','position',[0.5 0.9 0.15 0.06]);
    Text3=uicontrol(fi,'units','normalized','style','text','string','Alter:','position',[0.5 0.8 0.15 0.06]);
    Text4=uicontrol(fi,'units','normalized','style','text','string','Position:','position',[0.5 0.7 0.15 0.06]);
    % Eingabefelder für den Vorhersagespieler
    Feld1=uicontrol(fi,'units','normalized','style','edit','position',[0.7 0.9 0.15 0.06]);
    Feld2=uicontrol(fi,'units','normalized','style','edit','position',[0.7 0.8 0.15 0.06]);
    Feld3=uicontrol(fi,'units','normalized','style','popupmenu','string',{'GK','D(RL)','D(C)',...
      'WB(RL)','DM','M(RL)','M(C)','AM(RL)','AM(C)','ST'},'position',[0.7 0.7 0.15 0.06]);
    Feld4=uicontrol(fi,'units','normalized','style','edit','position',[0.3 0.9 0.15 0.06]);
    % Knöpfe zum Berechnen und Filtern
    Knopf1=uicontrol(fi,'units','normalized','style','pushbutton','string','Berechnen','position',...
      [0.7 0.1 0.15 0.06],'callback', @Dateninput);
    % wenn der 'Suchen' Knopf gedrückt wird, werden die Spieler nach Eingabe gefiltert
    Knopf2=uicontrol(fi,'units','normalized','style','pushbutton','string','Suchen','position',...
      [0.3 0.1 0.15 0.06],'callback', @Filter_Name);
    % Pushbuttons um die Art der Vergleichsspielers, der SI-Berechnung und
    % die Gewichtung festzulegen
    bg1 = uibuttongroup(fi,'units','normalized','Position',[0.7 0.5 0.15 0.06],...
          'title',('Vergleichsspieler'));
    r1 = uicontrol(bg1,'Style','radiobutton','String','gleich','units','normalized',...
         'Position',[0.1 0.4 0.6 0.4],'HandleVisibility','off');
    r2 = uicontrol(bg1,'Style','radiobutton','String','neu','units','normalized',...
         'Position',[0.5 0.4 0.6 0.4],'HandleVisibility','off');   
    bg2 = uibuttongroup(fi,'units','normalized','Position',[0.5 0.5 0.15 0.06],...
          'title',('Vorhersage'));
    r3 = uicontrol(bg2,'Style','radiobutton','String','EVO','units','normalized',...
         'Position',[0.1 0.4 0.6 0.4],'HandleVisibility','off');
    r4 = uicontrol(bg2,'Style','radiobutton','String','ABS','units','normalized',...
         'Position',[0.5 0.4 0.6 0.4],'HandleVisibility','off');
    bg3 = uibuttongroup(fi,'units','normalized','Position',[0.7 0.6 0.15 0.06],...
          'title',('Gewichtung'));
    r5 = uicontrol(bg3,'Style','radiobutton','String','ABS','units','normalized',...
         'Position',[0.1 0.4 0.6 0.4],'HandleVisibility','off');
    r6 = uicontrol(bg3,'Style','radiobutton','String','POS','units','normalized',...
         'Position',[0.5 0.4 0.6 0.4],'HandleVisibility','off');
    Text5=uicontrol(fi,'units','normalized','style','text','string','Auswahl:','position',[0.5 0.6 0.15 0.06]);
    
    % Beschriftungen und Eingabefelder für den Filtrierbereich
    Text6=uicontrol(fi,'units','normalized','style','text','string','Filter','position',[0.5 0.45 0.075 0.03]);
    Text7=uicontrol(fi,'units','normalized','style','text','string','Alter min:','position',[0.5 0.4 0.075 0.03]);
    Feld7=uicontrol(fi,'units','normalized','style','edit','position',[0.6 0.4 0.075 0.03]);
    Text8=uicontrol(fi,'units','normalized','style','text','string','Alter max:','position',[0.7 0.4 0.075 0.03]);
    Feld8=uicontrol(fi,'units','normalized','style','edit','position',[0.8 0.4 0.075 0.03]);
    Text9=uicontrol(fi,'units','normalized','style','text','string','CA min:','position',[0.5 0.35 0.075 0.03]);
    Feld9=uicontrol(fi,'units','normalized','string','75','style','edit','position',[0.6 0.35 0.075 0.03]);
    Text10=uicontrol(fi,'units','normalized','style','text','string','CA max:','position',[0.7 0.35 0.075 0.03]);
    Feld10=uicontrol(fi,'units','normalized','string','200','style','edit','position',[0.8 0.35 0.075 0.03]);
    Text11=uicontrol(fi,'units','normalized','style','text','string','Positionen:','position',[0.5 0.3 0.075 0.03]);
    Feld11=uicontrol(fi,'units','normalized','style','popupmenu','position',[0.6 0.3 0.075 0.03],'string',{'GK',...
          'D (R)','D (C)','D (L)','WB (R)','WB (L)','DM','M (R)','M (C)','M (L)','AM (R)','AM (C)','AM (L)','ST'});
    Feld11_b=uicontrol(fi,'units','normalized','style','popupmenu','position',[0.7 0.3 0.075 0.03],'string',{'GK',...
          'D (R)','D (C)','D (L)','WB (R)','WB (L)','DM','M (R)','M (C)','M (L)','AM (R)','AM (C)','AM (L)','ST',...
          'optional'},'value',15);
    Feld11_c=uicontrol(fi,'units','normalized','style','popupmenu','position',[0.8 0.3 0.075 0.03],'string',{'GK',...
          'D (R)','D (C)','D (L)','WB (R)','WB (L)','DM','M (R)','M (C)','M (L)','AM (R)','AM (C)','AM (L)','ST',...
          'optional'},'value',15);
    % Knopf um Spielerliste zu Filtern
    Knopf3=uicontrol(fi,'units','normalized','style','pushbutton','string','Filtern','position',...
      [0.7 0.25 0.075 0.03],'callback', @Filter);
    % die Funktion wird pausiert und erst fortgesetzt, wenn der Knopf 'Berechnen'
    % gedrückt wird
    uiwait(fi);
endfunction
  
  
    