%% --------------------------------
%% author:wtzhu
%% date: 20210603
%% fuction: AE algorithm
%% --------------------------------
function nextUs = ae(detaLu, t)
    absDetaLu = abs(detaLu);
    us = str2num(char(t));
    % calculate the detaUS by detaLu
    if absDetaLu > 16 && absDetaLu <= 32
        disp('detaUs/us is 1/16');
        detaUs = us / 16; 
    elseif absDetaLu > 32 && absDetaLu <= 64
        disp('detaUs/us is 1/8');
        detaUs = us / 8;
    elseif absDetaLu > 64 && absDetaLu <= 128
       disp('detaUs/us is 1/4');
       detaUs = us / 4;
    elseif absDetaLu > 128 && absDetaLu <= 255
       disp('detaUs/us is 1/2');
       detaUs = us / 2;
    end
    fprintf('detaUs: %d\n', int32((absDetaLu / detaLu) * detaUs));
    us = round(us - int32((absDetaLu / detaLu) * detaUs));
    % To get integer multiples of ten by rounding off
    if rem(us, 10) < 5
        us = 10 * fix(us / 10);
    else
        us = 10 * (fix(us / 10) + 1);
    end
    nextUs = us;
end
