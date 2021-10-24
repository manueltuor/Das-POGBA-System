function Beenden
  
  % diese Funktion beendet das Programm
  global Knopf_Beenden;
  % die Value des Beenden Knopfs wird geändert, wodurch die while Schleife
  % in der Vorhersage Funktion abgebrochen wird und das Programm beendet wird
  set(Knopf_Beenden,'value',1);
  
endfunction