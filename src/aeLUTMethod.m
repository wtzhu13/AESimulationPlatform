function nextUs = aeLUTMethod(target)
% aeLUTMethod.m    The kernel AE algorithm
%   Input:
%       target    The target Lu 
%   Output:
%       nextUs    The exposure time of next frame
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-05
load('brighenessLUT.mat');
nextUs = brighenessLUT(target);

