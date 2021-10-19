function Neustart
  
  % Programm wird neu gestartet
  global Knopf_Beenden;
  set(Knopf_Beenden,'value',1);
  Prediction;
  
endfunction