function parametersList = splitParameters(file)
% splitParameters.m    Split parameters from the file name
%   Input:
%       file            The fileName 
%   Output:
%       parametersList  The cell of parameters 
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-04
    parametersList = regexp(file, '_', 'split');
    lastStr = char(cellstr(parametersList(6)));        % transform cell type to char 
    etimeList = regexp(lastStr, '\.', 'split');
    exposureT = etimeList(1);
    parametersList(6) = exposureT;
end