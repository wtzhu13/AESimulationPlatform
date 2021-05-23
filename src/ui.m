%% --------------------------------
%% author:wtzhu
%% date: 20210203
%% fuction: AEģ��ƽ̨������Ƽ��ص�����
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

% Last Modified by GUIDE v2.5 23-May-2021 11:03:59

% Begin initialization code - DO NOT EDIT
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
        currentLu = globalExposure(image);
        disp(currentLu);
        set(handles.edit_current, 'string', currentLu);
        target = str2num(get(handles.edit_target,'String'));
        detaLu = abs(currentLu - target);
        disp(detaLu);
        pause(1);
        framesCount = framesCount + 1;
        set(handles.edit_frames,'string',framesCount);
        nextFrameFileName = nextFrame();
        image = imread([fullfile(path, nextFrameFileName)]);
        imshow(image);
        currentLu = globalExposure(image);
        disp(currentLu);
        set(handles.edit_current, 'string', currentLu);
        detaLu = 10;
    end    
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% ȥ�������ἰ����
set(gca,'XColor',get(gca,'Color')) ;% �����д��빦�ܣ��������������̶�תΪ��ɫ
set(gca,'YColor',get(gca,'Color'));
 
set(gca,'XTickLabel',[]); % �����д��빦�ܣ�ȥ������̶�
set(gca,'YTickLabel',[]);


% --- Executes on button press in pushbutton_first_frame.
function pushbutton_first_frame_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_first_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ѡ���һ�����ͼƬ
global image;     % ����ȫ�ֱ����������
global path;
image = 0;
[file, path] = uigetfile({'*.jpg; *.png, *.bmp, *.jpeg'}, 'img select'); %�����ļ���ѡ��
if file == 0
    myicon = imread('./rsc/info.png');
    h = msgbox('Nothing had been choosen!','Prompt','custom', myicon);
else
    disp([fullfile(path,file)]);
    image = imread([fullfile(path,file)]);
    imshow(image);
end