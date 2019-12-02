ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A'];
PC='ZBook';
path=['C:\Users\' PC '\Desktop\Dataset'];


years = '2018-2019';

%%PRICES

for i=1:4,
  
  league = deblank(ligasArr(i,:));
  wayHomeAway=['C:\Users\' PC '\Desktop\Dataset\' league '\' years];
  AllCoefGames= fileread([wayHomeAway '\Teams_For_Cofs_Sync.txt']);
  AllCoefGamesArr=strsplit(AllCoefGames,"\n");
  newRow = ["ddd"]
    fid = fopen (['C:\Users\' PC '\Desktop\Dataset\' league '\' years  '\cofsOrigNames2.txt'], "a");
      fdisp (fid, newRow);
    fclose(fid);
  
  for j=2:size(AllCoefGamesArr,2),
    
    teamNameHome=strsplit(AllCoefGamesArr{1,j},' - '){1,1}
    teamNameAway=strsplit(AllCoefGamesArr{1,j},' - '){1,2}
    [teamNameHome ' - ' teamNameAway]
    
    newRow = [transformTeamName(teamNameHome,league) ' - ' transformTeamName(teamNameAway,league)]
    fid = fopen (['C:\Users\' PC '\Desktop\Dataset\' league '\' years  '\cofsOrigNames2.txt'], "a");
      fdisp (fid, newRow);
    fclose(fid);
  endfor
  
endfor
