function currentLu = globalExposure(image)
% globalExposure.m    Calculate the global mean brightness of the image
%   Input:
%       image       The input image which uesd to calculate Lu   
%   Output:
%       currentLu   The Lu of input image, the result of this fuc
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-04
    hsl = rgb2hsl(image);
    currentLu = im2uint8(mean(mean(hsl(:,:,3))));
end