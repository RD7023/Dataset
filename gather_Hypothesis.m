years='2018-2019';
ligasArr=['Bundesliga';'EPL';'LaLiga';'Ligue_1';'RFPL';'Serie_A']; 

%function type
powers=0.5:0.5:4;


wayDataSet='C:\Users\ZBook\Desktop\Dataset\TrainingSets';


%Get hypothesis for all ligas

ownLigaHypothesisArr=[]
allLigasHypothesisArr=[]
for cligas=1:size(ligasArr,1),
  
  HomeTrainingSet=['Home_' deblank(ligasArr(cligas,:)) '_4seasons_Hist2'];
  AwayTrainingSet=['Away_' deblank(ligasArr(cligas,:)) '_4seasons_Hist2'];
  
  %Get Home hypothesis ownLiga
  dataHome = dlmread([wayDataSet '\' HomeTrainingSet ".txt"],',',1,0);
  X_Home = dataHome(1:length(dataHome),1:4);
  y_Home =dataHome(1:length(dataHome),5);


  X_Home = makeNotLinear(X_Home,powers);

  m=length(y_Home);

  X_Home=[ones(m,1),X_Home];
  theta_Home = zeros(5,1);

  theta_Home = normalEqn(X_Home, y_Home);


  %Get Away hypothesis ownLiga
  dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
  X_Away = dataAway(1:length(dataAway),1:4);

  X_Away=makeNotLinear(X_Away,powers);


  y_Away = dataAway(1:length(dataAway),5);


  X_Away=[ones(m,1),X_Away];
  theta_Away = zeros(5,1);

  theta_Away = normalEqn(X_Away, y_Away);

  ownLigaHypothesisArr=[ownLigaHypothesisArr theta_Home theta_Away];
  
  HomeTrainingSet='Home_LaLiga_AND_RFPL_EPL_Bundesliga_Ligue 1_Serie A_4seasons_Hist2';
  AwayTrainingSet='Away_LaLiga_AND_RFPL_EPL_Bundesliga_Ligue 1_Serie A_4seasons_Hist2';
  
  %Get Home hypothesis allLigas
  dataHome = dlmread([wayDataSet '\' HomeTrainingSet ".txt"],',',1,0);
  X_Home = dataHome(1:length(dataHome),1:4);
  y_Home =dataHome(1:length(dataHome),5);


  X_Home = makeNotLinear(X_Home,powers);

  m=length(y_Home);

  X_Home=[ones(m,1),X_Home];
  theta_Home = zeros(5,1);

  theta_Home = normalEqn(X_Home, y_Home);


  %Get Away hypothesis allLigas
  dataAway = dlmread([wayDataSet '\' AwayTrainingSet ".txt"],',',1,0);
  X_Away = dataAway(1:length(dataAway),1:4);

  X_Away=makeNotLinear(X_Away,powers);


  y_Away = dataAway(1:length(dataAway),5);


  X_Away=[ones(m,1),X_Away];
  theta_Away = zeros(5,1);

  theta_Away = normalEqn(X_Away, y_Away);
  
  
  allLigasHypothesisArr=[allLigasHypothesisArr theta_Home theta_Away]
  
endfor