projroot = '/Users/f006h2v/ISSM-Dartmouth/issmjpl/proj-getraer/proj-AntarcticaTMA/';
addpath(fullfile(projroot,'functions'));
datapath = fullfile(projroot,'/data/external/tma/photos/');

%% flightlines chosen by inspecting data at PGC mapviewer https://www.arcgis.com/home/webmap/viewer.html?webmap=c435036b150843428d5413ffb7260ef2
tma_num = [1877,1904,2034];
photo_num = {[236:255],[177:194],[74:96]};

res = 'high';

% get flightline feature layer attribute table
disp('Getting feature layer attribute table for flightlines:');
datadir='../data';
T = getflightlines(tma_num,datadir);
disp(T);

% download data
%for i = 
%	url = T.high_url(i);
%	filename = extractAfter(T.high_url(i),'data.pgc.umn.edu')
%	%outfilename = websave(filename,url);
%end

%% Connect to FTP host
host = 'ftp.data.pgc.umn.edu';
s = ftp(host);
folder = extractAfter(T.high_url(T.tma_num==tma_num(2)),'data.pgc.umn.edu');
% Get L, V, R directory names
Ldir = dir(s,fullfile(folder,'*L')).name;
Vdir = dir(s,fullfile(folder,'*V')).name;
Rdir = dir(s,fullfile(folder,'*R')).name;
Lprefix = extractAfter(Ldir,fullfile(folder,'/'));
Vprefix = extractAfter(Ldir,fullfile(folder,'/'));
Rprefix = extractAfter(Rdir,fullfile(folder,'/'));



%fullfile(Ldir,compose([Lprefix '%04i.tif.gz'],photo_num{2}))
for i=1:numel(photo_num{2})
	% L
	fname = compose([Lprefix '%04i.tif.gz'],photo_num{2}(i));
	dir(s,fullfile(Ldir,fname))
end


%folder = fullfile('aerial/usgs/tma/photos/',res,sprintf('CA%4.0i',tma_num));
%dir(s,folder);
