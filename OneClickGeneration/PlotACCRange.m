function [min_x, max_x, avg_x, std_x] = PlotACCRange(Var, Var2)
%% INITIALIZE MATLAB
digits(4);

%% WORKSPACE DEFINE
% Define object filename, filepath and other varibles needed, etc... 

filepath =  'C:\Users\dj5jgf\Documents\AD-OEM-VEHICLE\SWAT L2+L3- PI4\Logs_Analysis_Script\Tes_data_11_01\';
mat_name =  'LC_3005';

%% DATA TYPE
% Define string, array, cell ...

string = 'LC_3005';
d0 = load([filepath mat_name '.mat']);

%% VARIABLES  
% Get variables from MATLAB/SIMULINK - MABX - ControlDesk logging
%var1 = 'controlled_steer_angle_final';
% Pre-allocate variables as placeholder

var1 = Var;
var1_index = 0;

%% INDEX SEARCHING 
% Find variable index in the Mat file, ps: search last one to rreplace if 
% have multiple same names inside

for j = 1:length(d0.(string).Y)
    if strcmp(d0.(string).Y(j).Name, var1)
        var1_index = j;
    end
end
if nargin == 2
    x = d0.(string).Y(var1_index).Data;
    [min_x, max_x, avg_x, std_x] = cal_x(x)
else 
    figure;
    % x axis: time order
    x = 1:length(d0.(string).Y(var1_index).Data);
    % data
    y = d0.(string).Y(var1_index).Data;
    plot(x, y);    
    grid on;
    title([d0.(string).Y(var1_index).Name]);
    xlabel('Time [Unit: 0.01s/step]');
    ylabel(d0.(string).Y(var1_index).Name);
    legend(string)
end
[min_x, max_x, avg_x, std_x] = cal_x(y);
end

%% FUNCTION: STATICS CALCULATION
% Figure out min, max, average, std dev ...

function [min_x, max_x, avg_x, std_x] = cal_x(x)
format short;
min_x = roundn(min(x),-4); 
max_x = roundn(max(x),-4); 
avg_x = roundn(mean(x),-4); 
std_x = roundn(std(x),-4); 
end

%% FUNCTION: DATA ANALYSIS INSIDE FOGURE

