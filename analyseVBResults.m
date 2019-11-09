numberVB='5';
path='C:\Users\ZBook\Desktop\Dataset';
AllHypothesis=fileread([path '\Finding_Hypothesis_Type\Results_Prev.txt']);
AllHypothesisArr = strsplit(AllHypothesis,"\n");


counter=0;
sum=0;


AverArr=[];
parametersArr=[];
for i=1:size(AllHypothesisArr,2),
   parameters = (strsplit(AllHypothesisArr{1,i},'SUM: '){1,1})
   value=str2double(strsplit(AllHypothesisArr{1,i},'SUM: '){1,2})
   sum=sum+value;
   counter=counter+1;
   if counter == 4,
      AverArr=[AverArr; sum/4];
      parametersArr=[parametersArr; [parameters "|" num2str(sum/4)]];
      sum=0;
      counter=0;  
   endif
endfor

parametersArr
%{
AverArr=sort(AverArr);
SortedParametersArr=[];

for i=size(AverArr,1)-25:size(AverArr,1),
  val= AverArr(i);
  for j=1:size(parametersArr,1),
    if val == str2double(strsplit(deblank(parametersArr(j,:)),'|'){1,2}),
      SortedParametersArr=[parametersArr(j,:); SortedParametersArr];
    endif
  endfor
endfor
SortedParametersArr