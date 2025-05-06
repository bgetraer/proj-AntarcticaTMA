projroot = '/Users/f006h2v/ISSM-Dartmouth/issmjpl/proj-getraer/proj-AntarcticaTMA/';
addpath(fullfile(projroot,'functions'));
datapath = fullfile(projroot,'/data/external/tma/photos/');

%% flightlines chosen by inspecting data at PGC mapviewer https://www.arcgis.com/home/webmap/viewer.html?webmap=c435036b150843428d5413ffb7260ef2
run('./amundsenseaflightlines.m');

% get flightline feature layer attribute table
disp('Getting feature layer attribute table for flightlines:');
datadir='../data';
T = getflightlines(tma_num,datadir);
% drop repeated data
[~,i]=unique(T.tma_num);
T = T(i,:);
disp(T);

% total number of photocenters
n = sum(T.photoEnd - T.photoStart +1);
fprintf('number of photocenters: %i\n',n)
fprintf('number of photos: %i\n',n*3)
fprintf('approximate size (80MB per file): %0.2fGB\n',n*3*80*0.001)
