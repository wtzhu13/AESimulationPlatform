% RGB in matlab
[file, path] = uigetfile({'*.jpg; *.png, *.bmp, *.jpeg'}, 'img select'); %进入文件夹选框
if file == 0
    myicon = imread('./rsc/info.png');
    h = msgbox('Nothing had been choosen!','Prompt','custom', myicon);
else
    disp([fullfile(path,file)]);
    image = imread([fullfile(path,file)]);
    hsl = rgb2hsl(image);
    imshow(hsl(:,:,3), []);
end
