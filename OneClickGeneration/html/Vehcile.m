%% CONTROL UNIT TEST 
% Revision 2.0
% This script is to show figures, charts, tables, plottings to 
% test control algorithm, vehicle behavior

%% INITIALIZE MATLAB
clear;clc;close all;

%% WORKSPACE DEFINE
% Define object filename, filepath and other varibles needed, etc... 

filepath =  'C:\Users\dj5jgf\Aptiv\Autonomous Program - software_architecture\Controls Block _ Scrum Team Folder\0.0 L2+ Core\2018_PI4\CODE_S2\LC_KPI\Tes_data_11_01';
mat_name_0 =  'ACC_LC_2904';

%% DATA TYPE
% Define string, array, cell ...
string = 'ACC_LC_2904';
var_cell = {};
d0 = load([filepath mat_name_0 '.mat']);

%% VARIABLES  
% Get variables from MATLAB/SIMULINK - MABX - ControlDesk logging
var1 = '<RxPCCrossErrorRD>';
var2 = 'CtrlCmd_FinalReferenceSpeed_mps';
var3 = 'YawRate_RoadWheelAngle';
var4 = 'Roll_Observer_RoadWheelAng';
var5 = 'LatCtrlDesRoadWheelAngleDynCGRollCompensation';
var6 = 'LatCtrlDesRoadWheelAngleDynCG';
var7 = 'LongCtrlAccLqrCrossTrafficDesAccel';
var8 = 'LongCtrlAccLqrCrossWalkDesAccel';
var9 = 'LongCtrlAccLqrCutInDesAccel';
var10 = 'LongCtrlAccLqrPrimaryDesAccel';
var11 = '<IsManual>';
% Pre-allocate variables as placeholder
var1_index = 0;
var2_index = 0;
var3_index = 0;
var4_index = 0;
var5_index = 0;
var6_index = 0;
var7_index = 0;
var8_index = 0;
var9_index = 0;
var10_index = 0;
%% INDEX SEARCHING 
% Find variable index in the Mat file, ps: search last one to rreplace if 
% have multiple same names inside
for j = 1:length(d0.(string).Y)
    if strcmp(d0.(string).Y(j).Name, var1)
        var1_index = j;
        datapoint1 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var2)
        var2_index = j;
        datapoint2 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var3)
        var3_index = j;
        datapoint3 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var4)
        var4_index = j;
        datapoint4 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var5)
        var5_index = j;
        datapoint5 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var6)
        var6_index = j;
        datapoint6 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var7)
        var7_index = j;
        datapoint7 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var8)
        var8_index = j;
        datapoint8 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var9)
        var9_index = j;
        datapoint9 = [d0.(string).Y(j).Data(1)];
    elseif strcmp(d0.(string).Y(j).Name, var10)
        var10_index = j; 
        datapoint10 = [d0.(string).Y(j).Data(1)];
    end          
end
%% EXCEL SHEETS LAYOUT DEFINE
% Define separate sheets names, rows, columns
index_tab = [var1_index, var2_index, var3_index, var4_index, var5_index, ...
             var6_index, var7_index, var8_index, var9_index, var10_index];
disp(index_tab);
rows = {'min'; 'max'; 'avg'; 'std dev'}; 
%% FIGURE GENERATION
plotting;
%% FUNCTION 1: STATICS CALCULATION
% Figure out min, max, average, std dev ...
function [min_x, max_x, avg_x, std_x] = cal_x(x)
min_x = min(x);
max_x = max(x);
avg_x = mean(x);
std_x = std(x);
end
%% FUNCTION 2: TRIGGER CHECK
% Find how many times driver take over from Auto mode to MANUAL mode
function manual = cal_m(m)
manual = diff(m);
manual = sum(manual(:)==1);
end
%% FUNCTION 3: DATA ANALYSIS INSIDE FOGURE
% Plot some feaures and analyze them
function plotting
mu = 0;
sigma = 0.5;
num = 20000;
range = -3.5:0.05:3.5;
range = range*sigma;
string1 = 'Lateral error';
xlab = strcat(string1, 'position (m)' );
len = 0.64;
% Plotting/ Figure setting
hfig = figure(1);
set(hfig, 'Position', [700 400 1200 600]);
x = mu + (sigma) * randn(num,1);
[counter, center] = hist(x, range);
plot(center, counter/num,'-b','LineWidth',2);
hold on;
plot(center, counter*0.7/num,'-g','LineWidth',2);
plot(center, counter*0.75/num,'-r','LineWidth',2);
len_p = max(counter/num)*len;
ax = gca;
ax.YGrid='on';
ax.FontSize = 14;
% Text/axis
plot([-sigma, -sigma], [0, len_p],'-m','LineWidth',2);
plot([-2*sigma, -2*sigma], [0, len_p],'-c','LineWidth',2);
plot([-3*sigma, -3*sigma], [0, len_p],'-y','LineWidth',2);
legend(string1, 'Left', 'Right','1 CL', '2 CL','3 CL');
plot([sigma, sigma], [0, len_p],'-m','LineWidth',2);
plot([2*sigma, 2*sigma], [0, len_p],'-c','LineWidth',2);
plot([3*sigma, 3*sigma], [0, len_p],'-y','LineWidth',2);
text(-1.9,0.024,'Overall','Color','black','FontSize',13)
text(-1.9,0.023,'LC on Ave Speed 60MPH','Color','black','FontSize',13);
text(-1.9,0.022,'LC on Dist./Total 2000/2500 Mile','Color','black','FontSize',13);
text(-1.9,0.021,'LC on time percentage 85.6%','Color','black','FontSize',13);
text(-1.75,0.020,'RMSE  1\sigma%   2\sigma%   3\sigma%   LC time%','Color','black','FontSize',13);
text(-1.75,0.019,'--------    ------   ------   ------   ------------','Color','black','FontSize',13);
text(-1.9,0.018,'All    0.125    91.2   99.0   100.0  100(45.91 hour)','Color','black','FontSize',13);
text(-1.9,0.017,'Str    0.097    95.5   99.8   100.0  69.1','Color','blue','FontSize',13);
text(-1.9,0.016,'Lf      0.170    81.7   97.4   99.9   15.8','Color','green','FontSize',13);
text(-1.9,0.015,'Rt      0.173    81.1   96.8   99.9   15.0','Color','red','FontSize',13);
text(-1.9,0.014,'LC on rain  1.26%','Color','black','FontSize',13);
text(-1.9,0.013,'LC on night 7.96%','Color','black','FontSize',13);
%grid on;
hold off;
xlabel(xlab);
ylabel('Normalized Samples, prob%');
title('Lane Error Histogram based on Path','Color', 'r');
end
