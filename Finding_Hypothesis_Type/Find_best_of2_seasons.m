numberVB='245';
path='C:\Users\ZBook\Desktop\Dataset';
AllHypothesis4seasons=fileread([path '\Finding_Hypothesis_Type\VB_Top\4 seasons\VB_' numberVB '.txt']);
AllHypothesisArr4seasons = strsplit(AllHypothesis4seasons,"\n");

AllHypothesis3seasons=fileread([path '\Finding_Hypothesis_Type\VB_Top\3 seasons\VB_' numberVB '.txt']);
AllHypothesisArr3seasons = strsplit(AllHypothesis3seasons,"\n");



twoSeasonsHypothesisArr=[]

resultsArr=[];

for i=1:size(AllHypothesisArr4seasons,2),
   parameters = (strsplit(AllHypothesisArr4seasons{1,i},'|'){1,1});
   value4=str2double(strsplit(AllHypothesisArr4seasons{1,i},'|'){1,2});
   value3=str2double(strsplit(AllHypothesisArr3seasons{1,i},'|'){1,2});
   
   res=value4+value3*3/4;
   twoSeasonsHypothesisArr=[twoSeasonsHypothesisArr; [parameters "|" num2str(res)]]
   resultsArr = [resultsArr;res];

endfor

sortedResults = sort(resultsArr);

twoSeasonsHypothesisArr;
twoSeasonsHypothesisArrSorted=[]

for i=1:size(sortedResults,1),
     for j=1:size(twoSeasonsHypothesisArr,1),
       value=str2double(strsplit(twoSeasonsHypothesisArr(j,:),'|'){1,2});
       sortedResults(i)-value
       if(abs(value-sortedResults(i))<0.01),
        parameters = (strsplit(AllHypothesisArr4seasons{1,j},'|'){1,1});
        twoSeasonsHypothesisArrSorted=[[parameters num2str(value)]; twoSeasonsHypothesisArrSorted];
       endif
       
     endfor
     
endfor
  
twoSeasonsHypothesisArrSorted  



