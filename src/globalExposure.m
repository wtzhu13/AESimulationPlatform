%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: ȫ��ƽ�����
%% --------------------------------

function [currentLu] = globalExposure(image)
    hsl = rgb2hsl(image);
    % ����ȫ��ƽ������ֵ
    currentLu = im2uint8(mean(mean(hsl(:,:,3))));
end