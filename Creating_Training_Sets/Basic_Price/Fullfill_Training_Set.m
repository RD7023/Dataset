yearsArr=['2014-2015';'2015-2016';'2016-2017';'2017-2018'];
ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A']; 
seasonsBefore = num2str(size(yearsArr,1));






for l_counter=1:size(ligasArr,1),
  liga = deblank(ligasArr(l_counter,:))
for y_counter=1:size(yearsArr,1),

years = yearsArr(y_counter,:)


way=['C:\Users\ZBook\Desktop\Dataset\' liga '\' years '\Games_Data'];
wayHomeAway=['C:\Users\ZBook\Desktop\Dataset\' liga '\' years] ;


%Get all teams prices

Team_Price = fileread(['C:\Users\ZBook\Desktop\Dataset\' liga '\' years '\teams_prices.txt']);
Team_PriceArr=strsplit(Team_Price,"\n");



AllGames = fileread([wayHomeAway '\HomeAwayGames.txt']);
AllGamesArr=strsplit(AllGames,"\n");





firstmatch=50;
lastmatch=size(AllGamesArr,2)-1;
  
  
for i=firstmatch:lastmatch,
  HomeAwayArr=strsplit(AllGamesArr{1,i},",");
  HomeTeam=HomeAwayArr{1,1};
  AwayTeam=HomeAwayArr{1,2};
  
%Home Price  
  HomeTeamNamePrice = translateOrig2Price(HomeTeam);
  HomePrice=0;
  AwayPrice=0;
  
  HomeTeam
  HomeTeamNamePrice
  for j=1:size(Team_PriceArr,2),
    ArrTeamName=strsplit(Team_PriceArr{1,j},','){1,1}
    if strncmpi(HomeTeamNamePrice,ArrTeamName,size(HomeTeamNamePrice,2)-1),
      HomePrice=strsplit(Team_PriceArr{1,j},'"'){1,2}
      HomePrice=strsplit(HomePrice,' '){1,1}
    endif
  endfor
  HomePrice = strrep(HomePrice,",",".");
  HomePrice = str2num(HomePrice);
%Away Price 
  AwayTeam 
  AwayTeamNamePrice = translateOrig2Price(AwayTeam)
  AwayTeam
  for j=1:size(Team_PriceArr,2),
    ArrTeamName=strsplit(Team_PriceArr{1,j},','){1,1}
    if strncmpi(AwayTeamNamePrice,ArrTeamName,size(AwayTeamNamePrice,2)-1),
      AwayPrice=strsplit(Team_PriceArr{1,j},'"'){1,2}
      AwayPrice=strsplit(AwayPrice,' '){1,1}
    endif
  endfor
  AwayPrice = strrep(AwayPrice,",",".")
  AwayPrice = str2num(AwayPrice)
  
%Home 
  HomeStat = dlmread([way '\' HomeTeam ".txt"],',',1,0);
  HomeStat;

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

AwayPrice
HomePrice

AwayExample = [AwayAverG;  AwayAverXG; HomeAverGA;  HomeAverXGA;  HomePrice; AwayPrice; AwayStat(counterAway,3)]'
HomeExample = [HomeAverG;  HomeAverXG; AwayAverGA; AwayAverXGA; HomePrice; AwayPrice; HomeStat(counterHome,1)]'
averPath =[ 'C:\Users\ZBook\Desktop\Dataset\' liga '\' years];
 if (counterAway>4 && counterHome>4),
  dlmwrite ([averPath '\' "Average_Away_Data3.txt"], AwayExample, "-append");
  dlmwrite ([averPath '\' "Average_Home_Data3.txt"], HomeExample, "-append");
  endif
endfor
endfor
endfor

