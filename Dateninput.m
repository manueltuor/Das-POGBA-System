function Dateninput()
  global Feld1 Feld2 Feld3 Feld5 fi Input_data bg1 bg2 bg3 UID_O Alter_O;
    % hier werden alle Eingaben aus dem Eingabeformular eingelesen, diese
    % Funktion wird nur ausgelöst, wenn der Knopf 'Berechnen' gedrückt wird
    UID_O=get(Feld1,'string');
    Alter_O=get(Feld2,'string');
    Positionszahl=get(Feld3,'value');
    Position=char(get(Feld3,'string')(Positionszahl));
    SI_handle=get(bg3,'SelectedObject');
    SI=get(SI_handle,'String');
    Vorhersage_handle=get(bg2,'SelectedObject');
    Vorhersage=get(Vorhersage_handle,'String');
    Vergleich_handle=get(bg1,'SelectedObject');
    Vergleich=get(Vergleich_handle,'String');
    % die Daten werden in der Variable Input_data gespeichert und an die
    % Eingabeformular Funktion weitergegeben
    Input_data={UID_O,Alter_O,Position,Positionszahl,SI,Vorhersage,Vergleich};
    assignin('caller','Input',Input_data);
    % die Funktion kann nun fortgesetzt werden
    uiresume(fi);
endfunction