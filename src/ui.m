%% --------------------------------
%% author:wtzhu
%% date: 20210203
%% fuction: AE模拟平台界面设计及回调函数
%% --------------------------------

function varargout = ui(varargin)
% UI MATLAB code for ui.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ui

% Last Modified by GUIDE v2.5 30-May-2021 21:05:04

% Begin initialization code - DO NOT EDIT  mfilename
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ui_OpeningFcn, ...
                   'gui_OutputFcn',  @ui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before ui is made visible.
function ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ui (see VARARGIN)

% Choose default command line output for ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_target_Callback(hObject, eventdata, handles)
% hObject    handle to edit_target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_target as text
%        str2double(get(hObject,'String')) returns contents of edit_target as a double


% --- Executes during object creation, after setting all properties.
function edit_target_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_current as text
%        str2double(get(hObject,'String')) returns contents of edit_current as a double


% --- Executes during object creation, after setting all properties.
function edit_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_frames_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frames as text
%        str2double(get(hObject,'String')) returns contents of edit_frames as a double


% --- Executes during object creation, after setting all properties.
function edit_frames_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% count = 1;
% target = str2num(get(handles.edit_target,'String'));
% disp(target);
% while count < 4
%     image = imread(sprintf('./img/%d.jpg', count));
%     imshow(image);
%     set(handles.edit_frames,'string',count);
%     pause(1);
%     count = count + 1;
% end 
global image;
global path;
detaLu = 255;
framesCount = 1;
if image == 0
    myicon = imread('./rsc/info.png');
    h = msgbox('You need choose first frame image!','Prompt','custom', myicon);
else
    set(handles.edit_frames,'string',framesCount);
    while detaLu > 16
        % 计算当前图像的亮度
        currentLu = globalExposure(image);
        disp(currentLu);
        set(handles.edit_current, 'string', currentLu);
        
        target = str2num(get(handles.edit_target,'String'));
        detaLu = abs(currentLu - target);
        disp(detaLu);
        
        % 调试阶段暂定1S便于观察更新变化
        pause(1);
        % 更新帧数统计值
        framesCount = framesCount + 1;
        set(handles.edit_frames,'string',framesCount);
        
        % 获取下一帧图像
        nextFrameFileName = nextFrame(target);
        % 获取下一帧图像的参数，并设置到平台界面
        parametetsList = splitParameters(nextFrameFileName);
        set(handles.edit_FN, 'string', parametetsList(2));
        set(handles.edit_gain, 'string', parametetsList(4));
        set(handles.edit_exposureT, 'string', parametetsList(6));
        % 更新显示区域显示的图片内容
        image = imread([fullfile(path, nextFrameFileName)]);
        imshow(image);
        currentLu = globalExposure(image);
        disp(currentLu);
        set(handles.edit_current, 'string', currentLu);
        % 重新计算detaLu的值
        detaLu = 10;
    end    
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% 去掉坐标轴及坐标
set(gca,'XColor',get(gca,'Color')) ;% 这两行代码功能：将坐标轴和坐标刻度转为白色
set(gca,'YColor',get(gca,'Color'));
 
set(gca,'XTickLabel',[]); % 这两行代码功能：去除坐标刻度
set(gca,'YTickLabel',[]);


% --- Executes on button press in pushbutton_first_frame.
function pushbutton_first_frame_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_first_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 选择第一帧采样图片
initUI(handles);
global image;     % 定义全局变量方便计算
global path;
image = 0;
[file, path] = uigetfile({'*.jpg; *.png, *.bmp, *.jpeg'}, 'img select'); %进入文件夹选框

if file == 0
    myicon = imread('./rsc/info.png');
    h = msgbox('Nothing had been choosen!','Prompt','custom', myicon);
else
    parametetsList = splitParameters(file);
    set(handles.edit_FN, 'string', parametetsList(2));
    set(handles.edit_gain, 'string', parametetsList(4));
    set(handles.edit_exposureT, 'string', parametetsList(6));
    disp([fullfile(path,file)]);
    image = imread([fullfile(path,file)]);
    imshow(image);
end

function edit_FN_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_FN as text
%        str2double(get(hObject,'String')) returns contents of edit_FN as a double


% --- Executes during object creation, after setting all properties.
function edit_FN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gain_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gain as text
%        str2double(get(hObject,'String')) returns contents of edit_gain as a double


% --- Executes during object creation, after setting all properties.
function edit_gain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_exposureT_Callback(hObject, eventdata, handles)
% hObject    handle to edit_exposureT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_exposureT as text
%        str2double(get(hObject,'String')) returns contents of edit_exposureT as a double


% --- Executes during object creation, after setting all properties.
function edit_exposureT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_exposureT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initUI(handles)
% handles    structure with handles and user data (see GUIDATA)
% 初始化UI界面，保证连续运行时，每次选择第一帧图像时参数能回归初始值
set(handles.edit_FN, 'string', '');
set(handles.edit_gain, 'string', '');
set(handles.edit_exposureT, 'string', '');
%set(handles.edit_target, 'string', '128');
set(handles.edit_current, 'string', '');
set(handles.edit_frames, 'string', '');



% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openFile_Callback(hObject, eventdata, handles)
% hObject    handle to openFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_first_frame_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
quit()


% --------------------------------------------------------------------
function help_1_Callback(hObject, eventdata, handles)
% hObject    handle to help_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('./doc/doc.html')


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myicon = imread('./rsc/about.png');
h = msgbox('https://github.com/wtzhu13','Prompt','custom', myicon);


% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton_run_Callback(hObject, eventdata, handles)

