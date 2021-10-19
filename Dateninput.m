function Dateninput()
  
  global Feld_UID Feld_Alter Feld_Position fi Input_data...
         Knoepfe_Vergleichsspieler Knoepfe_Vorhersage Knoepfe_SI...
         Knopf_Dateninput O_UID O_Alter;
         
    % hier werden alle Eingaben aus dem Eingabeformular eingelesen, diese
    % Funktion wird nur ausgelöst, wenn der Knopf 'Berechnen' gedrückt wird
    O_UID=get(Feld_UID,'string');
    O_Alter=get(Feld_Alter,'string');
    Positionszahl=get(Feld_Position,'value');
    Position=char(get(Feld_Position,'string')(Positionszahl));
    SI_handle=get(Knoepfe_SI,'SelectedObject');
    SI=get(SI_handle,'String');
    Vorhersage_handle=get(Knoepfe_Vorhersage,'SelectedObject');
    Vorhersage=get(Vorhersage_handle,'String');
    Vergleich_handle=get(Knoepfe_Vergleichsspieler,'SelectedObject');
    Vergleich=get(Vergleich_handle,'String');
    % die Daten werden in der Variable Input_data gespeichert und an die
    % Eingabeformular Funktion weitergegeben
    Input_data={O_UID,O_Alter,Position,Positionszahl,SI,Vorhersage,Vergleich};
    assignin('caller','Input',Input_data);
    % die Funktion kann nun fortgesetzt werden
    set(Knopf_Dateninput,'value',1);
    
endfunction