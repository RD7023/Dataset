
numberVB = '123';

%function type
hypothesisType='p1345,ep13,lnp0';
powers=[1;3;4;5]';
epowers=[1;3]';
lnpowers=[]';



path='C:\Users\ZBook\Desktop\Dataset';
AllParameters=fileread([path '\Finding_Parameters_For_Hypothesis\p,e,l\' hypothesisType '\4 seasons\top_25_Parameters\VB_' numberVB '.txt']);
AllParametersArr = strsplit(AllParameters,"\n");


seasons_before='3';

years = '2017-2018';
ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A']; 



for k =1:size(AllParametersArr,2),
  result = AllParametersArr{1,k};
  resultElements = strsplit(result,";");
  minCof = str2num(strsplit(resultElements{1,2},"MinCof: "){1,2})
  diffDraw = str2num(strsplit(resultElements{1,3},"DiffDraw: "){1,2})
  diffWin = str2num(strsplit(resultElements{1,4},"DiffWin: "){1,2})
  
  
  for cligas=1:size(ligasArr,1),
  league = deblank(ligasArr(cligas,:));
  way=['C:\Users\ZBook\Desktop\Dataset\' league '\' years '\Games_Data'];
  wayHomeAway=['C:\Users\ZBook\Desktop\Dataset\' league '\' years];
  wayDataSet=['C:\Users\ZBook\Desktop\Dataset\TrainingSets\Type_2\' seasons_before 'seasons']

  HomeTrainingSet=['Home_' league '_' seasons_before 'seasons_Hist2'];
  AwayTrainingSet=['Away_' league '_' seasons_before 'seasons_Hist2'];
  
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
  sum=0;
  sumMult=1;
  z=0;
  AllCoefGames= fileread([wayHomeAway '\Teams_For_Cofs_Sync.txt']);
  AllCoefGamesArr=strsplit(AllCoefGames,"\n");

  AllCoefGamesArr;
  %AllGames = fileread([wayHomeAway '\HomeAwayGames.txt']);
  %AllGamesArr=strsplit(AllGames,"\n");
  %AllGamesArr
  size(AllCoefGamesArr,2);


  AllGamesArr=flip(AllCoefGamesArr);






  MatrixCoefOrdered=[];
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
  X_Home = dataHome(1:length(dataHome),1:4);
  y_Home =dataHome(1:length(dataHome),5);


  X_Home = makeNotLinear(X_Home,powers,epowers,lnpowers);

  m=length(y_Home);

  X_Home=[ones(m,1),X_Home];
  theta_Home = zeros(5,1);

  theta_Home = normalEqn(X_Home, y_Home);


  %Get Away hypothesis
  dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
  X_Away = dataAway(1:length(dataAway),1:4);

  X_Away=makeNotLinear(X_Away,powers,epowers,lnpowers);


  y_Away = dataAway(1:length(dataAway),5);


  X_Away=[ones(m,1),X_Away];
  theta_Away = zeros(5,1);

  theta_Away = normalEqn(X_Away, y_Away);


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
    HomeTeam=transformTeamName(HomeAwayArr{1,1});
    AwayTeam=transformTeamName(HomeAwayArr{1,2});
   
  %Home 
    HomeStat = dlmread([way '\' HomeTeam ".txt"],',',1,0);
    HomeStat;

    HomeAverG=0;
    HomeAverXG=0;

    HomeAverGA=0;
    HomeAverXGA=0;
    
    counterHome=0;
  for j=1:i,
      if strcmp(transformTeamName(strsplit(AllGamesArr{1,j}," - "){1,1}),HomeTeam),
        counterHome=counterHome+1;
      endif
      comp=strsplit(AllGamesArr{1,j}," - "){1,2};
      if strncmpi(transformTeamName(comp),HomeTeam,length(transformTeamName(comp))-1),
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

   

    
  AwayStat = dlmread([way '\' deblank(transformTeamName(AwayTeam)) ".txt"],',',1,0);
  AwayStat;

  AwayAverG=0;
  AwayAverXG=0;

  AwayAverGA=0;
  AwayAverXGA=0; 
  counterAway=0; 

    for j=1:i,
      
      comp=strsplit(AllGamesArr{1,j}," - "){1,1};
      if strncmpi(transformTeamName(comp),AwayTeam,length(transformTeamName(comp))-1),
        counterAway=counterAway+1;
      endif
      comp=strsplit(AllGamesArr{1,j}," - "){1,2};
      if strncmpi(transformTeamName(comp),AwayTeam,length(transformTeamName(comp))-1),
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



  AwayExample = [AwayAverG AwayAverXG HomeAverGA HomeAverXGA ];
  AwayExample = makeNotLinear(AwayExample,powers,epowers,lnpowers);

  HomeExample = [HomeAverG HomeAverXG AwayAverGA AwayAverXGA ];
  HomeExample = makeNotLinear(HomeExample,powers,epowers,lnpowers);
  %Predict Home

  goals_Home = [1 HomeExample]*theta_Home;
  %Predict Away
  goals_Away = [1 AwayExample]*theta_Away;

  HomeExample;
  AwayExample;

  gameStat=AwayStat(counterAway,:);

 

  if abs(goals_Home-goals_Away)<diffDraw&&AllCoefsMatrix(i,2)>minCof,
    betsNumber=betsNumber+1;
    [HomeTeam  '-'  AwayTeam];
    [goals_Home  goals_Away];
    if gameStat(1)==gameStat(3),
       "CORRECT DRAW";
       tempmax=0;
       correct1res=correct1res+1;
       AllCoefsMatrix(i,2);
       sum=sum+AllCoefsMatrix(i,2)
    endif
    "DRAW";
  endif
    if abs(goals_Home-goals_Away)>diffWin&&goals_Home-goals_Away>0&&AllCoefsMatrix(i,1)>minCof,
      betsNumber=betsNumber+1;
      [HomeTeam  '-'  AwayTeam];
      [goals_Home  goals_Away];
      ["WIN " HomeTeam " or DRAW"];
      if gameStat(1)>=gameStat(3),
        "CORRECT DRAW OR";
        correct2res=correct2res+1;
        
      endif
      if gameStat(1)>gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
        "CORRECT WIN";
        tempmax=0;
        correct1res=correct1res+1;
        AllCoefsMatrix(i,1);
        sum=sum+AllCoefsMatrix(i,1)
        
      endif
    endif
    if  abs(goals_Home-goals_Away)>diffWin&&goals_Away-goals_Home>0&&AllCoefsMatrix(i,3)>minCof,
      betsNumber=betsNumber+1;
      [HomeTeam  '-'  AwayTeam];
      [goals_Home  goals_Away];
      ["WIN " AwayTeam " or DRAW"];
       if gameStat(1)<=gameStat(3),
         "CORRECT DRAW OR";
        correct2res=correct2res+1;
       endif
       if gameStat(1)<gameStat(3)&&abs(goals_Home-goals_Away)>=diffWin,
        "CORRECT WIN";
        tempmax=0;
        correct1res=correct1res+1;
        AllCoefsMatrix(i,3);
        sum=sum+AllCoefsMatrix(i,3)
        
      endif
    endif

  "__________ ";
  "__________ ";
  endfor


  correct1res
  correct2res
  betsNumber
  sum=sum-betsNumber
  if betsNumber<3,
    "DON'T RISK"
  endif

  resRow=['Liga: ' ligasArr(cligas,:) '; powers: ' deblank(fileNamesArr(1,:)) '; epowers: ' deblank(fileNamesArr(2,:)) '; lnpowers: ' deblank(fileNamesArr(3,:)) '; SUM: ' num2str(sum)]


  fid = fopen (['C:\Users\ZBook\Desktop\Dataset\Finding_Parameters_For_Hypothesis\p,e,l\' hypothesisType '\3 seasons\top_25_Parameters\VB_' numberVB '.txt'], "a");
        fdisp (fid, resRow);
  fclose(fid);

endfor

endfor