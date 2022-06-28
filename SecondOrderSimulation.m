function varargout = SecondOrderSimulation(varargin)
% SECONDORDERSIMULATION MATLAB code for SecondOrderSimulation.fig
%      SECONDORDERSIMULATION, by itself, creates a new SECONDORDERSIMULATION or raises the existing
%      singleton*.
%
%      H = SECONDORDERSIMULATION returns the handle to a new SECONDORDERSIMULATION or the handle to
%      the existing singleton*.
%
%      SECONDORDERSIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECONDORDERSIMULATION.M with the given input arguments.
%
%      SECONDORDERSIMULATION('Property','Value',...) creates a new SECONDORDERSIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SecondOrderSimulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SecondOrderSimulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SecondOrderSimulation

% Last Modified by GUIDE v2.5 25-Apr-2014 15:37:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SecondOrderSimulation_OpeningFcn, ...
                   'gui_OutputFcn',  @SecondOrderSimulation_OutputFcn, ...
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
end

% --- Executes just before SecondOrderSimulation is made visible.
function SecondOrderSimulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structur4e with handles and user data (see GUIDATA)
% varargin   command line arguments to SecondOrderSimulation (see VARARGIN)

% Choose default command line output for SecondOrderSimulation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SecondOrderSimulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);
InitiateData;
global MyHandles;
MyHandles = handles;
axes(handles.axes2);
text(0,0.5,'$K$','interpreter','latex','fontsize',12);
axes(handles.axes3);
text(0,0.5,'$\zeta$','interpreter','latex','fontsize',12);
axes(handles.axes4);
text(0,0.5,'$\omega_n$','interpreter','latex','fontsize',12);
end

% --- Outputs from this function are returned to the command line.
function varargout = SecondOrderSimulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function gain_value_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to gain_value_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gain_value_textbox as text
%        str2double(get(hObject,'String')) returns contents of gain_value_textbox as a double
end

% --- Executes during object creation, after setting all properties.
function gain_value_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gain_value_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function damping_value_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to damping_value_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of damping_value_textbox as text
%        str2double(get(hObject,'String')) returns contents of damping_value_textbox as a double
end

% --- Executes during object creation, after setting all properties.
function damping_value_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to damping_value_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function natural_frequency_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to natural_frequency_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of natural_frequency_textbox as text
%        str2double(get(hObject,'String')) returns contents of natural_frequency_textbox as a double
end

% --- Executes during object creation, after setting all properties.
function natural_frequency_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to natural_frequency_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
global Data;
global UpdateTimer;

if Data.Running == 1
    stop(UpdateTimer);
    delete(UpdateTimer);
end
delete(hObject);
end

% --- Executes on button press in start_stop_button.
function start_stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data;
global UpdateTimer;

if (Data.Running == 0)
    Data.Running = 1;
    start(UpdateTimer);
    set(handles.start_stop_button,'string','stop');
else
    Data.Running = 0;
    stop(UpdateTimer);
    set(handles.start_stop_button,'string','start');
end
end
% --- Executes on button press in data_update_button.
function data_update_button_Callback(hObject, eventdata, handles)
% hObject    handle to data_update_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data;
buffer1 = str2num(get(handles.gain_value_textbox,'string'));
if (~isempty(buffer1))
    Data.K = buffer1;
else
    set(handles.gain_value_textbox,'string',num2str(Data.K));
end

buffer1 = str2num(get(handles.damping_value_textbox,'string'));
if (~isempty(buffer1))
    Data.zeta = buffer1;
else
    set(handles.damping_value_textbox,'string',num2str(Data.zeta));
end

buffer1 = str2num(get(handles.natural_frequency_textbox,'string'));
if (~isempty(buffer1))
    Data.omega = buffer1;
else
    set(handles.natural_frequency_textbox,'string',num2str(Data.omega));
end
end


% --- Executes on mouse press over axes background.
function systemaxes_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to systemaxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data;
if (Data.Running==1)
    buffer = get(handles.systemaxes,'currentpoint');
    x = buffer(1,1);
    y = buffer(1,2);
    Data.x(Data.N:end) = y;
end
end
