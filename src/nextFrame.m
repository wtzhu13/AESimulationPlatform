%% --------------------------------
%% author:wtzhu
%% date: 20210531
%% fuction: return the next frame's fileName
%% --------------------------------
function nextFrameName = nextFrame(targetLu, currentFile)
    global image;
    currentLu = int32(globalExposure(image));
    fprintf('currentLu: %d\n', currentLu);
    % calculate the difference between target and current Lu
    detaLu = currentLu - targetLu;
    parametersList = splitParameters(currentFile);
    t = parametersList(6);
    % run ae algorithm to find the next frame parameters
    us = num2str(ae(detaLu, t));
    nextFrameName = strcat('FN_18_GAIN_1_ET_', us, '.jpg');
    fprintf('the nextFrame: %s\n', nextFrameName);
end


