global image;
image = imread('E:\\Fred\\ISP\\AEDataSet\\FN_18_GAIN_1_ET_300.jpg');
nextFrameName = nextFrame(128, 'FN_18_GAIN_1_ET_300.jpg');
disp(nextFrameName)

%parametetsList = splitParameters('FN_18_GAIN_1_ET_300.jpg');
%t = parametetsList(6)