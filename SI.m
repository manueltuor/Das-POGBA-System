function [Vergleichsspieler_SI]=SI(v)
  global Spielerliste Positionszahl SLgefiltert Gewichtung Stelle;
  % in dieser Funktion wird die Ähnlichkeit aller gefilterten Vergleichsspieler
  % mit dem Auswahlspieler berechnet
  Laenge=length(SLgefiltert);
  for Zaehler=1:Laenge
    w=SLgefiltert(Zaehler,:);
    % für alle Vergleichsspieler wird für jedes Attribut die Abweichung
    % berechnet und je nach Auswahl gewichtet
    cor=(abs(v(9)-w(9)))*Gewichtung(1,Positionszahl);
    cro=(abs(v(10)-w(10)))*Gewichtung(2,Positionszahl);
    dri=(abs(v(11)-w(11)))*Gewichtung(3,Positionszahl);
    fin=(abs(v(12)-w(12)))*Gewichtung(4,Positionszahl);
    fir=(abs(v(13)-w(13)))*Gewichtung(5,Positionszahl);
    fre=(abs(v(14)-w(14)))*Gewichtung(6,Positionszahl);
    hea=(abs(v(15)-w(15)))*Gewichtung(7,Positionszahl);
    loS=(abs(v(16)-w(16)))*Gewichtung(8,Positionszahl);
    loT=(abs(v(17)-w(17)))*Gewichtung(9,Positionszahl);
    mar=(abs(v(18)-w(18)))*Gewichtung(10,Positionszahl);
    pas=(abs(v(19)-w(19)))*Gewichtung(11,Positionszahl);
    pen=(abs(v(20)-w(20)))*Gewichtung(12,Positionszahl);
    tac=(abs(v(21)-w(21)))*Gewichtung(13,Positionszahl);
    tec=(abs(v(22)-w(22)))*Gewichtung(14,Positionszahl);
    agg=(abs(v(23)-w(23)))*Gewichtung(15,Positionszahl);
    ant=(abs(v(24)-w(24)))*Gewichtung(16,Positionszahl);
    bra=(abs(v(25)-w(25)))*Gewichtung(17,Positionszahl);
    coP=(abs(v(26)-w(26)))*Gewichtung(18,Positionszahl);
    con=(abs(v(27)-w(27)))*Gewichtung(19,Positionszahl);
    dec=(abs(v(29)-w(29)))*Gewichtung(20,Positionszahl);
    det=(abs(v(30)-w(30)))*Gewichtung(21,Positionszahl);
    fla=(abs(v(31)-w(31)))*Gewichtung(22,Positionszahl);
    lea=(abs(v(32)-w(32)))*Gewichtung(23,Positionszahl);
    off=(abs(v(33)-w(33)))*Gewichtung(24,Positionszahl);
    pos=(abs(v(34)-w(34)))*Gewichtung(25,Positionszahl);
    tea=(abs(v(35)-w(35)))*Gewichtung(26,Positionszahl);
    vis=(abs(v(28)-w(28)))*Gewichtung(27,Positionszahl);
    wor=(abs(v(36)-w(36)))*Gewichtung(28,Positionszahl);
    acc=(abs(v(37)-w(37)))*Gewichtung(29,Positionszahl);
    agi=(abs(v(38)-w(38)))*Gewichtung(30,Positionszahl);
    bal=(abs(v(39)-w(39)))*Gewichtung(31,Positionszahl);
    jum=(abs(v(40)-w(40)))*Gewichtung(32,Positionszahl);
    nat=(abs(v(41)-w(41)))*Gewichtung(33,Positionszahl);
    pac=(abs(v(42)-w(42)))*Gewichtung(34,Positionszahl);
    sta=(abs(v(43)-w(43)))*Gewichtung(35,Positionszahl);
    str=(abs(v(44)-w(44)))*Gewichtung(36,Positionszahl);
    aer=(abs(v(45)-w(45)))*Gewichtung(37,Positionszahl);
    coA=(abs(v(46)-w(46)))*Gewichtung(38,Positionszahl);
    kic=(abs(v(47)-w(47)))*Gewichtung(43,Positionszahl);
    one=(abs(v(48)-w(48)))*Gewichtung(44,Positionszahl);
    ref=(abs(v(49)-w(49)))*Gewichtung(47,Positionszahl);
    ecc=(abs(v(50)-w(50)))*Gewichtung(40,Positionszahl);
    rus=(abs(v(51)-w(51)))*Gewichtung(48,Positionszahl);
    pun=(abs(v(52)-w(52)))*Gewichtung(46,Positionszahl);
    thr=(abs(v(53)-w(53)))*Gewichtung(49,Positionszahl);
    SI=(((sum(Gewichtung(:,Positionszahl)))*20)-(cor+cro+dri+fin+fir+fre+hea+loS+loT+mar...
      +pas+pen+tac+tec+agg+ant+bra+coP+con+dec+det+fla+lea+off+pos+tea+vis+wor+acc...
      +agi+bal+jum+nat+pac+sta+str+aer+coA+kic+one+ref+ecc+rus+pun+thr))...
      /(((sum(Gewichtung(:,Positionszahl)))*20)/100);
      
    Vergleichsspieler_SI(Zaehler,1)=w(1);
    Vergleichsspieler_SI(Zaehler,2)=w(5);
    Vergleichsspieler_SI(Zaehler,3)=SI;
  endfor
endfunction