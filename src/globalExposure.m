%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: 全局平均测光
%% --------------------------------

function [currentLu] = globalExposure(image)
    hsl = rgb2hsl(image);
    % 计算全局平均亮度值
    currentLu = im2uint8(mean(mean(hsl(:,:,3))));
end