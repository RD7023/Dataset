%WRITES TO THE END OF FILEs
%WRITES TO THE END OF FILEs
%WRITES TO THE END OF FILEs
yearsArr=['2014-2015';'2015-2016';'2016-2017';'2017-2018'];
ligasArr=['Bundesliga';'LaLiga';'Ligue_1';'Serie_A']; 
seasonsBefore = num2str(size(yearsArr,1));
path='C:\Users\ZBook\Desktop\Dataset';
type='Type_3(Basic+Price)';
seasonsBefore=4


for i=1:size(ligasArr,1),
  liga=deblank(ligasArr(i,:))
  
  
  for j=1:size(yearsArr,1),
    year=deblank(yearsArr(j,:)) 
    yearTrainingSetHomeString = fileread([path '\' liga '\' year '\Average_Home_Data3.txt'])
    yearTrainingSetHome=strsplit(yearTrainingSetHomeString,"\n")
    
    
    yearTrainingSetAwayString = fileread([path '\' liga '\' year '\Average_Away_Data3.txt'])
    yearTrainingSetAway=strsplit(yearTrainingSetAwayString,"\n")
    
    for k=1:size(yearTrainingSetHome,2)-1,
     
      fidHome = fopen ([path '\TrainingSets\' type '\' num2str(seasonsBefore) 'seasons\' 'Home_' liga '_4seasons_Hist3.txt'], "a");
      fdisp (fidHome, deblank(yearTrainingSetHome{1,k}));
      fclose(fidHome);
      fidAway = fopen ([path '\TrainingSets\' type '\' num2str(seasonsBefore) 'seasons\' 'Away_' liga '_4seasons_Hist3.txt'], "a");
      fdisp (fidAway, deblank(yearTrainingSetAway{1,k}));
      fclose(fidAway);
    endfor
   
  endfor

endfor
  



