years='2018-2019';
liga='Ligue_1';

way=['C:\Users\ZBook\Desktop\Dataset\' liga '\' years '\Games_Data'];

wayHomeAway=['C:\Users\ZBook\Desktop\Dataset\' liga '\' years] ;




AllGames = fileread([wayHomeAway '\HomeAwayGames.txt']);
AllGamesArr=strsplit(AllGames,"\n");
fflush (stdout);
Home1 = input("Enter 1st game this week HomeTeam: ","s");
fflush (stdout);
Away1 = input("Enter 1st game this week AwayTeam: ","s");
fflush (stdout);
Home2 = input("Enter last game this week HomeTeam: ","s");
fflush (stdout);
Away2 = input("Enter last game this week AwayTeam: ","s");

firstmatch=0;
lastmatch=0;

for i=2: size(AllGamesArr,2),
  if size(AllGamesArr{1,i},2)>0,%get rid of empty rows
    if strncmp(AllGamesArr{1,i},[Home1 ',' Away1],size(AllGamesArr{1,i},2)-1),
      firstmatch=i;
    endif
   
    if strncmpi(AllGamesArr{1,i},[Home2 ',' Away2],size(AllGamesArr{1,i},2)-1),
      lastmatch=i;
    endif
  endif
endfor

firstmatch
lastmatch
  
  
for i=firstmatch:lastmatch,
  HomeAwayArr=strsplit(AllGamesArr{1,i},",");
  HomeTeam=HomeAwayArr{1,1}
  AwayTeam=HomeAwayArr{1,2};
 
%Home 
  HomeStat = dlmread([way '\' HomeTeam ".txt"],',',1,0);
  HomeStat

  HomeAverG=0;
  HomeAverXG=0;

  HomeAverGA=0;
  HomeAverXGA=0;
  
  counterHome=0;
for j=2:i,
    if strcmp(strsplit(AllGamesArr{1,j},","){1,1},HomeTeam),
      counterHome=counterHome+1;
    endif
    comp=strsplit(AllGamesArr{1,j},","){1,2};
    if strncmpi(comp,HomeTeam,length(comp)-1),
     counterHome=counterHome+1;
    endif
  endfor
  counterHome
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
%HomeAverG=HomeAverG/4;
%HomeAverXG=HomeAverXG/4;

%HomeAverGA=HomeAverGA/4;
%HomeAverXGA=HomeAverXGA/4;
 
HomeAverG
HomeAverXG
  
HomeAverGA
HomeAverXGA  
  
AwayStat = dlmread([way '\' deblank(AwayTeam) ".txt"],',',1,0);
AwayStat

AwayAverG=0;
AwayAverXG=0;

AwayAverGA=0;
AwayAverXGA=0; 
counterAway=0; 

  for j=2:i,
    
    comp=strsplit(AllGamesArr{1,j},","){1,1};
    if strncmpi(comp,AwayTeam,length(comp)-1),
      counterAway=counterAway+1;
    endif
    comp=strsplit(AllGamesArr{1,j},","){1,2};
    if strncmpi(comp,AwayTeam,length(comp)-1),
     counterAway=counterAway+1;
    endif
  endfor
counterAway
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
 %AwayAverG=AwayAverG/4;
%AwayAverXG=AwayAverXG/4;

%AwayAverGA=AwayAverGA/4;
%AwayAverXGA=AwayAverXGA/4;
 endif 


AwayAverG
AwayAverXG

AwayAverGA
AwayAverXGA
AwayExample = [AwayAverG AwayAverXG HomeAverGA HomeAverXGA AwayStat(counterAway,3)]
HomeExample=[HomeAverG HomeAverXG AwayAverGA AwayAverXGA HomeStat(counterHome,1)]
averPath =[ 'C:\Users\ZBook\Desktop\Dataset\' liga '\' years];
 if (counterAway>4 && counterHome>4),
  dlmwrite ([averPath '\' "Average_Away_Data2.txt"], AwayExample, "-append");
  dlmwrite ([averPath '\' "Average_Home_Data2.txt"], HomeExample, "-append");
  endif
endfor

[HomeTeam AwayTeam]

%{
matchday = input("Pick a matchday number(more than 5): ");
HomeTeam = input("Enter HomeTeam: ","s");
AwayTeam = input("Enter AwayTeam: ","s");

matchday
HomeTeam
AwayTeam

%Home
HomeStat = dlmread([way '\' HomeTeam ".txt"],',',1,0);

HomeStat

HomeAverG=0;
HomeAverXG=0;

HomeAverGA=0;
HomeAverXGA=0;

for i = (matchday-5):(matchday-1),
  gameStat=HomeStat(i,:);
  if(gameStat(5)==1)
    "Home";
    HomeAverG=HomeAverG+gameStat(1);
    HomeAverXG=HomeAverXG+gameStat(2);
    
    HomeAverGA=HomeAverGA+gameStat(3);
    HomeAverXGA=HomeAverXGA+gameStat(4);
  endif 
  if(gameStat(5)==0)
    "Away";
    HomeAverG=HomeAverG+gameStat(3);
    HomeAverXG=HomeAverXG+gameStat(4);
    
    HomeAverGA=HomeAverGA+gameStat(1);
    HomeAverXGA=HomeAverXGA+gameStat(2);
  endif
endfor  
HomeAverG=HomeAverG/5;
HomeAverXG=HomeAverXG/5;

HomeAverGA=HomeAverGA/5;
HomeAverXGA=HomeAverXGA/5;

HomeAverG
HomeAverXG
  
HomeAverGA
HomeAverXGA


%Away
AwayStat = dlmread([way '\' AwayTeam ".txt"],',',1,0);
AwayStat

AwayAverG=0;
AwayAverXG=0;

AwayAverGA=0;
AwayAverXGA=0;

for i = (matchday-5):(matchday-1),
  gameStat=AwayStat(i,:);
  if(gameStat(5)==1)
    "Home";
    AwayAverG=AwayAverG+gameStat(1);
    AwayAverXG=AwayAverXG+gameStat(2);
    
    AwayAverGA=AwayAverGA+gameStat(3);
    AwayAverXGA=AwayAverXGA+gameStat(4);
  endif 
  if(gameStat(5)==0)
    "Away";
    AwayAverG=AwayAverG+gameStat(3);
    AwayAverXG=AwayAverXG+gameStat(4);
    
    AwayAverGA=AwayAverGA+gameStat(1);
    AwayAverXGA=AwayAverXGA+gameStat(2);
  endif
endfor  

AwayAverG=AwayAverG/5;
AwayAverXG=AwayAverXG/5;

AwayAverGA=AwayAverGA/5;
AwayAverXGA=AwayAverXGA/5;

AwayAverG
AwayAverXG

AwayAverGA
AwayAverXGA

AwayExample = [AwayAverG AwayAverXG HomeAverGA HomeAverXGA HomeStat(matchday,3)]
HomeExample=[HomeAverG HomeAverXG AwayAverGA AwayAverXGA HomeStat(matchday,1)]

averPath = 'C:\Users\ZBook\Desktop\Dataset\EPL\2018-2019';

dlmwrite ([averPath '\' "Average_Away_Data.txt"], AwayExample, "-append");
dlmwrite ([averPath '\' "Average_Home_Data.txt"], HomeExample, "-append");

%}