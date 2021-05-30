%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: 寻找下一帧图片
%% --------------------------------
function nextFrameName = nextFrame(targetLu)
    global image;
    currentLu = globalExposure(image);
    disp(currentLu);
    % 计算当前亮度和目标亮度的差异
    detaLu = currentLu - targetLu;
    if detaLu > 0
        disp('currentLu is too bright');
    else
        disp('currentLu is too dark');
    end
    nextFrameName = 'FN_18_GAIN_1_ET_8000.jpg';
end