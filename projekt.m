function varargout = projekt(varargin)
% PROJEKT MATLAB code for projekt.fig
%      PROJEKT, by itself, creates a new PROJEKT or raises the existing
%      singleton*.
%
%      H = PROJEKT returns the handle to a new PROJEKT or the handle to
%      the existing singleton*.
%
%      PROJEKT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKT.M with the given input arguments.
%
%      PROJEKT('Property','Value',...) creates a new PROJEKT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projekt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projekt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projekt

% Last Modified by GUIDE v2.5 03-Jun-2014 18:30:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @projekt_OpeningFcn, ...
    'gui_OutputFcn',  @projekt_OutputFcn, ...
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


% --- Executes just before projekt is made visible.
function projekt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projekt (see VARARGIN)

% Choose default command line output for projekt
handles.output = hObject;
set(handles.wartoscsnr,'String',1);
handles.tekstowo = 'Wpisz tekst';
handles.suwak = 1;
handles.bpskbutton = 1;
handles.czyszum = 0;
handles.bity = 1;
handles.bityber = 1;
set(handles.ilebitow,'String',1);
set(handles.ilebitowber,'String',1);
set(handles.blad,'String','-');
% set(handles.tekstowo,'String','Wpisz tekst');
axes(handles.wykresik);
zoom on;
pan on;


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes projekt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projekt_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.suwak = get(hObject, 'Value');
set(handles.wartoscsnr,'String',get(hObject, 'Value'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function odebrana_CreateFcn(hObject, eventdata, handles)
% hObject    handle to odebrana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tekstwiadomosci_Callback(hObject, eventdata, handles)
% hObject    handle to tekstwiadomosci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tekstwiadomosci as text
%        str2double(get(hObject,'String')) returns contents of tekstwiadomosci as a double
handles.tekstwiadomosci = get(hObject, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function tekstwiadomosci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tekstwiadomosci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttontekst.
function buttontekst_Callback(hObject, eventdata, handles)
% hObject    handle to buttontekst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%if (handles.tekstowo ~= null || handles.tekstowo ~='')
if (isempty(handles.tekstowo)==0)
snr = handles.suwak;
setappdata(0,'t',0);
setappdata(0,'c',0);
setappdata(0,'lm',0);
setappdata(0,'m',0);
setappdata(0,'Tb',0);
setappdata(0,'mod',0);
setappdata(0,'dem',0);
setappdata(0,'mod_szum',0);
message = wpisz_recznie(handles.tekstowo);
if (handles.bpskbutton==1)
    if (handles.czyszum==1)
        received = bpskAWGN(snr,message);        
    else
        received = bpsk(message);
    end
else
    if (handles.czyszum==1)
        received = dpskAWGN(snr,message);        
    else
        received = dpsk(message);             
    end
end

set(handles.odebrana,'String', otrzymano(received));
else
    h = msgbox('Error - brak wiadomosci');
end
set(handles.blad,'String',sum(abs(received - message)));
axes(handles.wykresik);
cla;
lista_Callback(hObject, eventdata, handles);
guidata(hObject, handles);

% --- Executes on button press in bRandom.
function bRandom_Callback(hObject, eventdata, handles)
% hObject    handle to bRandom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
message = randomowo(handles.bity);
setappdata(0,'t',0);
setappdata(0,'c',0);
setappdata(0,'lm',0);
setappdata(0,'m',0);
setappdata(0,'Tb',0);
setappdata(0,'mod',0);
setappdata(0,'dem',0);
setappdata(0,'mod_szum',0);
snr = handles.suwak;
if (handles.bpskbutton==1)
    if (handles.czyszum==1)
        received = bpskAWGN(snr,message);        
    else
        received = bpsk(message);
    end
else
    if (handles.czyszum==1)
        received = dpskAWGN(snr,message);        
    else
        received = dpsk(message);             
    end
end
set(handles.blad,'String',sum(abs(received - message)));
axes(handles.wykresik);
cla;
lista_Callback(hObject, eventdata, handles);
guidata(hObject, handles);




% --- Executes on slider movement.
function bity_Callback(hObject, eventdata, handles)
% hObject    handle to bity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.bity = round(get(hObject, 'Value'));
set(handles.ilebitow,'String',round(get(hObject, 'Value')));
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function bity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in czyszum.
function czyszum_Callback(hObject, eventdata, handles)
% hObject    handle to czyszum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of czyszum
handles.czyszum = get(hObject,'Value');

guidata(hObject, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over dpskbutton.
function dpskbutton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to dpskbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function bpskbutton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bpskbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag')
    case 'bpskbutton'
        handles.bpskbutton = 1;
        
        
    case 'dpskbutton'
        handles.bpskbutton = 0;
        
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function tekstowo_Callback(hObject, eventdata, handles)
% hObject    handle to tekstowo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tekstowo as text
%        str2double(get(hObject,'String')) returns contents of tekstowo as a double
handles.tekstowo = get(hObject, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function tekstowo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tekstowo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function odebrana_Callback(hObject, eventdata, handles)
% hObject    handle to odebrana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of odebrana as text
%        str2double(get(hObject,'String')) returns contents of odebrana as a double


% --- Executes on selection change in lista.
function lista_Callback(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista

lista = get(handles.lista,'Value');

axes(handles.wykresik);
cla;
switch lista
    case 1        %%%%%%%%%%%%%%%%%%%%%%%%%%% noœna
        lm=getappdata(0,'lm');
        
        Tb=getappdata(0,'Tb');
        c=getappdata(0,'c');
        x=1/Tb:1/Tb:lm;
        hold on
        for i=0:lm-1
            for j=1:length(c)
                d(length(c)*i+j) = c(j);
            end            
        end
        plot(x,d);
        axis([0 lm min(c)-0.3 max(c)+0.3]);
        xlim([0 20]);
        hold off
        title('noœna');  
        zoom on;
    
    case 2              %%%%%%%%%%%%%%%%% sygna³‚ zmodulowany
        Tb=getappdata(0,'Tb');
        lm=getappdata(0,'lm');
        mod=getappdata(0,'mod');
        x=1/Tb:1/Tb:lm;
        plot(x,mod);
        title('sygnal zmodulowany');
        xlim([0 20]);
        zoom on;
        
        
    case 3              %%%%%%%%%%%%%%%%%%%%%%%% sygna³ zmodulowany i zaszumiony
        Tb=getappdata(0,'Tb');
        lm=getappdata(0,'lm');
        mod_szum=getappdata(0,'mod_szum');
        if (mod_szum == 0)
            set(handles.lista,'Value',2);
            lista_Callback(hObject, eventdata, handles);
        else
        x=1/Tb:1/Tb:lm;
        plot(x,mod_szum);
        title('sygnal w odbiorniku');
        xlim([0 20]);
        zoom on;
        end
        
    case 4              %%%%%%%%%%%%%%%%%%%%%%%  sygna³‚ wejœciowy
        m=getappdata(0,'m');
        lm=getappdata(0,'lm');
        hold on;
        stairs(0:lm-1,m);
        plot(lm-1:0.001:lm,m(lm), 'b-');
        axis([0 lm -0.5 1.5]);
        title('sygnal wejœciowy');
        xlim([0 20]);
        hold off;
        zoom on;
        
    case 5              %%%%%%%%%%%%%%%%%%%%%%% wiadomoœæ odebrana
        dem=getappdata(0,'dem');
        lm=getappdata(0,'lm');
        hold on;
        stairs(0:lm-1,dem);
        plot(lm-1:0.001:lm,dem(lm), 'b-');
        axis([0 lm -0.5 1.5]);
        title('sygnal wyjœciowy');
        xlim([0 20]);
        hold off;
        zoom on;
        
    
end


guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function lista_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag')
    case 'bpskBER'
        handles.bpskBER = 1;
        
        
    case 'dpskBER'
        handles.bpskBER = 0;
        
end

guidata(hObject, handles);


% --- Executes on button press in BER.
function BER_Callback(hObject, eventdata, handles)
% hObject    handle to BER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.wykresik);
cla;
snr = -4:13;        
ebn0=[];

            

    
wiadomosc = randomowo(handles.bityber);       %%%%%%%%%%%%
if (handles.bpskBER==1)
    for step=1:length(snr)
        ebn0(step)= 10^(snr(step)/10);
        Pe(step) = 0.5*erfc(sqrt(ebn0(step)));         %% teoretyczny BER
    end
 h = waitbar(0,'Proszê czekaæ...');
            steps = length(snr);       
    for step=1:steps
        message = bpsk_ber(snr(step),wiadomosc);
        ter(step)=bit_error(wiadomosc,message);
        
        waitbar(step/steps)
    end
    close(h)
    semilogy(snr,Pe,'-og');
        hold on;    
     ber=ter./length(wiadomosc);     
     semilogy(snr,ber,'or');
     hold off;
else
     load('ber_dpsk.mat');
     semilogy(ebno0,ber0,'g');    %%% teoretyczny ber dla dpsk
     hold on;
     
     h = waitbar(0,'Proszê czekaæ...');
            steps = length(snr);       
    for step=1:steps
        message = dpsk_ber(snr(step),wiadomosc);
        ter(step)=bit_error(wiadomosc,message);
        waitbar(step/steps)
    end
    close(h)
     ber=ter/length(wiadomosc);    
     semilogy(snr,ber,'-or');
     hold off;     
end

set(handles.blad,'String',sum(abs(ter)));



% --- Executes on slider movement.
function bityber_Callback(hObject, eventdata, handles)
% hObject    handle to bityber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.bityber = round(get(hObject, 'Value'));
set(handles.ilebitowber,'String',round(get(hObject, 'Value')));
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function bityber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bityber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function blad_Callback(hObject, eventdata, handles)
% hObject    handle to blad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blad as text
%        str2double(get(hObject,'String')) returns contents of blad as a double


% --- Executes during object creation, after setting all properties.
function blad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
