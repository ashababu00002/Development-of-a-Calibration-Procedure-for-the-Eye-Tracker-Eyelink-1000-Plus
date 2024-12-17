clear all;                                                                    % helps to clear all the datas in the workspace before starting the program
close all;                                                                    % helps to close all the plots  
clc;                                                                          % helps to clear commands in the command window

% Load data
data4             = load('s4in.mat');                                         % Here we can load the recorded data by using load function
data5             = load('s5in.mat');
data6             = load('s6in.mat');
data7             = load('s7in.mat');
data8             = load('s8in.mat');

fs                = 4800;                                                      % Sampling frequency
downsample_factor = 10;                                                        % Factor to downsample the data
fs_downsampled    = fs / downsample_factor;                                    % Downsampled frequency

% Initialize arrays to store the areas for each subject
Area_left         = zeros(1, 5);                                               % 1x5 array for left pupil areas
Area_right        = zeros(1, 5);                                               % 1x5 array for right pupil areas

% Process Pupil Size 4
left_pupil4       = data4.y(45, 4800:9600);                                    % Extract data for left pupil
right_pupil4      = data4.y(46, 38400:43200);                                  % Extract data for right pupil
left_pupil_d4     = downsample(left_pupil4, downsample_factor);                % Downsample left pupil data
right_pupil_d4    = downsample(right_pupil4, downsample_factor);               % Downsample right pupil data
smooth_left4      = smoothdata(left_pupil_d4, 'rloess', 0.1 * fs_downsampled); % Smooth left pupil data
smooth_right4     = smoothdata(right_pupil_d4, 'rloess', 0.1 * fs_downsampled);% Smooth right pupil data
Area_left(1)      = mean(smooth_left4);                                        % Calculate and store mean area for left pupil (Pupil Size 4)
Area_right(1)     = mean(smooth_right4);                                       % Calculate and store mean area for right pupil (Pupil Size 4)

% Process Pupil Size 5
left_pupil5       = data5.y(45, 33600:38400);                                  % Extract data for left pupil
right_pupil5      = data5.y(46, 33600:38400);                                  % Extract data for right pupil
left_pupil_d5     = downsample(left_pupil5, downsample_factor);                % Downsample left pupil data
right_pupil_d5    = downsample(right_pupil5, downsample_factor);               % Downsample right pupil data
smooth_left5      = smoothdata(left_pupil_d5, 'rloess', 0.1 * fs_downsampled); % Smooth left pupil data
smooth_right5     = smoothdata(right_pupil_d5, 'rloess', 0.1 * fs_downsampled);% Smooth right pupil data
Area_left(2)      = mean(smooth_left5);                                        % Calculate and store mean area for left pupil (Pupil Size 5)
Area_right(2)     = mean(smooth_right5);                                       % Calculate and store mean area for right pupil (Pupil Size 5)

% Process Pupil Size 6
left_pupil6       = data6.y(45, 38400:43200);                                  % Extract data for left pupil
right_pupil6      = data6.y(46, 38400:43200);                                  % Extract data for right pupil
left_pupil_d6     = downsample(left_pupil6, downsample_factor);                % Downsample left pupil data
right_pupil_d6    = downsample(right_pupil6, downsample_factor);               % Downsample right pupil data
smooth_left6      = smoothdata(left_pupil_d6, 'rloess', 0.1 * fs_downsampled); % Smooth left pupil data
smooth_right6     = smoothdata(right_pupil_d6, 'rloess', 0.1 * fs_downsampled);% Smooth right pupil data
Area_left(3)      = mean(smooth_left6);                                        % Calculate and store mean area for left pupil (Pupil Size 6)
Area_right(3)     = mean(smooth_right6);                                       % Calculate and store mean area for right pupil (Pupil Size 6)

% Process Pupil Size 7
left_pupil7       = data7.y(45, 9600:14400);                                   % Extract data for left pupil
right_pupil7      = data7.y(46, 56160:60960);                                  % Extract data for right pupil
left_pupil_d7     = downsample(left_pupil7, downsample_factor);                % Downsample left pupil data
right_pupil_d7    = downsample(right_pupil7, downsample_factor);               % Downsample right pupil data
smooth_left7      = smoothdata(left_pupil_d7, 'rloess', 0.1 * fs_downsampled); % Smooth left pupil data
smooth_right7     = smoothdata(right_pupil_d7, 'rloess', 0.1 * fs_downsampled);% Smooth right pupil data
Area_left(4)      = mean(smooth_left7);                                        % Calculate and store mean area for left pupil (Pupil Size 7)
Area_right(4)     = mean(smooth_right7);                                       % Calculate and store mean area for right pupil (Pupil Size 7)

% Process Pupil Size 8
left_pupil8       = data8.y(45, 28800:33600);                                  % Extract data for left pupil
right_pupil8      = data8.y(46, 19200:24000);                                  % Extract data for right pupil
left_pupil_d8     = downsample(left_pupil8, downsample_factor);                % Downsample left pupil data
right_pupil_d8    = downsample(right_pupil8, downsample_factor);               % Downsample right pupil data
smooth_left8      = smoothdata(left_pupil_d8, 'rloess', 0.1 * fs_downsampled); % Smooth left pupil data
smooth_right8     = smoothdata(right_pupil_d8, 'rloess', 0.1 * fs_downsampled);% Smooth right pupil data
Area_left(5)      = mean(smooth_left8);                                        % Calculate and store mean area for left pupil (Pupil Size 8)
Area_right(5)     = mean(smooth_right8);                                       % Calculate and store mean area for right pupil (Pupil Size 8)

% Display or use Area_left and Area_right as needed
disp(Area_left);                                                               % displays the average left arabitrary unit
disp(Area_right);                                                              % displays the average right arabitrary unit
d1 = 3.5;                                                                      % enters the diameter1 of the artificial eyes
d2 = 5;                                                                        % enters the diameter2 of the artificial eyes
d3 = 6;                                                                        % enters the diameter3 of the artificial eyes
d4 = 7;                                                                        % enters the diameter4 of the artificial eyes
d5 = 9;                                                                        % enters the diameter5 of the artificial eyes

area = zeros(1,5);                                                             % create an 1*5 array to store the 5 pupil areas
area(1) = pi*(d1/2)^2;                                                         % finds area for diameter1
area(2) = pi*(d2/2)^2;                                                         % finds area for diameter2
area(3) = pi*(d3/2)^2;                                                         % finds area for diameter3
area(4) = pi*(d4/2)^2;                                                         % finds area for diameter4
area(5) = pi*(d5/2)^2;                                                         % finds area for diameter5

disp(area);                                                                    % displays the area array

figure;                                  % Create a new figure window
subplot(2, 1, 1);                        % Create a 2-row, 1-column subplot and use the first section
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);  % Plot 'Area_left' vs 'area' with a line and circle markers, line width 2, marker size 8
xlabel('Area(mm2)');                     % Label the x-axis as 'Area(mm²)'
ylabel('Arbitrary Units');                % Label the y-axis as 'Arbitrary Units'
title('Average Pupil Area for Left Pupil');  % Add a title to the plot for the left pupil
grid on;                                 % Turn on the grid for better visualization

subplot(2, 1, 2);                        % Use the second section of the 2-row, 1-column subplot
plot(area, Area_right, '-s', 'LineWidth', 2, 'MarkerSize', 8); % Plot 'Area_right' vs 'area' with a line and square markers, line width 2, marker size 8
xlabel('Area(mm2)');                     % Label the x-axis as 'Area(mm²)'
ylabel('Arbitrary Unit');                 % Label the y-axis as 'Arbitrary Unit'
title('Average Pupil Area for Right Pupil');  % Add a title to the plot for the right pupil
grid on;                                 % Turn on the grid for better visualization



figure;
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(area, Area_right, '-s', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Area(mm2)');
ylabel('Arbitrary Unit ');
title('Average Pupil Area for Left and Right Pupils Across Pupil sizes');
legend('Left Pupil', 'Right Pupil', 'Location', 'best');
grid on;

l2 = Area_left;

save("pupil_left.mat",'l2','-append')
data = load("pupil_left.mat");
Area_L = data.l(:,:);
Area2_L = data.l2(:,:);

figure;
plot(area,Area_L, '-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
plot(area, Area2_L, '-s', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Area(mm2)');
ylabel('Arbitrary Unit ');
title('Average Pupil Area for Left and repeted left Pupils Across Pupil sizes');
legend('Left Pupil', 'Repeated left Pupil', 'Location', 'best');
grid on;

figure;                                  % Create a new figure window
                       % Create a 2-row, 1-column subplot and use the first section
plot(area, Area_left, '-o', 'LineWidth', 2, 'MarkerSize', 8);  % Plot 'Area_left' vs 'area' with a line and circle markers, line width 2, marker size 8
xlabel('Area(mm2)');                     % Label the x-axis as 'Area(mm²)'
ylabel('Arbitrary Units');                % Label the y-axis as 'Arbitrary Units'
title('Average Pupil Area for Left Pupil');  % Add a title to the plot for the left pupil
grid on;         

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
