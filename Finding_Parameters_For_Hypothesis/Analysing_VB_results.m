numberVB='3';
hypothesisType = 'p1345,ep13,lnp0';
path='C:\Users\ZBook\Desktop\Dataset\Finding_Parameters_For_Hypothesis';
AllParametersBundesliga=fileread([path '\p,e,l\' hypothesisType '\VB_Results\VB' numberVB '\Bundesliga.txt']);
AllParametersArrBundesliga = strsplit(AllParametersBundesliga,"\n");

AllParametersLaLiga=fileread([path '\p,e,l\' hypothesisType '\VB_Results\VB' numberVB '\LaLiga.txt']);
AllParametersArrLaLiga = strsplit(AllParametersLaLiga,"\n");

AllParametersLigue_1=fileread([path '\p,e,l\' hypothesisType '\VB_Results\VB' numberVB '\Ligue_1.txt']);
AllParametersArrLigue_1 = strsplit(AllParametersLigue_1,"\n");

AllParametersSerie_A=fileread([path '\p,e,l\' hypothesisType '\VB_Results\VB' numberVB '\Serie_A.txt']);
AllParametersArrSerie_A = strsplit(AllParametersSerie_A,"\n");

sum=0;

AverArr=[];
ParametersArr=[];

for i=1:size(AllParametersArrLigue_1,2),
   parameters = (strsplit(AllParametersArrLigue_1{1,i},'SUM: '){1,1});
   
   valueBundesliga=str2double(strsplit(AllParametersArrBundesliga{1,i},'SUM: '){1,2});
   valueLaLiga=str2double(strsplit(AllParametersArrLaLiga{1,i},'SUM: '){1,2});
   valueLigue_1=str2double(strsplit(AllParametersArrLigue_1{1,i},'SUM: '){1,2});
   valueSerie_A=str2double(strsplit(AllParametersArrSerie_A{1,i},'SUM: '){1,2});
   
   sum=(valueBundesliga+valueLaLiga+valueLigue_1+valueSerie_A)/4;
   
   AverArr=[AverArr;sum];
   ParametersArr=[ParametersArr; [parameters '|' num2str(sum)]];
   
endfor



AverArr=sort(AverArr);
SortedParametersArr=[];

for i=size(AverArr,1)-25:size(AverArr,1),
  val= AverArr(i)
  for j=1:size(ParametersArr,1),
    
    if abs(val-str2double(strsplit(deblank(ParametersArr(j,:)),'|'){1,2}))<0.01,
      SortedParametersArr=[ParametersArr(j,:); SortedParametersArr];
    endif
  endfor
endfor
SortedParametersArr