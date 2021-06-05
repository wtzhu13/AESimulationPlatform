% exposureCurve.m   
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
%       function:   get the relationship between ET and LU
% Last Modified by wtzhu v1.0 2021-06-05
clc;
clear;
close all;

files = dir('./');
filesNum = length(files);
flag = 0;
for ii= 1: filesNum
    if ~isempty(strfind(files(ii).name, 'luList.mat'))
        flag = 1;
    end
end

% if luList.mat is existed, need not to calculate the relationship again
if ~flag
    % fileList = judgeFileType('../AEDataSet', '.jpg');
    fileList = judgeFileType('../AEDataSet', '.jpg');
    len = length(fileList);
    luList = zeros(len, 2);
    % get lu of each image and put into luList
    for i = 1: len
        l1 = regexp(fileList{i}, '\.', 'split');
        l2 = regexp(l1{3}, '_', 'split');
        t = str2double(l2{6});

        img = imread(char(fileList(i)));
        luList(i, 2) = globalExposure(img);
        luList(i, 1) = t;
    end
    save('luList.mat', 'luList');
else
    load('luList.mat');
end

% plot the curve
len = length(luList);
plot(luList(:,1), luList(:,2), '.');
hold on;
x = 300: 30300;
y = -1420 .*x .^ (-0.1689) + 471.4;
plot(x, y, 'r.')
title('\fontsize{14} \bf relationship between exposure and L');
xlabel('exposure time/us');
ylabel('Luminance');
axis([0, 30300, 0, 260]);
legend('real data', 'Fitting curve');



