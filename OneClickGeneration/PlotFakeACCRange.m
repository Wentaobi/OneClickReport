function PlotFakeACCRange()
%% FUNCTION: DATA ANALYSIS INSIDE FOGURE
% Plot some feaures and analyze them
L = 120;
mu = 0;
sigma = 40;
x = sigma + 0.5*randn(L,1);

figure;
plot(x)

title('ACC Range performance');
xlabel('Time [Unit: 0.01s/step]');
ylabel('ACC Range, Unit: m')
grid on;

hold on;
% Text/axis
plot([0, L], [40, 40],'-r','LineWidth',2);
xlim auto
ylim([sigma-2, sigma+2])

plot([0, L], [40.5, 40.5],'--g', [0, L], [39.5, 39.5],'--g','LineWidth',2);
legend('ACC Actual Range','ACC Default Range','ACC Stable Range');
hold on;
% plot([0, L], [39.5, 39.5],'--g','LineWidth',2);
% plot([sigma, sigma], [0, len_p],'-m','LineWidth',2);
% plot([2*sigma, 2*sigma], [0, len_p],'-c','LineWidth',2);
% plot([3*sigma, 3*sigma], [0, len_p],'-y','LineWidth',2);
%%
text(0,41.5,'Confidence Level: 95%','Color','blue','FontSize',12)
% text(-1.9,0.023,'LC on Ave Speed 60MPH','Color','black','FontSize',13);
% text(-1.9,0.022,'LC on Dist./Total 2000/2500 Mile','Color','black','FontSize',13);
% text(-1.9,0.021,'LC on time percentage 85.6%','Color','black','FontSize',13);
% text(-1.75,0.020,'RMSE  1\sigma%   2\sigma%   3\sigma%   LC time%','Color','black','FontSize',13);
% text(-1.75,0.019,'--------    ------   ------   ------   ------------','Color','black','FontSize',13);
% text(-1.9,0.018,'All    0.125    91.2   99.0   100.0  100(45.91 hour)','Color','black','FontSize',13);
% text(-1.9,0.017,'Str    0.097    95.5   99.8   100.0  69.1','Color','blue','FontSize',13);
% text(-1.9,0.016,'Lf      0.170    81.7   97.4   99.9   15.8','Color','green','FontSize',13);
% text(-1.9,0.015,'Rt      0.173    81.1   96.8   99.9   15.0','Color','red','FontSize',13);
% text(-1.9,0.014,'LC on rain  1.26%','Color','black','FontSize',13);
% text(-1.9,0.013,'LC on night 7.96%','Color','black','FontSize',13);
end