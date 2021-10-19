function PrepSI
  
  global Spielerliste Name AW RAW Positionsliste UID Club Age CA Matrix;
  load AW;
  load RAW;
  fid = fopen('Spielerdaten 16-20.csv', 'r');
  A = textscan(fid, '%f %s %s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter',',');
  fclose(fid);
  UID=A{1};
  Name=A{2};
  Positionsliste=A{3};
  Club=A{4};
  Age=A{5};
  CA=A{6};
  PA=A{7};
  Value=A{8};
  cor=A{9};
  cro=A{10};
  dri=A{11};
  fin=A{12};
  fir=A{13};
  fre=A{14};
  hea=A{15};
  loS=A{16};
  loT=A{17};
  mar=A{18};
  pas=A{19};
  pen=A{20};
  tac=A{21};
  tec=A{22};
  agg=A{23};
  ant=A{24};
  bra=A{25};
  coP=A{26};
  con=A{27};
  vis=A{28};
  dec=A{29};
  det=A{30};
  fla=A{31};
  lea=A{32};
  off=A{33};
  pos=A{34};
  tea=A{35};
  wor=A{36};
  acc=A{37};
  agi=A{38};
  bal=A{39};
  jum=A{40};
  nat=A{41};
  pac=A{42};
  sta=A{43};
  str=A{44};
  aer=A{45};
  coA=A{46};
  kic=A{47};
  one=A{48};
  ref=A{49};
  ecc=A{50};
  rus=A{51};
  pun=A{52};
  thr=A{53};
  Spielerliste=[UID,UID,UID,UID,Age,CA,PA,Value,cor,cro,dri,fin,fir,fre,hea,...
                loS,loT,mar,pas,pen,tac,tec,agg,ant,bra,coP,con,vis,dec,det,...
                fla,lea,off,pos,tea,wor,acc,agi,bal,jum,nat,pac,sta,str,aer,...
                coA,kic,one,ref,ecc,rus,pun,thr];
  Spielerliste(:,2:4)=zeros; 
  
endfunction  
  

