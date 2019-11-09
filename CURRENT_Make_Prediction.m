%League and Season
years='2019-2020';
league='Ligue_1';

%Path to league and season
path=['C:\Users\ZBook\Desktop\Dataset\' league '\' years ];

%Path to training sets
wayDataSet='C:\Users\ZBook\Desktop\Dataset\TrainingSets\Type_2\5seasons';

%Hypothesys type
powers=[1;3;4;5]';
epowers=[1;3]';
lnpowers=[]';

%Training sets
HomeTrainingSet='Home_Ligue_1_5seasons_Hist2';
AwayTrainingSet='Away_Ligue_1_5seasons_Hist2';

%Get Home hypothesis

%----------------------------------------------------

dataHome = dlmread([wayDataSet '\' HomeTrainingSet ".txt"],',',1,0);
X_Home = dataHome(1:length(dataHome),1:4);
y_Home = dataHome(1:length(dataHome),5);


X_Home = makeNotLinear(X_Home,powers,epowers,lnpowers);

m=length(y_Home);

X_Home=[ones(m,1),X_Home];
theta_Home = zeros(5,1);

theta_Home = normalEqn(X_Home, y_Home)

%----------------------------------------------------

%Get Away hypothesis

%----------------------------------------------------

dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
X_Away = dataAway(1:length(dataAway),1:4)

X_Away=makeNotLinear(X_Away,powers,epowers,lnpowers);


y_Away = dataAway(1:length(dataAway),5);


X_Away=[ones(m,1),X_Away];
theta_Away = zeros(5,1);

theta_Away = normalEqn(X_Away, y_Away)

%---------------------------------------------------

%Get array of all games in historical order
AllGamesString = fileread([path '\AllGamesArr.txt']);
AllGamesArr = strsplit(AllGamesString,"\n");

%Get first and last games of the week
NextWeekGamesString = fileread([path '\Next_Week_Games.txt']);
NextWeekGamesArr = strsplit(NextWeekGamesString,"\n");

Match1=NextWeekGamesArr{1,2}
Match2=NextWeekGamesArr{1,length(NextWeekGamesArr)}

%Get number of the first and last games of the week

firstmatch=0;
lastmatch=0;

for i=2:size(AllGamesArr,2),
  
  if size(AllGamesArr{1,i},2)>0,
    
    HomeAwayArr=strsplit(AllGamesArr{1,i},',');
    HomeTeam=HomeAwayArr{1,1};
    AwayTeam=HomeAwayArr{1,2};
    match=[HomeTeam "," AwayTeam];
    
    if strncmpi(match,Match1,size(Match1,2)-1),
      firstmatch=i;
    endif
     
    if strncmpi(match,Match2,size(Match2,2)-1),
      lastmatch=i;
    endif
    
  endif
  
endfor



%Make prediction for every game
for i=firstmatch:lastmatch,
   
   HomeAwayArr = strsplit(AllGamesArr{1,i},",");
   HomeTeam = HomeAwayArr{1,1}
   AwayTeam = HomeAwayArr{1,2}
   
   %Home
    HomeStat = dlmread([path '\Games_Data\' HomeTeam ".txt"],',',0,0);
    HomeStat;
    
    HomeAverG=0;
    HomeAverXG=0;

    HomeAverGA=0;
    HomeAverXGA=0;
    
    counterHome=0;
    
    for j=1:i,
      
      if strcmp(strsplit(AllGamesArr{1,j},","){1,1},HomeTeam),
        counterHome=counterHome+1;
      endif
      
      if strncmp(strsplit(AllGamesArr{1,j},","){1,2},HomeTeam,length(HomeTeam)),
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
  HomeAverG
  %Away
  AwayStat = dlmread([path '\Games_Data\' deblank((AwayTeam)) ".txt"],',',0,0);
  AwayStat;
    
  AwayAverG=0;
  AwayAverXG=0;
  
  AwayAverGA=0;
  AwayAverXGA=0; 
  counterAway=0;    

 for j=1:i,
    
    comp=strsplit(AllGamesArr{1,j},","){1,1};
    if strncmpi(comp,AwayTeam,length(AwayTeam)-1),
      counterAway=counterAway+1;
    endif
    comp=strsplit(AllGamesArr{1,j},","){1,2};
    if strncmpi(comp,AwayTeam,length(AwayTeam)-1),
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

 goals_Home = [1 HomeExample]*theta_Home;
 goals_Away = [1 AwayExample]*theta_Away;
 
 diffDraw=0.25;
 diffWin=0.6;
 
 if abs(goals_Home-goals_Away)<diffDraw,
   i-firstmatch+1
   "---------------------------"
   "PREDICT DRAW"
   [HomeTeam  '-'  AwayTeam]
   [goals_Home goals_Away]
   "---------------------------"
 endif
 if goals_Home-goals_Away>diffWin,
   i-firstmatch+1
   "---------------------------"
   ["PREDICT " HomeTeam " WIN"]
   [HomeTeam  '-'  AwayTeam]
   [goals_Home goals_Away]
   "---------------------------"
 endif
 if goals_Away-goals_Home>diffWin,
   i-firstmatch+1
   "---------------------------"
   ["PREDICT " AwayTeam " WIN"]
   [HomeTeam  '-'  AwayTeam]
   [goals_Home goals_Away]
   "---------------------------"
 endif
endfor
