function [min_x, max_x, avg_x, std_x] = PlotVar(Var, Var2)
%% INITIALIZE MATLAB
digits(4);

%% WORKSPACE DEFINE
% Define object filename, filepath and other varibles needed, etc... 

filepath =  'C:\Users\dj5jgf\Documents\AD-OEM-VEHICLE\SWAT L2+L3- PI4\OneClickGeneration\Tes_data_11_01\';
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
    xlabel('Time[Unit: 0.01s/step]');
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

