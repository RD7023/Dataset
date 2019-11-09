location = 'C:\Users\ZBook\Desktop\Dataset\Serie A\2014-2015\Games_Data'
files = dir(location);

files_names=[];

for i=3:size(files,1),
  files_names=[files_names; files(i).name];
endfor;

files_names



%All files
for i=1:size(files_names,1),
  fid = fileread([location '\'  files_names(i,:)]);
  rows = strsplit(fid);
  for j = 2:size(rows,2),
    rows{1,j}=strrep(rows{1,j},'a','0');
    rows{1,j}=strrep(rows{1,j},'h','1');
  endfor
  newfile=fopen([location '\'  files_names(i,:)],'w');
  for j=1:size(rows,2),
    fputs(newfile,rows{1,j});
    fputs(newfile,"\r\n");
  endfor
  fclose(newfile);
endfor
