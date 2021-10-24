function SLgefiltert=Filter
  
  % In dieser Funktion werden die Spieler gefiltert, da es zu lange gehen wuerde
  % um den SI fuer alle Spieler zu berechnen
  global Spielerliste Positionsliste Name Club Feld_Alter_Min Feld_Alter_Max...
         Feld_CA_Min Feld_CA_Max Feld_Position_1 Feld_Position_2 Feld_Position_3...
         fi SL_gefiltert SL_gefiltert_1 CA_Min CA_Max Alter_Min Alter_Max...
         O_Positionen;
  % Die Eingabe wird eingelesen
  Alter_Min=str2num(get(Feld_Alter_Min,'string'));
  Alter_Max=str2num(get(Feld_Alter_Max,'string'));
  CA_Min=str2num(get(Feld_CA_Min,'string'));
  CA_Max=str2num(get(Feld_CA_Max,'string'));
  Positionszahl_1=get(Feld_Position_1,'value');
  Position_1=char(get(Feld_Position_1,'string')(Positionszahl_1));
  Positionszahl_2=get(Feld_Position_2,'value');
  Position_2=char(get(Feld_Position_2,'string')(Positionszahl_2));
  Positionszahl_3=get(Feld_Position_3,'value');
  Position_3=char(get(Feld_Position_3,'string')(Positionszahl_3));
  % alle optionalen Positionen werden auf eine Variable eingespeichert
  Position={Position_1,Position_2,Position_3};
  % Die Eingaben, die auf optional gelassen werden, werden entfernt
  Position(strcmp(Position,'optional'))=[];
  % sollten zwei Positionen gleich sein, wird eine geloescht
  Vergleichspositionen=unique(Position,'stable');
  O_Positionen=Vergleichspositionen;
  Position_Zwischenergebnis={};
  
  for Zahl=1:length(Vergleichspositionen)
    % fuer jede ausgewaehlte Position werden alle Positionsbezeichnungen 
    % ausgewaehlt, welche diese Position abdecken
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
  % die Duplikate werden wieder geloescht
  Position=unique(Position_Zwischenergebnis,'stable');
  
  Zahl=length(Position);
  % Alle Spieler, welche diese Position spielern koennen werden in
  % SLgefiltert1 abgespeichert
  if Zahl==1
    str = Positionsliste;
    pattern= Position{1};
    contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
    res = contains(str, pattern);
    SL_gefiltert_1=Spielerliste;
    SL_gefiltert_1(find(res==0),:)=[];
  else
    for Zaehler=1:Zahl
      str = Positionsliste;
      pattern= Position{Zaehler};
      contains = @(str, pattern) ~cellfun('isempty', strfind(str, pattern));
      res(:,Zaehler) = contains(str, pattern);
    endfor
      SL_gefiltert_1=Spielerliste;
      SL_gefiltert_1(find(all(res==0,2)),:)=[];
  endif
  % es wird noch ueberprueft, dass keine gegensaetzlichen Eingaben vorliegen
  if CA_Max>=CA_Min && Alter_Max>=Alter_Min
    Spielerwertungsliste=SL_gefiltert_1(:,6);
    % die Spieler mit der gleichen Position werden noch nach dem CA 
    % (current ability) gefiltert, der eingegeben wurde
    SL_gefiltert_2=SL_gefiltert_1(find(Spielerwertungsliste>=CA_Min & Spielerwertungsliste<=CA_Max),:);
    Spieleraltersliste=SL_gefiltert_2(:,5);
    % zum Schluss werden die gefilterten Spieler noch nach dem Alter sortiert
    SL_gefiltert_3=SL_gefiltert_2(find(Spieleraltersliste>=Alter_Min & Spieleraltersliste<=Alter_Max),:);
    % Die letzte Filterung ist dann die abschliessend gefilterte Liste SLgefiltert
    SL_gefiltert=SL_gefiltert_3;
  
    Laenge=length(SL_gefiltert);
    % sobald die Spieler gefiltert wurde, wird die Anzahl Vergleichsspieler auf
    % dem Eingabeformular abgedruckt
    Text_Vergleichsspielerergebnisse=uicontrol(fi,'units','normalized','style',...
                                     'text','string',sprintf('Ergebnisse: %g',Laenge),...
                                     'position',[0.8 0.25 0.075 0.03]);
  else
          
  endif
  
endfunction