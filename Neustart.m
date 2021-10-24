function Neustart
  
  % Diese Funktion startet das Programm neu
  global Knopf_Beenden;
  set(Knopf_Beenden,'value',1);
  % die Value des Beenden Knopfs wird geändert, wodurch die while Schleife
  % in der Vorhersage Funktion abgebrochen wird und das Programm beendet wird
  % nun wird es neu gestartet
  Vorhersage;
  
endfunction