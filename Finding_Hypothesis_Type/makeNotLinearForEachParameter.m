function retval = makeNotLinearForEachParameter (X, HomeAverG_powers, HomeAverXG_powers, AwayAverGA_powers, AwayAverXGA_powers, HomePrice_powers, AwayPrice_powers, HomeAverG_epowers, HomeAverXG_epowers, AwayAverGA_epowers, AwayAverXGA_epowers, HomePrice_epowers, AwayPrice_epowers, HomeAverG_lnpowers, HomeAverXG_lnpowers, AwayAverGA_lnpowers, AwayAverXGA_lnpowers, HomePrice_lnpowers, AwayPrice_lnpowers,HomeAverG_sqrtpowers, HomeAverXG_sqrtpowers, AwayAverGA_sqrtpowers, AwayAverXGA_sqrtpowers, HomePrice_sqrtpowers, AwayPrice_sqrtpowers)
 retval=[];
 for i=1:size(X,2),
   Xth=X(:,i);
   
   if (i==1)
    
       powers = HomeAverG_powers;
       epowers = HomeAverG_epowers;
       lnpowers = HomeAverG_lnpowers;
       sqrtpowers = HomeAverG_sqrtpowers;
       
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
         retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
   endif
   if (i==2)
     
        powers = HomeAverXG_powers;
        epowers = HomeAverXG_epowers;
        lnpowers = HomeAverXG_lnpowers;
        sqrtpowers = HomeAverXG_sqrtpowers;
        
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
         retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
     endif
     if (i==3)
           
        powers = AwayAverGA_powers;
        epowers = AwayAverGA_epowers;
        lnpowers = AwayAverGA_lnpowers;
        sqrtpowers = AwayAverGA_sqrtpowers;
        
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
         retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
      endif  
     if (i==4)
           
        powers =  AwayAverXGA_powers;
        epowers =  AwayAverXGA_epowers;
        lnpowers =  AwayAverXGA_lnpowers;
        sqrtpowers =  AwayAverXGA_sqrtpowers;
        
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
         retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
      endif
     if (i==5)
           
        powers = HomePrice_powers;
        epowers = HomePrice_epowers;
        lnpowers = HomePrice_lnpowers;
        sqrtpowers = HomePrice_sqrtpowers;
        
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
        retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
      endif
     if (i==6)
           
        powers = AwayPrice_powers;
        epowers = AwayPrice_epowers;
        lnpowers = AwayPrice_lnpowers;
        sqrtpowers = AwayPrice_sqrtpowers;
       for j=1:length(powers),
         retval=[retval Xth.^powers(1,j)];
       endfor
       for j=1:length(epowers),
         retval=[retval (e.^Xth).^epowers(1,j)];
       endfor
       for j=1:length(lnpowers),
         retval=[retval log(1 + Xth).^lnpowers(1,j)];
       endfor
       for j=1:length(sqrtpowers),
         retval=[retval Xth.^(lnpowers(1,j)*0.5)];
       endfor
    endif
 endfor 
endfunction
