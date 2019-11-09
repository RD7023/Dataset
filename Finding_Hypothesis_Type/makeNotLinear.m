## Copyright (C) 2019 ZBook
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} makeNotLinear (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ZBook <ZBook@DESKTOP-8DQIF4N>
## Created: 2019-08-31

function retval = makeNotLinear (X, powers,epowers, lnpowers)
 retval=[];
 for i=1:size(X,2),
   Xth=X(:,i);
   for j=1:length(powers),
     retval=[retval Xth.^powers(1,j)];
   endfor
   for j=1:length(epowers),
     retval=[retval (e.^Xth).^epowers(1,j)];
   endfor
   for j=1:length(lnpowers),
     retval=[retval log(1 + Xth).^lnpowers(1,j)];
     endfor
 endfor 
     
endfunction
