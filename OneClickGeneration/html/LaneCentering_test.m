%% Histogram of Vector
% Wentao
% test for future work purpose
clear;clc;close all;
plotting
function plotting
mu = 0;
sigma = 0.5;
num = 20000;
range = -3.5:0.05:3.5;
range = range*sigma;
string1 = 'Lateral error';
xlab = strcat(string1, 'position (m)' );
len = 0.64;

%% Plotting/ Figure setting

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