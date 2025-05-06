clear

<<<<<<< HEAD


path_to_data = 'docs/*'; % the source path within remote tma where the data to be downloaded live
target_repo = '../data/external/'; % the target directory where the local tma data live
clobber = 1;

source = fullfile(source_repo,path_to_data);
target = fullfile(target_repo,path_to_data);

getPGCdata(path_to_data,proj_root,clobber)
=======
%clobber = 1;

%getPGCdata(path_to_data,proj_root,clobber)
>>>>>>> 3e91dbe (trying to fix problems)
% This function checks existence of local files after confirming their existence on the server. The purpose of
% this workflow is to allow for wildcards in the data paths, where we do not know if the local system has all 
% matching files until we check.
%
% Example: 

% paths to the remote and local tma data locations
hostname = 'ftp.data.pgc.umn.edu'; % the FTP host
source_repo = 'aerial/usgs/tma'; % the source directory where the remote tma data live
target_repo = '../data/external/tma'; % the target directory where the local tma data live

fprintf('Begin FTP data retrieval\n')
% open connection to Polar Geospatial Center public HTTP data repository via FTP
fprintf('   opening FTP connection to %s\n',hostname);
s = ftp(hostname);

% locate remote files in PGC and build dir structure array of file list
cd(s,source_repo);
if ischar(path_to_data)
% locate files in path_to_data (one file path with or without wildcards)
	f_info=dir(s,path_to_data);
elseif iscell(path_to_data)
% locate files in each element of path_to_data (each one file path with or without wildcards)
	f_info=dir(s,path_to_data{1});
	for i=2:length(path_to_data)
		f_info(end+1)=dir(s,path_to_data{i});
	end
end

fprintf('   %i matching files\n',length(f_info));

% Download contents from pgc into target directory
% Default ftp is to recreate full directory structure of the source repository in the target repository.
% This script removes the source_repository from the remote file path when downloading, so that only
% the directory structure lower than the source_repository is recreated.
for i=1:length(f_info)	
	fprintf('   %i/%i: %s (%i bytes)\n',i,length(f_info),f_info(i).name,f_info(i).bytes);
	%relativepath = extractAfter(f_info(i).name,source_repo);
	%local_exist = logical(exist(fullfile(target_repo,relativepath)));
	relativepath = f_info(i).name;
	local_exist = logical(exist(fullfile(target_repo,relativepath)));
	%fprintf('   checking if file exists in target_repo: ')
	%fprintf('%i\n',local_exist)
	if local_exist & ~clobber 
		fprintf('      file exists in local directory\n',relativepath);
	else
		fprintf('      downloading file\n');
		tic;
		downloadPaths=mget(s,relativepath,target_repo);
		dt = toc;
		fprintf('      done. elapsed time = %0.2f seconds\n',toc);
	end
end


%% close FTP connection
%fprintf('   closing FTP connection to %s\n',hostname);
%close(s);
%fprintf('Done.\n');
