%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: calculate the global mean brightness of the image
%% --------------------------------

function [currentLu] = globalExposure(image)
    hsl = rgb2hsl(image);
    currentLu = im2uint8(mean(mean(hsl(:,:,3))));
end