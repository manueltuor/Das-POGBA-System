function Evaluation
  
  global Spielerliste Ergebnisse fig UID_O Alter_O;
  
  uiresume(fig);
  
  UID=str2num(UID_O);
  Alter=str2num(Alter_O);
  Stelle1=find(Spielerliste(:,1)==UID & Spielerliste(:,5)==Alter+1);
  Stelle2=find(Spielerliste(:,1)==UID & Spielerliste(:,5)==Alter+2);
  Stelle3=find(Spielerliste(:,1)==UID & Spielerliste(:,5)==Alter+3);
  Stelle4=find(Spielerliste(:,1)==UID & Spielerliste(:,5)==Alter+4);
  
  Daten1=Spielerliste(Stelle1,:);
  Daten2=Spielerliste(Stelle2,:);
  Daten3=Spielerliste(Stelle3,:);
  Daten4=Spielerliste(Stelle4,:);
  
  Daten_Originalspieler=[Daten1;Daten2;Daten3;Daten4];
  Daten_Originalspieler=flip(rot90(Daten_Originalspieler(:,9:44))); 
  erg=Ergebnisse(7:42,2:5);
  
  for Zahl=1:4
    for Zahl2=1:36
    Abweichung(Zahl2)=(abs(erg(Zahl2,Zahl)-Daten_Originalspieler(Zahl2,Zahl))/Daten_Originalspieler(Zahl2,Zahl))*100;
    endfor
  gesamt_Abweichungen(Zahl,:)=Abweichung;
  endfor

  for Zahl3=1:4
    proz_Abweichungen(Zahl3,:)=sum(gesamt_Abweichungen(Zahl3,:))/36;
  endfor
  uicontrol('units','normalized','style','text','string',sprintf('%g\n%g\n%g\n%g',proz_Abweichungen(1),proz_Abweichungen(2),...
            proz_Abweichungen(3),proz_Abweichungen(4)),'position',[0.7 0.8 0.15 0.15]);
endfunction