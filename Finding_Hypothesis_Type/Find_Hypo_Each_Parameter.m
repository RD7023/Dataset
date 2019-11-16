ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A']; 

PC='ZBook'

path=['C:\Users\' PC '\Desktop\Dataset'];

powersArr = dir([path '\Finding_Hypothesis_Type\powers']);
epowersArr = dir([path '\Finding_Hypothesis_Type\epowers']);
lnpowersArr = dir([path '\Finding_Hypothesis_Type\lnpowers']);
sqrtpowersArr = dir([path '\Finding_Hypothesis_Type\sqrtpowers']);

type='Type_3(Basic+Price)';
numberType='3';


%Input Right VB_Code
VB_Code=[0 0 0 0 0]

awayPriceFlag=VB_Code(5)+3;
homePriceFlag=VB_Code(4)+3;
xgaSqrtFlag=VB_Code(3)+3;
xgaEFlag=VB_Code(2)+3;
xgaLnFlag=VB_Code(1)+3;




start_of_cycle = 3;
%%AverG
for pwi_AverG=start_of_cycle:length(powersArr),
 powers_AverG = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_AverG,1).name]);
 powers_AverG = struct2cell(powers_AverG)(1,1){1,1}';

for lni_AverG=start_of_cycle:length(lnpowersArr),
 lnpowers_AverG = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_AverG,1).name]);
 lnpowers_AverG = struct2cell(lnpowers_AverG)(1,1){1,1}';

for ei_AverG=start_of_cycle:length(epowersArr),
 epowers_AverG = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_AverG,1).name]);
 epowers_AverG = struct2cell(epowers_AverG)(1,1){1,1}';


for sqrti_AverG=start_of_cycle:length(sqrtpowersArr),
 sqrtpowers_AverG = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_AverG,1).name]);
 sqrtpowers_AverG = struct2cell(sqrtpowers_AverG)(1,1){1,1}';
 
 
%%AverXG
for pwi_AverXG=start_of_cycle:length(powersArr),
 powers_AverXG = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_AverXG,1).name]);
 powers_AverXG = struct2cell(powers_AverXG)(1,1){1,1}';


for lni_AverXG=start_of_cycle:length(lnpowersArr),
 lnpowers_AverXG = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_AverXG,1).name]);
 lnpowers_AverXG = struct2cell(lnpowers_AverXG)(1,1){1,1}';

for ei_AverXG=start_of_cycle:length(epowersArr),
 epowers_AverXG = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_AverXG,1).name]);
 epowers_AverXG = struct2cell(epowers_AverXG)(1,1){1,1}';



for sqrti_AverXG=start_of_cycle:length(sqrtpowersArr),
 sqrtpowers_AverXG = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_AverG,1).name]);
 sqrtpowers_AverXG = struct2cell(sqrtpowers_AverXG)(1,1){1,1}'; 
 
%%AverGA
for pwi_AverGA=start_of_cycle:length(powersArr),
 powers_AverGA = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_AverGA,1).name]);
 powers_AverGA = struct2cell(powers_AverGA)(1,1){1,1}';


for lni_AverGA=start_of_cycle:length(lnpowersArr),
 lnpowers_AverGA = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_AverGA,1).name]);
 lnpowers_AverGA = struct2cell(lnpowers_AverGA)(1,1){1,1}';

for ei_AverGA=start_of_cycle:length(epowersArr),
 epowers_AverGA = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_AverGA,1).name]);
 epowers_AverGA = struct2cell(epowers_AverGA)(1,1){1,1}';



for sqrti_AverGA=start_of_cycle:length(sqrtpowersArr),
 sqrtpowers_AverGA = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_AverGA,1).name]);
 sqrtpowers_AverGA = struct2cell(sqrtpowers_AverGA)(1,1){1,1}';  

%%AverXGA

for pwi_AverXGA=start_of_cycle:length(powersArr),
 powers_AverXGA = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_AverXGA,1).name]);
 powers_AverXGA = struct2cell(powers_AverXGA)(1,1){1,1}';

for lni_AverXGA=xgaLnFlag:xgaLnFlag,
 lnpowers_AverXGA = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_AverXGA,1).name]);
 lnpowers_AverXGA = struct2cell(lnpowers_AverXGA)(1,1){1,1}';  
   
for ei_AverXGA=xgaEFlag:xgaEFlag,
 epowers_AverXGA = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_AverXGA,1).name]);
 epowers_AverXGA = struct2cell(epowers_AverXGA)(1,1){1,1}';


for sqrti_AverXGA=xgaSqrtFlag:xgaSqrtFlag,
 sqrtpowers_AverXGA = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_AverXGA,1).name]);
 sqrtpowers_AverXGA = struct2cell(sqrtpowers_AverXGA)(1,1){1,1}';   
 

%PriceHome
for lni_PriceHome=3:3,
 lnpowers_PriceHome = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_PriceHome,1).name]);
 lnpowers_PriceHome = struct2cell(lnpowers_PriceHome)(1,1){1,1}';
 
for ei_PriceHome=3:3,
 epowers_PriceHome = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_PriceHome,1).name]);
 epowers_PriceHome = struct2cell(epowers_PriceHome)(1,1){1,1}';

for pwi_PriceHome=homePriceFlag:homePriceFlag,
 powers_PriceHome = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_PriceHome,1).name]);
 powers_PriceHome = struct2cell(powers_PriceHome)(1,1){1,1}';
 
for sqrti_PriceHome=3:3,
 sqrtpowers_PriceHome = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_PriceHome,1).name]);
 sqrtpowers_PriceHome = struct2cell(sqrtpowers_PriceHome)(1,1){1,1}';  
 

%%PriceAway
for lni_PriceAway=3:3,
 lnpowers_PriceAway = load([path '\Finding_Hypothesis_Type\lnpowers\' lnpowersArr(lni_PriceAway,1).name]);
 lnpowers_PriceAway = struct2cell(lnpowers_PriceAway)(1,1){1,1}';

for ei_PriceAway=3:3,
 epowers_PriceAway = load([path '\Finding_Hypothesis_Type\epowers\' epowersArr(ei_PriceAway,1).name]);
 epowers_PriceAway = struct2cell(epowers_PriceAway)(1,1){1,1}';

for pwi_PriceAway=awayPriceFlag:awayPriceFlag,
 powers_PriceAway = load([path '\Finding_Hypothesis_Type\powers\' powersArr(pwi_PriceAway,1).name]);
 powers_PriceAway = struct2cell(powers_PriceAway)(1,1){1,1}';
 
for sqrti_PriceAway=3:3,
 sqrtpowers_PriceAway = load([path '\Finding_Hypothesis_Type\sqrtpowers\' sqrtpowersArr(sqrti_PriceAway,1).name]);
 sqrtpowers_PriceAway = struct2cell(sqrtpowers_PriceAway)(1,1){1,1}';  
  
 
if length(sqrtpowers_AverG)+length(powers_AverG)+length(epowers_AverG)+length(lnpowers_AverG)+length(sqrtpowers_AverXG)+length(powers_AverXG)+length(epowers_AverXG)+length(lnpowers_AverXG)+length(sqrtpowers_AverGA)+length(powers_AverGA)+length(epowers_AverGA)+length(lnpowers_AverGA)+length(sqrtpowers_AverXGA)+length(powers_AverXGA)+length(epowers_AverXGA)+length(lnpowers_AverXGA)+length(sqrtpowers_PriceHome)+length(powers_PriceHome)+length(epowers_PriceHome)+length(lnpowers_PriceHome)+length(sqrtpowers_PriceAway)+length(powers_PriceAway)+length(epowers_PriceAway)+length(lnpowers_PriceAway)==0,
 continue
endif 
 
 
 
 
 
for cligas = 1:4,
  
seasons_before='4';
league = deblank(ligasArr(cligas,:));

years = '2018-2019';

%Get prices
Team_Price = fileread(['C:\Users\' PC '\Desktop\Dataset\' league '\' years '\teams_prices.txt']);
Team_PriceArr=strsplit(Team_Price,"\n");


way=['C:\Users\' PC '\Desktop\Dataset\' league '\' years '\Games_Data'];
wayHomeAway=['C:\Users\' PC '\Desktop\Dataset\' league '\' years];
wayDataSet=['C:\Users\' PC '\Desktop\Dataset\TrainingSets\' type '\' seasons_before 'seasons'];

HomeTrainingSet=['Home_' league '_' seasons_before 'seasons_Hist' numberType];
AwayTrainingSet=['Away_' league '_' seasons_before 'seasons_Hist' numberType];
%Get All Coefficients
AllCoefsCol = dlmread([wayHomeAway '\' "All_Coefs_Col" ".txt"],',',1,0);

%AllCoefsCol;
AllCoefsMatrix=[];
counterForMatrix=1;
row=[];
for i=1:size(AllCoefsCol,1),
  if counterForMatrix==1,
    row=[row AllCoefsCol(i,1)];
  endif
  if counterForMatrix==2,
    row=[row AllCoefsCol(i,1)];
  endif
  if counterForMatrix==3,
    row=[row AllCoefsCol(i,1)];
    counterForMatrix=0;
    AllCoefsMatrix=[row; AllCoefsMatrix];
    row=[];
  endif
  counterForMatrix=counterForMatrix+1;
endfor

%AllCoefsMatrix;

sum=0;
sumMult=1;
z=0;
AllCoefGames= fileread([wayHomeAway '\Teams_For_Cofs_Sync.txt']);
AllCoefGamesArr=strsplit(AllCoefGames,"\n");


size(AllCoefGamesArr,2);


AllGamesArr=flip(AllCoefGamesArr);

MatrixCoefOrdered=[];
GamesCofOrdered=[];








%Get Home hypothesis
dataHome = dlmread([wayDataSet '\' HomeTrainingSet ".txt"],',',1,0);
X_Home = dataHome(1:length(dataHome),1:6);
X_Home(1:length(dataHome),5:6)=X_Home(1:length(dataHome),5:6)/10;
y_Home =dataHome(1:length(dataHome),7);


X_Home = makeNotLinearForEachParameter (X_Home,powers_AverG,powers_AverXG,powers_AverGA,powers_AverXGA,powers_PriceHome,powers_PriceAway,epowers_AverG,epowers_AverXG,epowers_AverGA,epowers_AverXGA,epowers_PriceHome,epowers_PriceAway,lnpowers_AverG,lnpowers_AverXG,lnpowers_AverGA,lnpowers_AverXGA,lnpowers_PriceHome,lnpowers_PriceAway,sqrtpowers_AverG,sqrtpowers_AverXG,sqrtpowers_AverGA,sqrtpowers_AverXGA,sqrtpowers_PriceHome,sqrtpowers_PriceAway);

m_Home=length(y_Home);

X_Home=[ones(m_Home,1),X_Home];
theta_Home = zeros(7,1);

theta_Home = normalEqn(X_Home, y_Home);


%Get Away hypothesis
dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
X_Away = dataAway(1:length(dataAway),1:6);
X_Away(1:length(dataAway),5:6)=X_Away(1:length(dataAway),5:6)/10;
X_Away=makeNotLinearForEachParameter (X_Away,powers_AverG,powers_AverXG,powers_AverGA,powers_AverXGA,powers_PriceHome,powers_PriceAway,epowers_AverG,epowers_AverXG,epowers_AverGA,epowers_AverXGA,epowers_PriceHome,epowers_PriceAway,lnpowers_AverG,lnpowers_AverXG,lnpowers_AverGA,lnpowers_AverXGA,lnpowers_PriceHome,lnpowers_PriceAway,sqrtpowers_AverG,sqrtpowers_AverXG,sqrtpowers_AverGA,sqrtpowers_AverXGA,sqrtpowers_PriceHome,sqrtpowers_PriceAway);


y_Away = dataAway(1:length(dataAway),7);
m_Away=length(y_Away);

X_Away=[ones(m_Away,1),X_Away];
theta_Away = zeros(7,1);

theta_Away = normalEqn(X_Away, y_Away);



betsNumber=0;
correct2res=0;
correct1res=0;


firstmatch = 50;
lastmatch = size(AllGamesArr,2)-1;




for i=firstmatch:lastmatch,
  HomeAwayArr=strsplit(AllGamesArr{1,i}," - ");
  HomeTeam=transformTeamName(HomeAwayArr{1,1},league);
  AwayTeam=transformTeamName(HomeAwayArr{1,2},league);
  
  
  %Home Price  
    HomeTeamNamePrice = translateOrig2Price(HomeTeam,league);
    HomePrice=0;
    AwayPrice=0;
    
    %HomeTeam;
    %HomeTeamNamePrice;
    for j=1:size(Team_PriceArr,2),
      ArrTeamName=strsplit(Team_PriceArr{1,j},','){1,1};
      if strncmpi(HomeTeamNamePrice,ArrTeamName,size(HomeTeamNamePrice,2)-1),
        HomePrice=strsplit(Team_PriceArr{1,j},'"'){1,2};
        HomePrice=strsplit(HomePrice,' '){1,1};
      endif
    endfor
    HomePrice = strrep(HomePrice,",",".");
    HomePrice = str2num(HomePrice)/10;
  %Away Price 
    %AwayTeam ;
    AwayTeamNamePrice = translateOrig2Price(AwayTeam,league);
    for j=1:size(Team_PriceArr,2),
      ArrTeamName=strsplit(Team_PriceArr{1,j},','){1,1};
      if strncmpi(AwayTeamNamePrice,ArrTeamName,size(AwayTeamNamePrice,2)-1),
        AwayPrice=strsplit(Team_PriceArr{1,j},'"'){1,2};
        AwayPrice=strsplit(AwayPrice,' '){1,1};
      endif
    endfor
    AwayPrice = strrep(AwayPrice,",",".");
    AwayPrice = str2num(AwayPrice)/10;
 
 
%Home 
  HomeStat = dlmread([way '\' HomeTeam ".txt"],',',1,0);
  

  HomeAverG=0;
  HomeAverXG=0;

  HomeAverGA=0;
  HomeAverXGA=0;
  
  counterHome=0;
for j=1:i,
    if strcmp(transformTeamName(strsplit(AllGamesArr{1,j}," - "){1,1},league),HomeTeam),
      counterHome=counterHome+1;
    endif
    comp=strsplit(AllGamesArr{1,j}," - "){1,2};
    if strncmpi(transformTeamName(comp,league),HomeTeam,length(transformTeamName(comp,league))-1),
     counterHome=counterHome+1;
    endif
endfor
  
  if counterHome>4,
    denom=0;
   for z = (counterHome-4):(counterHome-1),
    gameStat=HomeStat(z,:);
    if(gameStat(5)==1)
      %"Home";
      denom=denom+1;
      HomeAverG=HomeAverG+gameStat(1)/(6-denom);
      HomeAverXG=HomeAverXG+gameStat(2)/(6-denom);
      
      HomeAverGA=HomeAverGA+gameStat(3)/(6-denom);
      HomeAverXGA=HomeAverXGA+gameStat(4)/(6-denom);
    endif 
    if(gameStat(5)==0)
      % "Away";
      denom=denom+1;
      HomeAverG=HomeAverG+gameStat(3)/(6-denom);
      HomeAverXG=HomeAverXG+gameStat(4)/(6-denom);
      
      HomeAverGA=HomeAverGA+gameStat(1)/(6-denom);
      HomeAverXGA=HomeAverXGA+gameStat(2)/(6-denom);
    endif
  endfor 
 
 endif 

 

  
AwayStat = dlmread([way '\' deblank(transformTeamName(AwayTeam,league)) ".txt"],',',1,0);


AwayAverG=0;
AwayAverXG=0;

AwayAverGA=0;
AwayAverXGA=0; 
counterAway=0; 

  for j=1:i,
    
    comp=strsplit(AllGamesArr{1,j}," - "){1,1};
    if strncmpi(transformTeamName(comp,league),AwayTeam,length(transformTeamName(comp,league))-1),
      counterAway=counterAway+1;
    endif
    comp=strsplit(AllGamesArr{1,j}," - "){1,2};
    if strncmpi(transformTeamName(comp,league),AwayTeam,length(transformTeamName(comp,league))-1),
     counterAway=counterAway+1;
    endif
  endfor

  
if counterAway>4,
  denom=0;
  for z = (counterAway-4):(counterAway-1),
    gameStat=AwayStat(z,:);
    if(gameStat(5)==1)
      %"Home";
      denom=denom+1;
      AwayAverG=AwayAverG+gameStat(1)/(6-denom);
      AwayAverXG=AwayAverXG+gameStat(2)/(6-denom);
      
      AwayAverGA=AwayAverGA+gameStat(3)/(6-denom);
      AwayAverXGA=AwayAverXGA+gameStat(4)/(6-denom);
    endif 
    if(gameStat(5)==0)
      %"Away";
      denom=denom+1;
      AwayAverG=AwayAverG+gameStat(3)/(6-denom);
      AwayAverXG=AwayAverXG+gameStat(4)/(6-denom);
      
      AwayAverGA=AwayAverGA+gameStat(1)/(6-denom);
      AwayAverXGA=AwayAverXGA+gameStat(2)/(6-denom);
    endif
  endfor 
 
 endif 



AwayExample = [AwayAverG AwayAverXG HomeAverGA HomeAverXGA HomePrice AwayPrice];
AwayExample = makeNotLinearForEachParameter (AwayExample,powers_AverG,powers_AverXG,powers_AverGA,powers_AverXGA,powers_PriceHome,powers_PriceAway,epowers_AverG,epowers_AverXG,epowers_AverGA,epowers_AverXGA,epowers_PriceHome,epowers_PriceAway,lnpowers_AverG,lnpowers_AverXG,lnpowers_AverGA,lnpowers_AverXGA,lnpowers_PriceHome,lnpowers_PriceAway,sqrtpowers_AverG,sqrtpowers_AverXG,sqrtpowers_AverGA,sqrtpowers_AverXGA,sqrtpowers_PriceHome,sqrtpowers_PriceAway);

HomeExample = [HomeAverG HomeAverXG AwayAverGA AwayAverXGA HomePrice AwayPrice];
HomeExample = makeNotLinearForEachParameter (HomeExample,powers_AverG,powers_AverXG,powers_AverGA,powers_AverXGA,powers_PriceHome,powers_PriceAway,epowers_AverG,epowers_AverXG,epowers_AverGA,epowers_AverXGA,epowers_PriceHome,epowers_PriceAway,lnpowers_AverG,lnpowers_AverXG,lnpowers_AverGA,lnpowers_AverXGA,lnpowers_PriceHome,lnpowers_PriceAway,sqrtpowers_AverG,sqrtpowers_AverXG,sqrtpowers_AverGA,sqrtpowers_AverXGA,sqrtpowers_PriceHome,sqrtpowers_PriceAway);
%Predict Home

goals_Home = [1 HomeExample]*theta_Home;
%Predict Away
goals_Away = [1 AwayExample]*theta_Away;



gameStat=AwayStat(counterAway,:);

minCof=1;
diffWin=0.5;
diffDraw=0.25;

if abs(goals_Home-goals_Away)<diffDraw&&AllCoefsMatrix(i,2)>minCof,
  
  betsNumber=betsNumber+1;
  if gameStat(1)==gameStat(3),
     sum=sum+AllCoefsMatrix(i,2);
  endif
else
  if abs(goals_Home-goals_Away)>diffWin&&goals_Home-goals_Away>0&&AllCoefsMatrix(i,1)>minCof,
   
    betsNumber=betsNumber+1;
    if gameStat(1)>gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
      sum=sum+AllCoefsMatrix(i,1);
    endif
 else

  if abs(goals_Home-goals_Away)>diffWin&&goals_Away-goals_Home>0&&AllCoefsMatrix(i,3)>minCof,
     betsNumber=betsNumber+1;
     if gameStat(1)<gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
      sum=sum+AllCoefsMatrix(i,3);
    endif
   endif
endif
endif

endfor



sum=sum-betsNumber;

resRow=['Liga: ' ligasArr(cligas,:) '; HomeAverG_powers: ' powersArr(pwi_AverG,1).name  '; HomeAverXG_powers: ' powersArr(pwi_AverXG,1).name  '; AwayAverGA_powers: ' powersArr(pwi_AverGA,1).name  '; AwayAverXGA_powers: ' powersArr(pwi_AverXGA,1).name  '; HomePrice_powers: ' powersArr( pwi_PriceHome,1).name  '; AwayPrice_powers: ' powersArr(pwi_PriceAway,1).name '; HomeAverG_epowers: ' epowersArr(ei_AverG,1).name  '; HomeAverXG_epowers: ' epowersArr(ei_AverXG,1).name  '; AwayAverGA_epowers: ' epowersArr(ei_AverGA,1).name  '; AwayAverXGA_epowers: ' epowersArr(ei_AverXGA,1).name  '; HomePrice_epowers: ' epowersArr(ei_PriceHome,1).name '; AwayPrice_epowers: ' epowersArr(ei_PriceAway,1).name '; HomeAverG_lnpowers: ' epowersArr(lni_AverG,1).name '; HomeAverXG_lnpowers: ' lnpowersArr(lni_AverXG,1).name  '; AwayAverGA_lnpowers: ' lnpowersArr(lni_AverGA,1).name  '; AwayAverXGA_lnpowers: ' lnpowersArr(lni_AverXGA,1).name  '; HomePrice_lnpowers: ' lnpowersArr(lni_PriceHome,1).name  '; AwayPrice_lnpowers: ' lnpowersArr(lni_PriceAway,1).name '; SUM: ' num2str(sum)]


fid = fopen (['C:\Users\' PC '\Desktop\Dataset\Finding_Hypothesis_Type\Results.txt'], "a");
      fdisp (fid, resRow);
fclose(fid);

endfor

endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor
endfor