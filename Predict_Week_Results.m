powers=[1];
epowers=[];
lnpowers=[];


%powers=[1;3;4;5]';
%epowers=[1;2]';
%lnpowers=[]';




seasons_before='4';
league = 'Bundesliga';
type='Type_3(Basic+Price)';
numberType='3';

years = '2018-2019';

way=['C:\Users\ZBook\Desktop\Dataset\' league '\' years '\Games_Data'];
wayHomeAway=['C:\Users\ZBook\Desktop\Dataset\' league '\' years];
wayDataSet=['C:\Users\ZBook\Desktop\Dataset\TrainingSets\' type '\' seasons_before 'seasons'];

HomeTrainingSet=['Home_' league '_' seasons_before 'seasons_Hist' numberType];
AwayTrainingSet=['Away_' league '_' seasons_before 'seasons_Hist' numberType];


%Get prices
Team_Price = fileread(['C:\Users\ZBook\Desktop\Dataset\' league '\' years '\teams_prices.txt']);
Team_PriceArr=strsplit(Team_Price,"\n");




%Get All Coefficients
AllCoefsCol = dlmread([wayHomeAway '\' "All_Coefs_Col" ".txt"],',',1,0);

AllCoefsCol;
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
    row=[row AllCoefsCol(i,1)]
    counterForMatrix=0;
    AllCoefsMatrix=[row; AllCoefsMatrix];
    row=[];
  endif
  counterForMatrix=counterForMatrix+1;
endfor

AllCoefsMatrix;

correctDrawBets=0;
drawBets=0;
correctWinBetsHome=0;
winBetsHome=0;
correctWinBetsAway=0;
winBetsAway=0;
win=0
sum=0;
sumMult=1;
z=0;
AllCoefGames= fileread([wayHomeAway '\Teams_For_Cofs_Sync.txt']);
AllCoefGamesArr=strsplit(AllCoefGames,"\n");

AllCoefGamesArr
%AllGames = fileread([wayHomeAway '\HomeAwayGames.txt']);
%AllGamesArr=strsplit(AllGames,"\n");
%AllGamesArr
size(AllCoefGamesArr,2)


AllGamesArr=flip(AllCoefGamesArr)






MatrixCoefOrdered=[]
GamesCofOrdered=[];



%for i=2:size(AllCoefGamesArr,2),
  %HomeInit=strsplit(AllGamesArr{1,i},","){1,1};
  %AwayInit=strsplit(AllGamesArr{1,i},","){1,2};
  %for j=2:size(AllCoefGamesArr,2),
  %HomeCof=transformTeamName(strsplit(AllCoefGamesArr{1,j}," - "){1,1})
 % AwayCof=transformTeamName(strsplit(AllCoefGamesArr{1,j}," - "){1,2})
 % if strncmp(HomeCof,HomeInit,size(HomeCof,2)-1) && strncmp(AwayCof,AwayInit,size(AwayCof,2)-1),
    %MatrixCoefOrdered=[MatrixCoefOrdered;AllCoefsMatrix(j-1,:)]
   % instance=[HomeCof ',' AwayCof];
  %  GamesCofOrdered=[GamesCofOrdered; instance]
 % endif 
  
 %endfor
%endfor

%fflush (stdout);
%Home1 = input("Enter 1st game this week HomeTeam: ","s");
%fflush (stdout);
%Away1 = input("Enter 1st game this week AwayTeam: ","s");
%fflush (stdout);
%Home2 = input("Enter last game this week HomeTeam: ","s");
%fflush (stdout);
%Away2 = input("Enter last game this week AwayTeam: ","s");






%Get Home hypothesis
dataHome = dlmread([wayDataSet '\' HomeTrainingSet ".txt"],',',1,0);
X_Home = dataHome(1:length(dataHome),1:6);
X_Home
X_Home(1:length(dataHome),5:6)=X_Home(1:length(dataHome),5:6)/10;
X_Home
y_Home =dataHome(1:length(dataHome),7);


X_Home = makeNotLinear(X_Home,powers,epowers,lnpowers)

m_X=length(y_Home)

X_Home=[ones(m_X,1),X_Home]
theta_Home = zeros(7,1);

theta_Home = normalEqn(X_Home, y_Home)


%Get Away hypothesis
dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
X_Away = dataAway(1:length(dataAway),1:6)
X_Away(1:length(dataAway),5:6)=X_Away(1:length(dataAway),5:6)/10;

X_Away=makeNotLinear(X_Away,powers,epowers,lnpowers)


y_Away = dataAway(1:length(dataAway),7)
m_Y=length(y_Away)

X_Away=[ones(m_Y,1),X_Away]
theta_Away = zeros(7,1);

theta_Away = normalEqn(X_Away, y_Away)


firstmatch=0;
lastmatch=0;

betsNumber=0;
correct2res=0;
correct1res=0;
%{
for i=1: size(AllGamesArr,2)-1,
  if size(AllGamesArr{1,i},2)>0,
     HomeAwayArr=strsplit(AllGamesArr{1,i}," - ");
     HomeTeam=HomeAwayArr{1,1};
     AwayTeam=HomeAwayArr{1,2};
     match=[transformTeamName(HomeTeam) " - " transformTeamName(AwayTeam)]
    if strncmpi(match,[Home1 ' - ' Away1],size([Home1 ' - ' Away1],2)-1),
      firstmatch=i;
    endif
   
    if strncmpi(match,[Home2 ' - ' Away2],size([Home2 ' - ' Away2],2)-1),
      lastmatch=i;
    endif
  endif
endfor
%}


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
  
  HomeTeam;
  HomeTeamNamePrice;
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
  AwayTeam ;
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
  HomeStat;

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
  counterHome;
  if counterHome>4,
    denom=0;
   for z = (counterHome-4):(counterHome-1),
    gameStat=HomeStat(z,:);
    if(gameStat(5)==1)
      "Home";
      denom=denom+1;
      HomeAverG=HomeAverG+gameStat(1)/(6-denom);
      HomeAverXG=HomeAverXG+gameStat(2)/(6-denom);
      
      HomeAverGA=HomeAverGA+gameStat(3)/(6-denom);
      HomeAverXGA=HomeAverXGA+gameStat(4)/(6-denom);
    endif 
    if(gameStat(5)==0)
      "Away";
      denom=denom+1;
      HomeAverG=HomeAverG+gameStat(3)/(6-denom);
      HomeAverXG=HomeAverXG+gameStat(4)/(6-denom);
      
      HomeAverGA=HomeAverGA+gameStat(1)/(6-denom);
      HomeAverXGA=HomeAverXGA+gameStat(2)/(6-denom);
    endif
  endfor 
 
 endif 

 

  
AwayStat = dlmread([way '\' deblank(transformTeamName(AwayTeam,league)) ".txt"],',',1,0);
AwayStat;

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
counterAway;
if counterAway>4,
  denom=0;
  for z = (counterAway-4):(counterAway-1),
    gameStat=AwayStat(z,:);
    if(gameStat(5)==1)
      "Home";
      denom=denom+1;
      AwayAverG=AwayAverG+gameStat(1)/(6-denom);
      AwayAverXG=AwayAverXG+gameStat(2)/(6-denom);
      
      AwayAverGA=AwayAverGA+gameStat(3)/(6-denom);
      AwayAverXGA=AwayAverXGA+gameStat(4)/(6-denom);
    endif 
    if(gameStat(5)==0)
      "Away";
      denom=denom+1;
      AwayAverG=AwayAverG+gameStat(3)/(6-denom);
      AwayAverXG=AwayAverXG+gameStat(4)/(6-denom);
      
      AwayAverGA=AwayAverGA+gameStat(1)/(6-denom);
      AwayAverXGA=AwayAverXGA+gameStat(2)/(6-denom);
    endif
  endfor 
 
 endif 



AwayExample = [AwayAverG AwayAverXG HomeAverGA HomeAverXGA HomePrice AwayPrice];
AwayExample = makeNotLinear(AwayExample,powers,epowers,lnpowers);

HomeExample = [HomeAverG HomeAverXG AwayAverGA AwayAverXGA HomePrice AwayPrice];
HomeExample = makeNotLinear(HomeExample,powers,epowers,lnpowers);
%Predict Home

goals_Home = [1 HomeExample]*theta_Home;
%Predict Away
goals_Away = [1 AwayExample]*theta_Away;

HomeExample;
AwayExample;

gameStat=AwayStat(counterAway,:);

minCof=1;
diffWin=0.5;
diffDraw=0.25;


if abs(goals_Home-goals_Away)<diffDraw&&AllCoefsMatrix(i,2)>minCof,
  betsNumber=betsNumber+1
  drawBets=drawBets+1;
  [HomeTeam  '-'  AwayTeam]
  [goals_Home  goals_Away]
  if gameStat(1)==gameStat(3),
     "CORRECT DRAW"
     tempmax=0;
     correct1res=correct1res+1;
     AllCoefsMatrix(i,2);
     sum=sum+AllCoefsMatrix(i,2)
     correctDrawBets=correctDrawBets+1;
     sum-betsNumber
  endif
  "DRAW";
endif
  if abs(goals_Home-goals_Away)>diffWin&&goals_Home-goals_Away>0&&AllCoefsMatrix(i,1)>minCof,
    betsNumber=betsNumber+1
    winBetsHome=winBetsHome+1;
    [HomeTeam  '-'  AwayTeam]
    [goals_Home  goals_Away]
    ["WIN " HomeTeam " or DRAW"];
    if gameStat(1)>=gameStat(3),
      "CORRECT DRAW OR";
      correct2res=correct2res+1;
      
    endif
    if gameStat(1)>gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
      "CORRECT WIN"
      tempmax=0;
      correct1res=correct1res+1;
      AllCoefsMatrix(i,1)
      sum=sum+AllCoefsMatrix(i,1)
      correctWinBetsHome=correctWinBetsHome+1;
      sum-betsNumber
    endif
  endif
  if  abs(goals_Home-goals_Away)>diffWin&&goals_Away-goals_Home>0&&AllCoefsMatrix(i,3)>minCof,
    betsNumber=betsNumber+1
    winBetsAway=winBetsAway+1
    [HomeTeam  '-'  AwayTeam];
    [goals_Home  goals_Away];
    ["WIN " AwayTeam " or DRAW"];
     if gameStat(1)<=gameStat(3),
       "CORRECT DRAW OR";
      correct2res=correct2res+1;
     endif
     if gameStat(1)<gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
      "CORRECT WIN"
      tempmax=0;
      correct1res=correct1res+1;
      AllCoefsMatrix(i,3)
      sum=sum+AllCoefsMatrix(i,3)
      correctWinBetsAway=correctWinBetsAway+1;
      sum-betsNumber
    endif
  endif

"__________ "
"__________ "
endfor


correctDrawBets
drawBets
correctWinBetsHome
winBetsHome
correctWinBetsAway
winBetsAway
betsNumber
sum=sum-betsNumber
