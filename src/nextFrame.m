function nextFrameName = nextFrame(targetLu, currentFile)
% nextFrame.m    Find the fileName of the next frame image
%   Input:
%       targetLu        The target Lu          
%       currentFile     The fileName of current frame image
%   Output:
%       nextFrameName   FileName of the next frame image 
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-04
    global image;
    currentLu = int32(globalExposure(image));
    fprintf('currentLu: %d\n', currentLu);
    % calculate the difference between target and current Lu
    detaLu = currentLu - targetLu;
    parametersList = splitParameters(currentFile);
    t = parametersList(6);
    % run ae algorithm to find the next frame parameters
%     us = num2str(ae(detaLu, t));
    us = num2str(aeEquationMethod(targetLu));
    nextFrameName = strcat('FN_18_GAIN_1_ET_', us, '.jpg');
    fprintf('the nextFrame: %s\n', nextFrameName);
end


