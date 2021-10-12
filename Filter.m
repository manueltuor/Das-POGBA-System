function SLgefiltert=Filter
  % In dieser Funktion werden die Spieler gefiltert, da es zu lange gehen würde
  % um den SI für alle Spieler zu berechnen
  global Spielerliste Positionsliste Name Club Text6 Text7 Text8 Text9 Text10 Text11...
         Feld7 Feld8 Feld9 Feld10 Feld11 Feld11_b Feld11_c Knopf3 fi SLgefiltert...
         SLgefiltert1 SLgefiltert2;
  % Die Eingabe wird eingelesen
  AlterMin=str2num(get(Feld7,'string'));
  AlterMax=str2num(get(Feld8,'string'));
  CAMin=str2num(get(Feld9,'string'));
  CAMax=str2num(get(Feld10,'string'));
  Positionszahl_1=get(Feld11,'value');
  Position_1=char(get(Feld11,'string')(Positionszahl_1));
  Positionszahl_2=get(Feld11_b,'value');
  Position_2=char(get(Feld11_b,'string')(Positionszahl_2));
  Positionszahl_3=get(Feld11_c,'value');
  Position_3=char(get(Feld11_c,'string')(Positionszahl_3));
  % alle optionalen Positionen werden auf eine Variable eingespeichert
  Position={Position_1,Position_2,Position_3};
  % Die Eingaben, die auf optional gelassen werden, werden entfernt
  Position(strcmp(Position,'optional'))=[];
  % sollten zwei Positionen gleich sein, wird eine gelöscht
  Vergleichspositionen=unique(Position,'stable');
  Position_Zwischenergebnis={};
  
  for Zahl=1:length(Vergleichspositionen)
    % für jede ausgewählte Position werden alle Positionsbezeichnungen 
    % ausgewählt, welche diese Position abdecken
    Position=char(Vergleichspositionen(Zahl));
    if strcmp('GK',Position)
      erweiterte_Position={'GK'};
    elseif strcmp('D (C)',Position)
      erweiterte_Position={'D (C)','D (RC)','D (LC)','D (RLC)'};
    elseif strcmp('D (R)',Position)
      erweiterte_Position={'D (R)','D (RC)','D (RL)','D (RLC)'};
    elseif strcmp('D (L)',Position)
      erweiterte_Position={'D (L)','D (LC)','D (RL)','D (RLC)'};
    elseif strcmp('WB (R)',Position)
      erweiterte_Position={'WB (R)','WB (RL)'};
    elseif strcmp('WB (L)',Position)
      erweiterte_Position={'WB (L)','WB (RL)'};
    elseif strcmp('DM',Position)
      erweiterte_Position={'DM'};
    elseif strcmp('M (C)',Position)
      erweiterte_Position={'M (C)','M (LRC)','M (LC)','M (RC)'};
    elseif strcmp('M (R)',Position)
      erweiterte_Position={'M (R)','M (RC)','M (RL)','M (RLC)'};
    elseif strcmp('M (L)',Position)
      erweiterte_Position={'M (L)','M (LC)','M (RL)','M (RLC)'};
    elseif strcmp('AM (C)',Position)
      erweiterte_Position={'AM (C)','AM (RC)','AM (LC)','AM (LRC)'};
    elseif strcmp('AM (R)',Position)
      erweiterte_Position={'AM (R)','AM (RC)','AM (LR)','AM (LRC)'};
    elseif strcmp('AM (L)',Position)
      erweiterte_Position={'AM (L)','AM (LC)','AM (LR)','AM (LRC)'};
    elseif strcmp('ST',Position)
      erweiterte_Position={'ST'};
    endif
    % alle Positionen werden in einer Variabel abgespeichert
    Position_Zwischenergebnis(length(Position_Zwischenergebnis)+1:length...
    (Position_Zwischenergebnis)+length(erweiterte_Position))=erweiterte_Position;
  endfor
  % die Duplikate werden wieder gelöscht
  Position=unique(Position_Zwischenergebnis,'stable');
  
  Zahl=length(Position);
  % Alle Spieler, welche diese Position spielern können werden in
  % SLgefiltert1 abgespeichert
  if Zahl==1
    str = Positionsliste;
    pattern= Position{1};
    contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
    res = contains(str, pattern);
    SLgefiltert1=Spielerliste;
    SLgefiltert1(find(res==0),:)=[];
  else
    for Zaehler=1:Zahl
      str = Positionsliste;
      pattern= Position{Zaehler};
      contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
      res(:,Zaehler) = contains(str, pattern);
    endfor
      SLgefiltert1=Spielerliste;
      SLgefiltert1(find(all(res==0,2)),:)=[];
  endif
  % es wird noch ueberprueft, dass keine gegensätzlichen Eingaben vorliegen
  if CAMax>=CAMin && AlterMax>=AlterMin
    Spielerwertungsliste=SLgefiltert1(:,6);
    % die Spieler mit der gleichen Position werden noch nach dem CA 
    % (current ability) gefiltert, der eingegeben wurde
    SLgefiltert2=SLgefiltert1(find(Spielerwertungsliste>=CAMin & Spielerwertungsliste<=CAMax),:);
    Spieleraltersliste=SLgefiltert2(:,5);
    % zum Schluss werden die gefilterten Spieler noch nach dem Alter sortiert
    SLgefiltert3=SLgefiltert2(find(Spieleraltersliste>=AlterMin & Spieleraltersliste<=AlterMax),:);
    % Die letzte Filterung ist dann die abschliessend gefilterte Liste SLgefiltert
    SLgefiltert=SLgefiltert3;
  
    Laenge=length(SLgefiltert);
    % sobald die Spieler gefiltert wurde, wird die Anzahl Vergleichsspieler auf
    % dem Eingabeformular abgedruckt
    Text12=uicontrol(fi,'units','normalized','style','text','string',sprintf('Ergebnisse: %g',Laenge),...
          'position',[0.8 0.25 0.075 0.03]);
  else
          
  endif
endfunction