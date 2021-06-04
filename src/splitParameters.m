%% --------------------------------
%% author:wtzhu
%% date: 20210526
%% fuction: split parameters from fileName
%% --------------------------------
function parametersList = splitParameters(file)
    parametersList = regexp(file, '_', 'split');
    lastStr = char(cellstr(parametersList(6)));        % transform cell type to char 
    etimeList = regexp(lastStr, '\.', 'split');
    exposureT = etimeList(1);
    parametersList(6) = exposureT;
end