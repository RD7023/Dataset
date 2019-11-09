function NewTeam =transformTeamName(Team)
  %La_Liga
  if strncmpi(Team,"Dep. La Coruna",8),
    Team="Deportivo La Coruna";
  endif
  if strncmpi(Team,"Betis",4),
    Team="Real Betis";
  endif
  if strncmpi(Team,"Huesca",4),
    Team="SD Huesca";
  endif
  if strncmpi(Team,"Ath Bilbao",5),
    Team="Athletic Club";
  endif
  if strncmpi(Team,"Valladolid",9),
    Team="Real Valladolid";
  endif
  if strncmpi(Team,"Atl. Madrid",8),
    Team="Atletico Madrid";
  endif
  
  %EPL
  if strncmpi(Team,"Manchester Utd",13),
    Team="Manchester United";
  endif
   if strncmpi(Team,"Wolves",5),
    Team="Wolverhampton Wanderers";
  endif
   if strncmpi(Team,"Newcastle",5),
    Team="Newcastle United";
  endif
  if strncmpi(Team,"Zenit Petersburg",9),
    Team="Zenit St. Petersburg";
  endif
  if strncmpi(Team,"Krasnodar",7),
    Team="FC Krasnodar";
  endif
  if strncmpi(Team,"Orenburg",7),
    Team="FC Orenburg";
  endif
  if strncmpi(Team,"Akhmat Grozny",7),
    Team="FK Akhmat";
  endif
  if strncmpi(Team,"FK Rostov",7),
    Team="FC Rostov";
  endif
  if strncmpi(Team,"Dynamo Moscow",10),
    Team="Dinamo Moscow";
  endif
  if strncmpi(Team,"FK Anzi Makhackala",10),
    Team="Anzhi Makhachkala";
  endif
   if strncmpi(Team,"Yenisey",5),
    Team="FC Yenisey Krasnoyarsk";
  endif
  if strncmpi(Team,"Ufa",3),
    Team="FC Ufa";
  endif
   if strncmpi(Team,"FK Krylya Sovetov Samara",5),
    Team="Krylya Sovetov Samara";
  endif
  if strncmpi(Team,"FK Krylya Sovetov Samara",5),
    Team="Krylya Sovetov Samara";
  endif
  if strncmpi(Team,"FK Krylya Sovetov Samara",5),
    Team="Krylya Sovetov Samara";
  endif
  
  
  %Bundesliga
  if strncmpi(Team,"Dortmund",7),
    Team="Borussia Dortmund";
  endif
  if strncmpi(Team,"RB Leipzig",8),
    Team="RasenBallsport Leipzig";
  endif
  if strncmpi(Team,"B. Monchengladbach",12),
    Team="Borussia M.Gladbach";
  endif
  if strncmpi(Team,"Dusseldorf",8),
    Team="Fortuna Duesseldorf";
  endif
  if strncmpi(Team,"Mainz",4),
    Team="Mainz 05";
  endif
   if strncmpi(Team,"Schalke",6),
    Team="Schalke 04";
  endif
  if strncmpi(Team,"Stuttgart",8),
    Team="VfB Stuttgart";
  endif
  if strncmpi(Team,"Hannover",7),
    Team="Hannover 96";
  endif
  if strncmpi(Team,"Nurnberg",7),
    Team="Nuernberg";
  endif
  if strncmpi(Team,"FC Koln",7),
    Team="FC Cologne";
  endif
  
  %Ligue_1
  if strncmpi(Team,"Paris SG",7),
    Team="Paris Saint Germain";
  endif
  if strncmpi(Team,"St Etienne",7),
    Team="Saint-Etienne";
  endif
  
  %Serie_A
   if strncmpi(Team,"AS Roma",6),
    Team="Roma";
  endif
  if strncmpi(Team,"Spal",4),
    Team="SPAL 2013";
  endif
  if strncmpi(Team,"Parma",4),
    Team="Parma Calcio 1913";
  endif
  NewTeam=Team;
endfunction
