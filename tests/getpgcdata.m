addpath('/Users/f006h2v/ISSM-Dartmouth/issmjpl/proj-getraer/proj-AntarcticaTMA/functions');

%% flightlines chosen by inspecting data at PGC mapviewer https://www.arcgis.com/home/webmap/viewer.html?webmap=c435036b150843428d5413ffb7260ef2
flights = [1877,1900,1901,1902,1904,1908,1909,1910,2034,2035,2036,2037,2177,5136,5137];
tma_num = 1908;
res = 'high';

% get flightline feature layer attributes
datadir='../data';
T = getflightlines(flights,datadir);
disp(T);

%% Connect to FTP host
%host = 'ftp.data.pgc.umn.edu';
%s = ftp(host);
%folder = fullfile('aerial/usgs/tma/photos/',res,sprintf('CA%4.0i',tma_num));
%dir(s,folder);

function T = getflightlines(tma_num,datadir)
	fname = fullfile(datadir,'/external/tma/index/USGS_TMA_Index_Flightlines/USGS_TMA_Index_Flightlines.dbf');
	if ~exist(fname)
		url = 'https://data.pgc.umn.edu/aerial/usgs/tma/index/USGS_TMA_Index_Flightlines.zip';
		folder = fullfile(datadir,'external/tma/index/USGS_TMA_Index_Flightlines');
		unzip(url,folder)
	end
	[data, names] = dbfread(fname);
	T = cell2table(data,'VariableNames',names);
	T.tma_num=str2double(T{:,2});
	T.acq_date = datetime(T.acq_date,'InputFormat','yyyyMMdd');
	T.high_url = string(T.high_url);
	T.med_url = string(T.med_url);
	% extract just the flight lines we care about
	names = {'tma_num','acq_date','photoStart','photoEnd','length_km','altitudeFT','high_url'};
	T = sortrows(T(ismember(T.tma_num,tma_num),names),'acq_date');
end
