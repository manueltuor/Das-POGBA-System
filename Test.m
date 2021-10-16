function Test(Daten)
  
  global fig;
  % die Mittelpunkte der Balken werden definiert
  centers=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,...
           25,26,27,28,29,30,31,32,33,34,35,36];
  % als Höhe werden die kalkulierten Daten definiert
  counts=Daten(7:42,:);
  % die Position des Balkendiagramms innerhalb des GUI's wird definiert
  ax=axes(fig,'units','normalized','position',[0.1 0.1 0.8 0.5]);
  % das Diagramm wird erstellt
  b=bar(centers,counts);
  hold on
  % die Attributwerte werden je nach physisch, technisch oder mental gefärbt
  h=bar(counts(1:14,:));
  i=bar(centers(15:28),counts(15:28,:));
  j=bar(centers(29:36),counts(29:36,:));
  set(h,'facecolor','c');
  set(i,'facecolor','y');
  set(j,'facecolor','g');
  % die x- und y-Achse wird beschriftet
  xlabel(sprintf('\n\nAttribute'),'fontsize',16);
  ylabel(sprintf('vorhergesagte Entwicklung'),'fontsize',16);
  xticks([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,...
          25,26,27,28,29,30,31,32,33,34,35,36]);
  % die Attribute auf der x-Achse werden beschriftet und jedes zweite Attribut
  % wird nach unten geschoben, damit es keine Überlagerungen gibt
  xticklabels({'Corners';sprintf('\n\n\nCrossing');'Dribbling';sprintf('\n\n\nFinishing');...
          'First Touch';sprintf('\n\n\nFree Kick');'Heading';sprintf('\n\n\nLong Shot');...
          'Long Throw';sprintf('\n\n\nMarking');'Passing';sprintf('\n\n\nPenalty');...
          'Tackling';sprintf('\n\n\nTechnique');'Aggression';sprintf('\n\n\nAnticipation');...
          'Bravery';sprintf('\n\n\nComposure');'Concentration';sprintf('\n\n\nVision');...
          'Decisions';sprintf('\n\n\nDetermination');'Flair';sprintf('\n\n\nLeadership');...
          'Off Ball';sprintf('\n\n\nPositioning');'Teamwork';sprintf('\n\n\nWork Rate');...
          'Acceleration';sprintf('\n\n\nAgility');'Balance';sprintf('\n\n\nJumping Reach');...
          'Natural Fitness';sprintf('\n\n\nPace');'Stamina';sprintf('\n\n\nStrength')});
          
endfunction