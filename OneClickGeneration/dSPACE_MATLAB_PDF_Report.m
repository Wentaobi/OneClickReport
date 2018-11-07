%% Initialization
clear;
clc;
close all;
clf;
disp('Reporting Generating ...')
%% Import Report packge
import mlreportgen.dom.*;
import mlreportgen.report.* 
rpt = Report('VehicleReport', 'pdf');

%% Set Title page
tp = SetTitle();
add(rpt,tp); 
toc = TableOfContents;
toc.Title = Text('Table of Contents');
toc.Title.FontSize = '24pt';
% toc.Title.Color = 'green';
toc.TOCObj.NumberOfLevels = 3; 
add(rpt,toc);


%% Set Chapter 1
ch1 = Chapter();
ch1.Title = 'Adaptive Cruise Control(ACC) Feature ';

% Section 1
sec = Section('ACC Related Algorithm Variables');
txt = ['The following are variables that can be used to indicate ACC performance.']; 
add(sec,txt)
ACC_Var = GetACCVar();

% Add Variables into list
procedure = OrderedList();
for i = 1 : length(ACC_Var)
    append(procedure,ACC_Var{i});
end
add(ch1,sec)
add(ch1,procedure);

% Add Scenarion: jpg image
add(ch1,Section('Title',{'ACC Scenario'},'Content',...
    {{'The meanings of the above variables are shown in the schematic below.'},...
    {Image(which('ACC.jpg'))}}));

% Section 2
sec = Section('ACC Related plots');
txt = ['All of these ACC related variables are from Simulink model. ',...
      'We can envaluate the ACC feature‘s performance based on variables logging.',...
      'I will display the list of variables and show the plots as below. ',...
      'Sheets and Tables also can be shown here if necessary.'];   
add(sec,txt)
add(ch1,sec)

% Add plots
Var = {};
Var{1} = {'RxMotionCtrlLongVelocity'};
PlotFakeACCRange;
fig = Figure(gcf);
fig.Snapshot.Height = '4in'; 
fig.Snapshot.Width = '6in'; 
fig.Snapshot.Caption = sprintf('ACC Range Performance'); 
add(ch1,fig); 

% Add plots: ACC Range 
[min_x, max_x, avg_x, std_x] = PlotVar(Var{1});
fig = Figure(gcf);
fig.Snapshot.Height = '4in'; 
fig.Snapshot.Width = '6in'; 
fig.Snapshot.Caption = sprintf('Vehicle Longtinual Speed'); 
add(ch1,fig); 

% Add plots: ACC PlotFakeACCRangeRate()
PlotFakeACCRangeRate;
fig = Figure(gcf);
fig.Snapshot.Height = '4in'; 
fig.Snapshot.Width = '6in'; 
fig.Snapshot.Caption = sprintf('ACC Range Rate Performance'); 
add(ch1,fig); 

% Add Table 1
sec = Section('ACC Related Table'); 
t = FormalTable({min_x,max_x,avg_x,std_x});
t = SetTable(t);
txt = ['Vehicle Longtinual Speed table [m/s]'];   
add(sec,txt)
% add(ch1,sec)
add(sec,t);

% Add Table 2
% sec = Section('ACC Related Table'); 
t = FormalTable({2*min_x,2*max_x,2*avg_x,2*std_x});
t = SetTable(t);
txt = ['ACC Range Rate Table [m/s]'];   
add(sec,txt)
add(sec,t);
add(ch1,sec)
% add(sec,t);

% % Add Table 3
% sec = Section('ACC Related Table'); 
% t = FormalTable({3*min_x,3*max_x,3*avg_x,3*std_x});
% t = SetTable(t);
% txt = ['Some statics can be shown in the table based on the plots. ',...
%     'And also need to improve this part in code'];   
% add(sec,txt)
% add(ch1,sec)
% add(sec,t);


% Finished chapter 1
add(rpt,ch1)
delete(gcf) 
delete(gcf) 
delete(gcf) 
delete(gcf)

%% Set Chapter 2
ch2 = Chapter();
ch2.Title = 'Lane Centering(LC) Feature ';
sec = Section('LC Related Algorithm Variables');
txt = ['All of these LC related variables are from Simulink model. ',...
      'We can envaluate the LC feature‘s performance based on variables logging.',...
      'I will display the list of variables and show the plots as below. ',...
      'Sheets and Tables also can be shown here if necessary.'];  
add(sec,txt)

% Add Variables into list
LC_Var = GetLCVar();
procedure = OrderedList();
for i = 1 : length(LC_Var)
    append(procedure,LC_Var{i});
end
add(ch2,sec)
add(ch2,procedure);

% Add senario: jpg image
add(ch2,Section('Title',{'LC Scenario'},'Content',...
    {{'Based on the variables listed above, We depict the scenarios as below.'},...
    {Image(which('LC.jpg'))}}));

% Add txt
sec = Section('LC Related plots');
txt = ['All of these LC related variables are from Simulink model. ',...
      'We can envaluate the LC feature‘s performance based on variables logging.',...
      'I will display the list of variables and show the plots as below. ',...
      'Sheets and Tables also can be shown here if necessary.'];   
add(sec,txt)
add(ch2,sec)

% Add plots
Var = {};
Var{1} = 'LQR_PTC_LatError';
[min_x, max_x, avg_x, std_x] = PlotVar(Var);
fig = Figure(gcf);
fig.Snapshot.Height = '4in'; 
fig.Snapshot.Width = '7in'; 
fig.Snapshot.Caption = sprintf('LQR_PTC_LatError'); 
add(ch2,fig);

% Add plots: ACC Range
PlotLC;
fig = Figure(gcf);
fig.Snapshot.Height = '4in'; 
fig.Snapshot.Width = '7in'; 
fig.Snapshot.Caption = sprintf('Lane Centering Performance'); 
add(ch2,fig);

% Add Table
sec = Section('LC Related Table');
digits(4); 
t = FormalTable({min_x,max_x,avg_x,std_x});
t = SetTable(t);

txt = ['Some statics can be shown in the table based on the plots. ',...
    'And also need to improve this part in code'];   
add(sec,txt)
add(ch2,sec)
add(sec,t);

% Finished Chapter 2
add(rpt,ch2)
delete(gcf) 
delete(gcf) 


%% Set Chapter 3 
ch3 = Chapter();
ch3.Title = 'System Degradation Manager(SDM) Feature ';
sec = Section('SDM Related Algorithm Variables');
txt = ['All of these SDM related variables are from Simulink model. ',...
      'We can envaluate the SDM feature‘s performance based on variables logging from ControlDesk.',...
      'I will display the list of variables and show the plots as below. ',...
      'Sheets and Tables also can be shown here if necessary.']; 
add(sec,txt)

% Add variables into list
SDM_Var = GetSDMVar();
procedure = OrderedList();
for i = 1 : length(SDM_Var)
    append(procedure,SDM_Var{i});
end
add(ch3,sec)
add(ch3,procedure);

% Finished Chapter 3
add(rpt,ch3)

%% Set Chapter 4 
ch4 = Chapter();
ch4.Title = 'Operation Design Domain(ODD) Feature ';
sec = Section('ODD Related Algorithm Variables');
txt = ['All of these ODD related variables are from Simulink model. ',...
      'We can envaluate the ODD feature‘s performance based on variables logging from ControlDesk.',...
      'I will display the list of variables and show the plots as below. ',...
      'Sheets and Tables also can be shown here if necessary.']; 
add(sec,txt)

% Add variables into list
ODD_Var = GetODDVar();
procedure = OrderedList();
for i = 1 : length(ODD_Var)
    append(procedure,ODD_Var{i});
end
add(ch4,sec)
add(ch4,procedure);

% Finished Chapter 4
add(rpt,ch4)

%% Close report and display
close(rpt);
disp('Done! Please Check your report.')
rptview(rpt);
