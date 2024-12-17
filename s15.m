 clear all;                      % clears all the variables which are loaded in the workspace
 close all;                      % closes all the plots which are opened previosly
 clc;                            % clears all the commands in the command window
 data          =load ('s15.mat');% here 's15.mat' change the data 

 figure                          % used to plot the graph in a figure
 subplot(2,1,1);                 % this function plots the graph in 1st row of 2*1 
 plot(data.y(45,:));             % this function plot the data in the channel 45
 xlabel('Time(s)');              % function used to label the x axis
 ylabel('Area(mm2)');            % function used to label the x axis
 title('left Pupil Data Before');% function used to give a title for the graph

 subplot(2,1,2);                 % this function plots the graph in 2nd row of 2*1
 plot(data.y(46,:));             % this function plot the data in the channel 46
 xlabel('Time(s)');
 ylabel('Area(mm2)');
 title('Right Pupil Data Before');
 pupil_size_L  =45;               % here write down tha channel mumber for left pupil size
 left_pupil    = data.y(pupil_size_L,30240:35040);%here trims left pupil size data to 1s
 pupil_size_R  =46;               % here write down tha channel mumber for right pupil size
 right_pupil   = data.y(pupil_size_R,30240:35040);%here trims right pupil size data to 1s
fs             = 4800;            %here write down the sammpling srequency
downsample_factor = 10;           %here write down the downampling rate of 10
left_pupil_d   = downsample(left_pupil, downsample_factor); %here applies downsamling to the trimed data of left pupil 
right_pupil_d  = downsample(right_pupil, downsample_factor);%here applies downsamling to the trimed data of right pupil

fs_downsampled = fs / downsample_factor;%here updating the sampling frequency after down sampling

t = (0:length(left_pupil_d)-1) / fs_downsampled;%here updated the time period for ploting the data

smooth_left_d  = smoothdata(left_pupil_d, 'rloess', 0.1 * fs_downsampled); %here we use smoothing function tp preprocess the left pupil data
smooth_right_d = smoothdata(right_pupil_d, 'rloess', 0.1 * fs_downsampled);%here we use smoothing function tp preprocess the right pupil data

figure
subplot(2,1,1);
plot(t, left_pupil_d, 'b', t, smooth_left_d, 'r');% this function used to plot the left pupil data against the smoothed left pupil data
legend('Original data', 'Smoothed data using ''rloess''', 'Location', 'NW'); % this function used to indicate the contents merged in the graph
xlabel('Time(s)');
ylabel('Area(mm2)');

title('Left Pupil Data Before');

subplot(2,1,2);
plot(t, right_pupil_d, 'b', t, smooth_right_d, 'r');% this function used to plot the right pupil data against the smoothed right pupil data
legend('Original data', 'Smoothed data using ''rloess''', 'Location', 'NW');
xlabel('Time(s)');
ylabel('Area(mm2)');
title('Right Pupil Data Before');


Area_left = mean(smooth_left_d);  % here we use mean function to get the average value of left pupil
Area_right = mean(smooth_right_d);% here we use mean function to get the average value of right pupil

disp(['Mean of smoothed left pupil data before: ', num2str(Area_left)]);  % this function used to display the average value which is calculated previously for the left
disp(['Mean of smoothed right pupil data before: ', num2str(Area_right)]);% this function used to display the average value which is calculated previously for the right

load('pupil_data.mat')
d(9)        = 790;
p_L (9)     = 81;
cr_L (9)    = 213;
Area_L(9)   = Area_left;
p_R(9)      = 72; 
cr_R(9)     = 225;
Area_R(9)   = Area_right;
save('pupil_data.mat', 'd', 'p_L', 'cr_L','Area_L','p_R','cr_R','Area_R','-append');
%%
data2=load ('s15_2.mat');
figure
 subplot(2,1,1);
 plot(data2.y(45,:));
 xlabel('Time(s)');
 ylabel('Area(mm2)');
 title('left Pupil Data Before');

 subplot(2,1,2);
 plot(data2.y(46,:));
 xlabel('Time(s)');
 ylabel('Area(mm2)');
 title('Right Pupil Data Before');
 left_pupil2 = data2.y(45,35040:39840);
 right_pupil2 = data2.y(46,35040:39840);
fs = 4800;
 downsample_factor = 10;
left_pupil_d2 = downsample(left_pupil2, downsample_factor);
right_pupil_d2 = downsample(right_pupil2, downsample_factor);


fs_downsampled = fs / downsample_factor;

t1 = (0:length(left_pupil_d2)-1) / fs_downsampled;

smooth_left_d2 = smoothdata(left_pupil_d2, 'rloess', 0.1 * fs_downsampled);
smooth_right_d2 = smoothdata(right_pupil_d2, 'rloess', 0.1 * fs_downsampled);

figure
subplot(2,1,1);
plot(t1, left_pupil_d2, 'b', t1, smooth_left_d2, 'r');
%legend('Original data', 'Smoothed data using ''rloess''', 'Location', 'NW');
xlabel('Time(s)');
ylabel('Area(mm2)')
title('Left Pupil Data After');

subplot(2,1,2);
plot(t1, right_pupil_d2, 'b', t1, smooth_right_d2, 'r');
%legend('Original data', 'Smoothed data using ''rloess''', 'Location', 'NW');
xlabel('Time(s)');
ylabel('Area(mm2)');
title('Right Pupil Data After');


Area_left2 = mean(smooth_left_d2);
Area_right2 = mean(smooth_right_d2);

disp(['Mean of smoothed left pupil data after: ', num2str(Area_left2)]);
disp(['Mean of smoothed right pupil data after: ', num2str(Area_right2)]);

%%
Area2_L(9)   = Area_left2;
Area2_R(9)   = Area_right2;
save('pupil_data.mat', 'd', 'p_L', 'cr_L','Area_L','p_R','cr_R','Area_R','Area2_R','Area2_L','-append');
