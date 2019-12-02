ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A']; 

PC='ZBook';

path='/home/dutkevych_t10/Desktop/Dataset';

powersArr = dir([path '/Finding_Hypothesis_Type/powers']);
epowersArr = dir([path '/Finding_Hypothesis_Type/epowers']);
lnpowersArr = dir([path '/Finding_Hypothesis_Type/lnpowers']);
sqrtpowersArr = dir([path '/Finding_Hypothesis_Type/sqrtpowers']);

type='Type_3(Basic+Price)';
numberType='3';


%Input Right VB_Code
VB_Code=[0 0 0 0 0]

PriceFlag=VB_Code(5)+3;






start_of_cycle = 3;
%%AverG
for pwi_AverG=start_of_cycle:length(powersArr),
 powers_AverG = load([path '/Finding_Hypothesis_Type/powers/' powersArr(pwi_AverG,1).name]);
 powers_AverG = struct2cell(powers_AverG)(1,1){1,1}';
 
 
 powers_AverGA = powers_AverG;
 

for lni_AverG=start_of_cycle:length(lnpowersArr),
 lnpowers_AverG = load([path '/Finding_Hypothesis_Type/lnpowers/' lnpowersArr(lni_AverG,1).name]);
 lnpowers_AverG = struct2cell(lnpowers_AverG)(1,1){1,1}';
 
 lnpowers_AverGA = lnpowers_AverG;

for ei_AverG=start_of_cycle:length(epowersArr),
 epowers_AverG = load([path '/Finding_Hypothesis_Type/epowers/' epowersArr(ei_AverG,1).name]);
 epowers_AverG = struct2cell(epowers_AverG)(1,1){1,1}';

 
 epowers_AverGA =epowers_AverG;

for sqrti_AverG=start_of_cycle:length(sqrtpowersArr),
 sqrtpowers_AverG = load([path '/Finding_Hypothesis_Type/sqrtpowers/' sqrtpowersArr(sqrti_AverG,1).name]);
 sqrtpowers_AverG = struct2cell(sqrtpowers_AverG)(1,1){1,1}';
 
 sqrtpowers_AverGA = sqrtpowers_AverG;
 
 if length(powers_AverG)+length(lnpowers_AverG)+length(epowers_AverG)+length(sqrtpowers_AverG)==0,
  continue
 endif
 
%%AverXG
for pwi_AverXG=start_of_cycle:length(powersArr),
 powers_AverXG = load([path '/Finding_Hypothesis_Type/powers/' powersArr(pwi_AverXG,1).name]);
 powers_AverXG = struct2cell(powers_AverXG)(1,1){1,1}';
  
 
 powers_AverXGA = powers_AverXG;

for lni_AverXG=start_of_cycle:length(lnpowersArr),
 lnpowers_AverXG = load([path '/Finding_Hypothesis_Type/lnpowers/' lnpowersArr(lni_AverXG,1).name]);
 lnpowers_AverXG = struct2cell(lnpowers_AverXG)(1,1){1,1}';

 
 lnpowers_AverXGA = lnpowers_AverXG; 
 
for ei_AverXG=start_of_cycle:length(epowersArr),
 epowers_AverXG = load([path '/Finding_Hypothesis_Type/epowers/' epowersArr(ei_AverXG,1).name]);
 epowers_AverXG = struct2cell(epowers_AverXG)(1,1){1,1}';
  
 
 epowers_AverXGA = epowers_AverXG;


for sqrti_AverXG=start_of_cycle:length(sqrtpowersArr),
 sqrtpowers_AverXG = load([path '/Finding_Hypothesis_Type/sqrtpowers/' sqrtpowersArr(sqrti_AverG,1).name]);
 sqrtpowers_AverXG = struct2cell(sqrtpowers_AverXG)(1,1){1,1}'; 
 

 sqrtpowers_AverXGA = sqrtpowers_AverXG;  

if length(powers_AverXG)+length(lnpowers_AverXG)+length(epowers_AverXG)+length(sqrtpowers_AverXG)==0,
  continue
  endif
 


%Price


for pwi_PriceHome=homePriceFlag:PriceFlag,
 powers_PriceHome = load([path '/Finding_Hypothesis_Type/powers/' powersArr(pwi_PriceHome,1).name]);
 powers_PriceHome = struct2cell(powers_PriceHome)(1,1){1,1}';
 

 powers_PriceAway = powers_PriceHome;
 
 epowers_PriceAway =[];
 epowers_PriceHome =[]; 
 
 sqrtpowers_PriceAway =[];
 sqrtpowers_PriceHome =[];
 
 lnpowers_PriceAway =[];
 lnpowers_PriceHome =[];



 
 
 
 
for cligas = 1:4,
  
  seasons_before='4';
  league = deblank(ligasArr(cligas,:));

  years = '2018-2019';

  %Get prices
  Team_Price = fileread([path '/' league '/' years '/priceOrigNames.txt']);
  Team_PriceArr=strsplit(Team_Price,"/n");


  way=[path '/' league '/' years '/Games_Data'];
  wayHomeAway=[path '/' league '/' years];
  wayDataSet=[path  '/TrainingSets/' type '/' seasons_before 'seasons'];

  HomeTrainingSet=['Home_' league '_' seasons_before 'seasons_Hist' numberType];
  AwayTrainingSet=['Away_' league '_' seasons_before 'seasons_Hist' numberType];
  %Get All Coefficients
  AllCoefsCol = dlmread([wayHomeAway '/' "All_Coefs_Col" ".txt"],',',1,0);

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
  AllCoefGames= fileread([wayHomeAway '/cofsOrigNames2.txt']);
  AllCoefGamesArr=strsplit(AllCoefGames,"/n");


  size(AllCoefGamesArr,2);


  AllGamesArr=flip(AllCoefGamesArr);

  MatrixCoefOrdered=[];
  GamesCofOrdered=[];








  %Get Home hypothesis
  dataHome = dlmread([wayDataSet '/' HomeTrainingSet ".txt"],',',1,0);
  X_Home = dataHome(1:length(dataHome),1:6);
  X_Home(1:length(dataHome),5:6)=X_Home(1:length(dataHome),5:6)/10;
  y_Home =dataHome(1:length(dataHome),7);


  X_Home = makeNotLinearForEachParameter (X_Home,powers_AverG,powers_AverXG,powers_AverGA,powers_AverXGA,powers_PriceHome,powers_PriceAway,epowers_AverG,epowers_AverXG,epowers_AverGA,epowers_AverXGA,epowers_PriceHome,epowers_PriceAway,lnpowers_AverG,lnpowers_AverXG,lnpowers_AverGA,lnpowers_AverXGA,lnpowers_PriceHome,lnpowers_PriceAway,sqrtpowers_AverG,sqrtpowers_AverXG,sqrtpowers_AverGA,sqrtpowers_AverXGA,sqrtpowers_PriceHome,sqrtpowers_PriceAway);

  m_Home=length(y_Home);

  X_Home=[ones(m_Home,1),X_Home];
  theta_Home = zeros(7,1);

  theta_Home = normalEqn(X_Home, y_Home);


  %Get Away hypothesis
  dataAway = dlmread([wayDataSet '/' AwayTrainingSet ".txt"],',',1,0);
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
    HomeTeam=HomeAwayArr{1,1};
    AwayTeam=HomeAwayArr{1,2};
    
    
    %Home Price  
      HomeTeamNamePrice = HomeTeam;
      HomePrice=0;
      AwayPrice=0;
      HomeTeamNamePrice;
      %HomeTeam;
      %HomeTeamNamePrice;
      for j=1:size(Team_PriceArr,2),
        ArrTeamName=strsplit(Team_PriceArr{1,j},','){1,1};
        HomeTeamNamePrice;
        ArrTeamName;
        if strncmpi(HomeTeamNamePrice,ArrTeamName,size(HomeTeamNamePrice,2)-1),
          HomePrice=strsplit(Team_PriceArr{1,j},'"'){1,2};
          HomePrice=strsplit(HomePrice,' '){1,1};
        endif
      endfor
      HomePrice;
      HomePrice = strrep(HomePrice,",",".");
      HomePrice = str2num(HomePrice)/10;
      
    %Away Price 
      %AwayTeam ;
      AwayTeamNamePrice = AwayTeam;
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
    HomeStat = dlmread([way '/' HomeTeam ".txt"],',',1,0);
    

    HomeAverG=0;
    HomeAverXG=0;

    HomeAverGA=0;
    HomeAverXGA=0;
    
    counterHome=0;
  for j=1:i,
      if strcmp(strsplit(AllGamesArr{1,j}," - "){1,1},HomeTeam),
        counterHome=counterHome+1;
      endif
      comp=strsplit(AllGamesArr{1,j}," - "){1,2};
      
      if strncmpi(comp,HomeTeam,length(comp)-1),
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

   

    
  AwayStat = dlmread([way '/' deblank(AwayTeam) ".txt"],',',1,0);


  AwayAverG=0;
  AwayAverXG=0;

  AwayAverGA=0;
  AwayAverXGA=0; 
  counterAway=0; 

    for j=1:i,
      
      comp=strsplit(AllGamesArr{1,j}," - "){1,1};
      if strncmpi(comp,AwayTeam,length(comp)-1),
        counterAway=counterAway+1;
      endif
      comp=strsplit(AllGamesArr{1,j}," - "){1,2};
      if strncmpi(comp,AwayTeam,length(comp)-1),
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

  resRow=['Liga: ' ligasArr(cligas,:) '; AverG_powers: ' powersArr(pwi_AverG,1).name  '; AverXG_powers: ' powersArr(pwi_AverXG,1).name 'Price_powers: ' powersArr( pwi_PriceHome,1).name '; AverG_epowers: ' epowersArr(ei_AverG,1).name  '; AverXG_epowers: ' epowersArr(ei_AverXG,1).name '; AverG_lnpowers: ' epowersArr(lni_AverG,1).name '; AverXG_lnpowers: ' lnpowersArr(lni_AverXG,1).name  'AverG_sqrtpowers' sqrtpowersArr(sqrti_AverG,1).name '; AverXG_sqrtpowers: ' sqrtpowersArr(sqrti_AverXG,1).name    '; SUM: ' num2str(sum)]




  fid = fopen ([path  '/Finding_Hypothesis_Type/Results.txt'], "a");
        fdisp (fid, resRow);
  fclose(fid);

  if sum>60,
    
    fid = fopen ([path '/Finding_Hypothesis_Type/best.txt'], "a");
          fdisp (fid, resRow);
    fclose(fid)
    
  endif
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


