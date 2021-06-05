function fileList = judgeFileType(walkedPath, varargin)
% judgeFileType.m   Traverse the path and judge the type of the file
%   Input:
%       walkedPath  The path need to be traversed
%       varargin    The type you need to choose
%   Output:
%       fileList    The filtered result 
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-05

% get the file list, the number of files and the number of type need to
% judge
files = dir(walkedPath);
filesNum = length(files);
typeNum = length(varargin);
fileList = {};
index = 1;
% disp(varargin(2))
for i = 1: filesNum
    % Filter out hidden files
    if (strcmp(files(i).name, '.') == 1) ...
            || (strcmp(files(i).name, '..') == 1)
        continue;
    end 
    % Filter out dir
    if files(i).isdir == 1
        continue;
    end
    for j = 1: typeNum
        if ~isempty(strfind(files(i).name, char(varargin(j))))
            fileList{index} = fullfile(walkedPath, '\', files(i).name);
            index = index + 1;
        end
    end
end





