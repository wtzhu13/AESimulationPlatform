%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: Ѱ����һ֡ͼƬ
%% --------------------------------
function nextFrameName = nextFrame(targetLu)
    global image;
    currentLu = globalExposure(image);
    disp(currentLu);
    % ���㵱ǰ���Ⱥ�Ŀ�����ȵĲ���
    detaLu = currentLu - targetLu;
    if detaLu > 0
        disp('currentLu is too bright');
    else
        disp('currentLu is too dark');
    end
    nextFrameName = 'FN_18_GAIN_1_ET_8000.jpg';
end