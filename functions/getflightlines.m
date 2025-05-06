function T = getflightlines(tma_num,datadir)
   fname = fullfile(datadir,'/external/tma/index/USGS_TMA_Index_Flightlines/USGS_TMA_Index_flightlines.dbf');
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
	% dont return duplicates
	[~,i]=unique(T.tma_num);
	T = T(i,:);
end
