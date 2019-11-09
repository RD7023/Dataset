numberVB='123';
hypothesisType='p1345,ep13,lnp0';

path='C:\Users\ZBook\Desktop\Dataset';
AllParameters4seasons=fileread([path '\Finding_Parameters_For_Hypothesis\p,e,l\' hypothesisType '\4 seasons\top_25_Parameters\VB_' numberVB '.txt']);
AllParametersArr4seasons = strsplit(AllParameters4seasons,"\n");

AllParameters3seasons=fileread([path '\Finding_Parameters_For_Hypothesis\p,e,l\' hypothesisType '\3 seasons\top_25_Parameters\VB_' numberVB '.txt']);
AllParametersArr3seasons = strsplit(AllParameters3seasons,"\n");




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



