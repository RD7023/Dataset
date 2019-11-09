


years='2019-2020';
league='Ligue_1';

path=['C:\Users\ZBook\Desktop\Dataset\' league '\' years ];
delete([path '\Games_Data\*.txt']);


NextWeekGamesOneString = fileread([path '\Next_Week_Games.txt']);
NextWeekGamesArr=strsplit(NextWeekGamesOneString,"\n");



WeeksArrStructFiles=dir([path '\Games_Weeks']);
WeeksArrNamesFiles=[];

for i=3:size(WeeksArrStructFiles,1),
  WeeksArrNamesFiles=[WeeksArrNamesFiles; WeeksArrStructFiles(i).name];
endfor;


AllGamesArr=[];



for i=1:size(WeeksArrNamesFiles,1),
    fid = fileread([path '\Games_Weeks\'  WeeksArrNamesFiles(i,:)]);
    rows = strsplit(fid,"\n");
    for j=2:size(rows,2),
      matchDataArr=strsplit(rows{1,j},",");
      HomeTeam = matchDataArr{1,1};
      AwayTeam = matchDataArr{1,4};
      
      HomeExample = [matchDataArr{1,2} "," matchDataArr{1,3} "," matchDataArr{1,5} "," strtrunc(matchDataArr{1,6},length(matchDataArr{1,6})-1) ",1"];
      AwayExample = [matchDataArr{1,2} ","  matchDataArr{1,3} "," matchDataArr{1,5} "," strtrunc(matchDataArr{1,6},length(matchDataArr{1,6})-1) ",0"];
      
      game=[matchDataArr{1,1} "," matchDataArr{1,4}];
      AllGamesArr=[AllGamesArr; game]; 
      
      
      fid = fopen ([path '\Games_Data\' HomeTeam '.txt'], "a");
      fdisp (fid, HomeExample);
      fclose(fid);
      
      fid = fopen ([path '\Games_Data\' AwayTeam '.txt'], "a");
      fdisp (fid, AwayExample);
      fclose(fid);
      
    endfor
endfor

fid = fopen ([path "/AllGamesArr.txt"], "w");
fdisp (fid, AllGamesArr);
fclose(fid);

for i=2:size(NextWeekGamesArr,2),
  fid = fopen ([path "/AllGamesArr.txt"], "a");
  fdisp (fid, NextWeekGamesArr{1,i});
  fclose(fid);
endfor