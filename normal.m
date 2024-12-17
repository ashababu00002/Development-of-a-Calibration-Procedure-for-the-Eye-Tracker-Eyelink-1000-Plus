clc;
clear all;
close all;

% Load data
data4 = load('Exp2_3.5mm.mat');
data5 = load('Exp2_4mm.mat');
data6 = load('Exp2_5mm.mat');
data7 = load('Exp2_6mm.mat');
data8 = load('Exp2_7mm.mat');

 
 figure
 subplot(2,1,1);
 plot(data8.y(45,:));
 xlabel('Time(s)');
 ylabel('Area(mm2)');
 title('left Pupil Data Before');

 subplot(2,1,2);
 plot(data8.y(46,:));
 xlabel('Time(s)');
 ylabel('Area(mm2)');
 title('Right Pupil Data Before');
 %%
fs = 4800;
downsample_factor = 10;
fs_downsampled = fs / downsample_factor;

% Initialize arrays to store the areas for each subject
Area_left = zeros(1, 5);
Area_right = zeros(1, 5);

% Process subject 4
left_pupil4 = data4.y(45,96000:100800);
right_pupil4 = data4.y(46,96000:100800);
left_pupil_d4 = downsample(left_pupil4, downsample_factor);
right_pupil_d4 = downsample(right_pupil4, downsample_factor);
smooth_left4 = smoothdata(left_pupil_d4, 'rloess', 0.1 * fs_downsampled);
smooth_right4 = smoothdata(right_pupil_d4, 'rloess', 0.1 * fs_downsampled);
Area_left(1) = mean(smooth_left4);
Area_right(1) = mean(smooth_right4);

% Process subject 5
left_pupil5 = data5.y(45,62400:67200);
right_pupil5 = data5.y(46,67200:72000);
left_pupil_d5 = downsample(left_pupil5, downsample_factor);
right_pupil_d5 = downsample(right_pupil5, downsample_factor);
smooth_left5 = smoothdata(left_pupil_d5, 'rloess', 0.1 * fs_downsampled);
smooth_right5 = smoothdata(right_pupil_d5, 'rloess', 0.1 * fs_downsampled);
Area_left(2) = mean(smooth_left5);
Area_right(2) = mean(smooth_right5);

% Process subject 6
left_pupil6 = data6.y(45,19200:24000);
right_pupil6 = data6.y(46,19200:24000);
left_pupil_d6 = downsample(left_pupil6, downsample_factor);
right_pupil_d6 = downsample(right_pupil6, downsample_factor);
smooth_left6 = smoothdata(left_pupil_d6, 'rloess', 0.1 * fs_downsampled);
smooth_right6 = smoothdata(right_pupil_d6, 'rloess', 0.1 * fs_downsampled);
Area_left(3) = mean(smooth_left6);
Area_right(3) = mean(smooth_right6);

% Process subject 7
left_pupil7 = data7.y(45,144000:148800);
right_pupil7 = data7.y(46,144000:148800);
left_pupil_d7 = downsample(left_pupil7, downsample_factor);
right_pupil_d7 = downsample(right_pupil7, downsample_factor);
smooth_left7 = smoothdata(left_pupil_d7, 'rloess', 0.1 * fs_downsampled);
smooth_right7 = smoothdata(right_pupil_d7, 'rloess', 0.1 * fs_downsampled);
Area_left(4) = mean(smooth_left7);
Area_right(4) = mean(smooth_right7);

% Process subject 8
left_pupil8 = data8.y(45,115200:120000);
right_pupil8 = data8.y(46,115200:120000);
left_pupil_d8 = downsample(left_pupil8, downsample_factor);
right_pupil_d8 = downsample(right_pupil8, downsample_factor);
smooth_left8 = smoothdata(left_pupil_d8, 'rloess', 0.1 * fs_downsampled);
smooth_right8 = smoothdata(right_pupil_d8, 'rloess', 0.1 * fs_downsampled);
Area_left(5) = mean(smooth_left8);
Area_right(5) = mean(smooth_right8);

% Display or use Area_left and Area_right as needed

disp(Area_left);


disp(Area_right);
d1 = 3.5;
d2 = 5;
d3 = 6;
d4 = 7;
d5 = 9;

area = zeros(1,5);
area(1) = pi*(d1/2)^2;
area(2) = pi*(d2/2)^2;
area(3) = pi*(d3/2)^2;
area(4) = pi*(d4/2)^2;
area(5) = pi*(d5/2)^2;

figure;
subplot(2, 1, 1); 
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Area(mm2)');
ylabel('Arbitrary Unit ');
title('Average Pupil Area for Left Pupil'); 
grid on;


subplot(2, 1, 2);  
plot(area, Area_right, '-s', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Area(mm2)');
ylabel('Arbitrary Unit');
title('Average Pupil Area for Right Pupil');  
grid on;


figure;
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(area, Area_right, '-s', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Area(mm2)');
ylabel('Arbitrary Unit ');
title('Average Pupil Area for Left and Right Pupils Across Pupil sizes');
legend('Left Pupil', 'Right Pupil', 'Location', 'best');
%xticks(4:8);
grid on;

figure;
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Area(mm2)');
ylabel('Arbitrary Unit ');
title('Average Pupil Area for Left eye Pupil sizes');
grid on

% Linear regression for Left Pupil
p_left = polyfit(area, Area_left, 1);
fitted_left = polyval(p_left, area);

% Linear regression for Right Pupil
p_right = polyfit(area, Area_right, 1);
fitted_right = polyval(p_right, area);


% Plot linear regression results
figure;
plot(area, Area_left, 'ro', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(area, fitted_left, '-b', 'LineWidth', 1.5);
hold off;

xlabel('Area (mm^2)');
ylabel('Arbitrary Unit');
title('Linear Regression for Average Pupil Area (Left)');
legend('Left Pupil Data', 'Left Pupil Fit', 'Location', 'best');
grid on;

figure;
plot(area, Area_right, 'ro', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(area, fitted_right, '-b', 'LineWidth', 1.5);
hold off;

xlabel('Area (mm^2)');
ylabel('Arbitrary Unit');
title('Linear Regression for Average Pupil Area (Right)');
legend('right Pupil Data', 'right Pupil Fit', 'Location', 'best');
grid on;

% Display regression equations
disp(['Left Pupil Regression: y = ' num2str(p_left(1)) 'x + ' num2str(p_left(2))]);
disp(['Right Pupil Regression: y = ' num2str(p_right(1)) 'x + ' num2str(p_right(2))]);