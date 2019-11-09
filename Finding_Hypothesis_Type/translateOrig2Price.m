function namePrice = translateOrig2Price(nameOrig,liga),
  switch (liga)
  case 'Ligue_1'
    if strncmpi(nameOrig,"Paris Saint Germain",size(nameOrig,2)-1),
      nameOrig = "Paris SG";
    endif
     if strncmpi(nameOrig,"Lyon",size(nameOrig,2)-1),
      nameOrig = "Olympique Lyon";
    endif
    if strncmpi(nameOrig,"Bordeaux",size(nameOrig,2)-1),
      nameOrig = "FC Girondins Bordeaux";
    endif
    if strncmpi(nameOrig,"Lille",size(nameOrig,2)-1),
      nameOrig = "LOSC Lille";
    endif
    if strncmpi(nameOrig,"Rennes",size(nameOrig,2)-1),
      nameOrig = "Stade Rennais FC";
    endif
    if strncmpi(nameOrig,"Nice",size(nameOrig,2)-1),
      nameOrig = "OGC Nice";
    endif
    if strncmpi(nameOrig,"Caen",size(nameOrig,2)-1),
      nameOrig = "SM Caen";
    endif
    if strncmpi(nameOrig,"Nantes",size(nameOrig,2)-1),
      nameOrig = "FC Nantes";
    endif
    if strncmpi(nameOrig,"Lorient",size(nameOrig,2)-1),
      nameOrig = "FC Lorient";
    endif
    if strncmpi(nameOrig,"Evian Thonon Gaillard",size(nameOrig,2)-1),
      nameOrig = "Thonon Evian Grand Geneve FC";
    endif
    if strncmpi(nameOrig,"Metz",size(nameOrig,2)-1),
      nameOrig = "FC Metz";
    endif
    if strncmpi(nameOrig,"Angers",size(nameOrig,2)-1),
      nameOrig = "SCO Angers";
    endif
    if strncmpi(nameOrig,"G.Ajaccio",size(nameOrig,2)-1),
      nameOrig = "GFC Ajacco";
    endif
    if strncmpi(nameOrig,"Nancy",size(nameOrig,2)-1),
      nameOrig = "AS Nancy";
    endif
    if strncmpi(nameOrig,"Amiens",size(nameOrig,2)-1),
      nameOrig = "SC Amiens";
    endif
    if strncmpi(nameOrig,"Strasbourg",size(nameOrig,2)-1),
      nameOrig = "RC Strasbourg Alsace";
    endif
    if strncmpi(nameOrig,"Nimes",size(nameOrig,2)-1),
      nameOrig = "Nimes Olympique";
    endif
    if strncmpi(nameOrig,"Brest",size(nameOrig,2)-1),
      nameOrig = "Stade Brest 29";
    endif
    if strncmpi(nameOrig,"Guingamp",size(nameOrig,2)-1),
      nameOrig = "EA Guingamp";
    endif
    if strncmpi(nameOrig,"Marseille",size(nameOrig,2)-1),
      nameOrig = "Olympique Marseille";
    endif
    if strncmpi(nameOrig,"Reims",size(nameOrig,2)-1),
      nameOrig = "Stade Reims";
    endif
    if strncmpi(nameOrig,"Toulouse",size(nameOrig,2)-1),
      nameOrig = "FC Toulouse";
    endif
    if strncmpi(nameOrig,"Montpellier",size(nameOrig,2)-1),
      nameOrig = "HSC Montpellier";
    endif
     if strncmpi(nameOrig,"Lens",size(nameOrig,2)-1),
      nameOrig = "RC Lens";
    endif
     if strncmpi(nameOrig,"Saint-Etienne",size(nameOrig,2)-1),
      nameOrig = "AS Saint-Etienne";
    endif
     if strncmpi(nameOrig,"Monaco",size(nameOrig,2)-1),
      nameOrig = "AS Monaco";
    endif
     if strncmpi(nameOrig,"Paris Saint Germain",size(nameOrig,2)-1),
      nameOrig = "Paris Saint-Germain";
    endif
     if strncmpi(nameOrig,"Troyes",size(nameOrig,2)-1),
      nameOrig = "ES Troyes AC";
    endif
     if strncmpi(nameOrig,"Dijon",size(nameOrig,2)-1),
      nameOrig = "FCO Dijon";
    endif
     if strncmpi(nameOrig,"Toulouse",size(nameOrig,2)-1),
      nameOrig = "FC Toulouse";
    endif
   
  
  case 'Bundesliga'
    if strncmpi(nameOrig,"Wolfsburg",size(nameOrig,2)-1),
      nameOrig = "Vfl Wolfsburg";
    endif
    if strncmpi(nameOrig,"Borussia M.Gladbach",size(nameOrig,2)-1),
      nameOrig = "Borussia Monchengladbach";
    endif
    if strncmpi(nameOrig,"Augsburg",size(nameOrig,2)-1),
      nameOrig = "FC Augsburg";
    endif
    if strncmpi(nameOrig,"Bayer Leverkusen",size(nameOrig,2)-1),
      nameOrig = "Bayer 04 Leverkusen";
    endif
    if strncmpi(nameOrig,"Schalke 04",size(nameOrig,2)-1),
      nameOrig = "FC Schalke 04";
    endif
   
    if strncmpi(nameOrig,"Hoffenheim",size(nameOrig,2)-1),
      nameOrig = "TSG 1899 Hoffenheim";
    endif
    if strncmpi(nameOrig,"Mainz 05",size(nameOrig,2)-1),
      nameOrig = "1.FSV Mainz 05";
    endif
    if strncmpi(nameOrig,"FC Cologne",size(nameOrig,2)-1),
      nameOrig = "1. FC Koln";
    endif
    if strncmpi(nameOrig,"Hertha Berlin",size(nameOrig,2)-1),
      nameOrig = "Hertha BSC";
    endif
    if strncmpi(nameOrig,"Freiburg",size(nameOrig,2)-1),
      nameOrig = "SC Freiburg";
    endif
    if strncmpi(nameOrig,"Paderborn",size(nameOrig,2)-1),
      nameOrig = "SC Paderborn";
    endif
    if strncmpi(nameOrig,"Ingolstadt",size(nameOrig,2)-1),
      nameOrig = "FC Ingolstadt";
    endif
    if strncmpi(nameOrig,"Darmstadt",size(nameOrig,2)-1),
      nameOrig = "SV Darmstadt 98";
    endif
    if strncmpi(nameOrig,"RasenBallsport Leipzig",size(nameOrig,2)-1),
      nameOrig = "RB Leipzig";
    endif
    if strncmpi(nameOrig,"Fortuna Duesseldorf",size(nameOrig,2)-1),
      nameOrig = "Fortuna Duesseldorf";
    endif
    if strncmpi(nameOrig,"Werder Bremen",size(nameOrig,2)-1),
      nameOrig = "SV Werder Bremen";
    endif
      if strncmpi(nameOrig,"Nuernberg",size(nameOrig,2)-1),
      nameOrig = "1.FC Nuremberg ";
    endif

  
  case 'LaLiga'
    if strncmpi(nameOrig,"Barcelona",size(nameOrig,2)-1),
      nameOrig = "FC Barcelona";
    endif
    if strncmpi(nameOrig,"Atletico Madrid",size(nameOrig,2)-1),
      nameOrig = "Atletico Madrid";
    endif
    if strncmpi(nameOrig,"Sevilla",size(nameOrig,2)-1),
      nameOrig = "Sevilla FC";
    endif
    if strncmpi(nameOrig,"Athletic Club",size(nameOrig,2)-1),
      nameOrig = "Athletic";
    endif
    if strncmpi(nameOrig,"Celta Vigo",size(nameOrig,2)-1),
      nameOrig = "Celta de Vigo";
    endif
    if strncmpi(nameOrig,"Malaga",size(nameOrig,2)-1),
      nameOrig = "Malaga CF";
    endif
    if strncmpi(nameOrig,"Elche",size(nameOrig,2)-1),
      nameOrig = "Elche CF";
    endif
    if strncmpi(nameOrig,"Deportivo La Coruna",size(nameOrig,2)-1),
      nameOrig = "Deportivo de La Coruna";
    endif
    if strncmpi(nameOrig,"Granada",size(nameOrig,2)-1),
      nameOrig = "Granada CF";
    endif
    if strncmpi(nameOrig,"Eibar",size(nameOrig,2)-1),
      nameOrig = "SD Eibar";
    endif
    if strncmpi(nameOrig,"Almeria",size(nameOrig,2)-1),
      nameOrig = "UD Almeria";
    endif
    if strncmpi(nameOrig,"Cordoba",size(nameOrig,2)-1),
      nameOrig = "Cordoba CF";
    endif
    if strncmpi(nameOrig,"Las Palmas",size(nameOrig,2)-1),
      nameOrig = "UD Las Palmas";
    endif
    if strncmpi(nameOrig,"Sporting Gijon",size(nameOrig,2)-1),
      nameOrig = "Sporting Gijon";
    endif
    if strncmpi(nameOrig,"Alaves",size(nameOrig,2)-1),
      nameOrig = "Deportivo Alaves";
    endif
    if strncmpi(nameOrig,"Leganes",size(nameOrig,2)-1),
      nameOrig = "CD Leganes";
    endif
    if strncmpi(nameOrig,"Osasuna",size(nameOrig,2)-1),
      nameOrig = "CA Osasuna";
    endif
    if strncmpi(nameOrig,"Espanyol",size(nameOrig,2)-1),
      nameOrig = "RCD Espanyol Barcelona";
    endif
 
  
  
  case "Serie_A"
    if strncmpi(nameOrig,"Roma",size(nameOrig,2)-1),
      nameOrig = "AS Roma";
    endif
    if strncmpi(nameOrig,"Napoli",size(nameOrig,2)-1),
      nameOrig = "SSC Napoli";
    endif
    if strncmpi(nameOrig,"Palermo",size(nameOrig,2)-1),
      nameOrig = "US Palermo";
    endif
    if strncmpi(nameOrig,"Verona",size(nameOrig,2)-1),
      nameOrig = "Hellas Verona";
    endif
    if strncmpi(nameOrig,"Chievo",size(nameOrig,2)-1),
      nameOrig = "Chievo Verona";
    endif
    if strncmpi(nameOrig,"Empoli",size(nameOrig,2)-1),
      nameOrig = "FC Empoli";
    endif
    if strncmpi(nameOrig,"Udinese",size(nameOrig,2)-1),
      nameOrig = "Udinese Calcio";
    endif
    if strncmpi(nameOrig,"Cagliari",size(nameOrig,2)-1),
      nameOrig = "Cagliari Calcio";
    endif
    if strncmpi(nameOrig,"SPAL 2013",size(nameOrig,2)-1),
      nameOrig = "SPAL";
    endif
    if strncmpi(nameOrig,"Parma Calcio 1913",size(nameOrig,2)-1),
      nameOrig = "Parma";
    endif
     if strncmpi(nameOrig,"SPAL 2013",size(nameOrig,2)-1),
      nameOrig = "SPAL";
    endif
     if strncmpi(nameOrig,"Lazio",size(nameOrig,2)-1),
      nameOrig = "SS Lazio";
    endif
     if strncmpi(nameOrig,"Sampdoria",size(nameOrig,2)-1),
      nameOrig = "UC Sampdoria";
    endif
     if strncmpi(nameOrig,"Cesena",size(nameOrig,2)-1),
      nameOrig = "AC Cesena";
    endif
     if strncmpi(nameOrig,"Sassuolo",size(nameOrig,2)-1),
      nameOrig = "US Sassuolo";
    endif
     if strncmpi(nameOrig,"Fiorentina",size(nameOrig,2)-1),
      nameOrig = "ACF Fiorentina";
    endif
     if strncmpi(nameOrig,"Pescara",size(nameOrig,2)-1),
      nameOrig = "Delfino Pescara 1936";
    endif
     if strncmpi(nameOrig,"Crotone",size(nameOrig,2)-1),
      nameOrig = "FC Crotone";
    endif
  endswitch
  
  namePrice = nameOrig;
endfunction
