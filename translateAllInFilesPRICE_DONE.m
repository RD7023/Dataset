ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A'];
PC='ZBook';
path=['C:\Users\' PC '\Desktop\Dataset'];

years = '2018-2019';

%%PRICES

for i=1:4,
  
  league = deblank(ligasArr(i,:));
  Team_Price = fileread(['C:\Users\' PC '\Desktop\Dataset\' league '\' years '\teams_prices.txt']);
  Team_PriceArr = strsplit(Team_Price,"\n");
  
  for j=1:size(Team_PriceArr,2),
    Team_PriceArr{1,j};
    teamName=strsplit(Team_PriceArr{1,j},','){1,1};
    teamPrice=['"' strsplit(Team_PriceArr{1,j},',"'){1,2}];
    teamNameOrig = translatePrice2Orig(teamName,league);
    
    newRow = [teamNameOrig ',' teamPrice];

    fid = fopen (['C:\Users\' PC '\Desktop\Dataset\' league '\' years  '\priceOrigNames2.txt'], "a");
      fdisp (fid, newRow);
    fclose(fid);
    
  endfor 
  
endfor
