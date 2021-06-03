%% --------------------------------
%% author:wtzhu
%% date: 20210523
%% fuction: 寻找下一帧图片
%% --------------------------------
function nextFrameName = nextFrame(targetLu, currentFile)
    global image;
    currentLu = int8(globalExposure(image));
    disp(currentLu);
    % 计算当前亮度和目标亮度的差异
    detaLu = currentLu - targetLu;
    absDetaLu = abs(detaLu);
    parametersList = splitParameters(currentFile);
    t = parametersList(6);
    us = str2num(char(t));
    if absDetaLu <= 16
        disp('currentLu is OK');
        nextFrameName = currentFile;
    else
        if absDetaLu > 16 && absDetaLu <= 32
            disp('deta is 1/16');
            detaUs = us / 16;
        else
            if absDetaLu > 32 && absDetaLu <= 64
                disp('deta is 1/8');
                detaUs = us / 8;
            else
               if absDetaLu > 64 && absDetaLu <= 128
                   disp('deta is 1/4');
                   detaUs = us / 4;
                   disp(detaUs)
               else
                   if absDetaLu > 128 && absDetaLu <= 255
                       disp('deta is 1/2');
                       detaUs = us / 2;
                   end
               end
            end   
        end
        disp(us)
        disp(absDetaLu / detaLu)
        disp(detaUs)
        disp(us - (absDetaLu / detaLu) * detaUs)
        us = round(us - int32((absDetaLu / detaLu) * detaUs));
        disp(us);
        if rem(us, 10) < 5
            us = 10 * fix(us / 10);
        else
            us = 10 * (fix(us / 10) + 1);
        end
        disp(us)
        us = num2str(us);
        nextFrameName = strcat('FN_18_GAIN_1_ET_', us, '.jpg');
    end
end


