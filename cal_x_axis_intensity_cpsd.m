
% Calculate x-axis intensity using cross spectrum method
% positive direction is pointing forward

close all
clear
clc

%% Setup
win_length = 1024;
fft_length = 2048;

fs = 16e3; % sampling frequency
f_vec = 0:fs/fft_length:fs;
f_vec = f_vec(1:end-1).'; % column vector
f_vec = f_vec(1:fft_length/2); % extract frequencies below fs/2

head_rot = 0:10:350;

mic_dist = 1.5e-2; % distance between the two microphones
c = 343.21; % speed of sound at 20 degrees Celcius
rho = 1.2042; % density of air at 20 degrees Celcius

k_vec = 2*pi*f_vec/c;
int_scaling_factor = 1/rho/mic_dist/2/pi./f_vec;


%% Load x-axis data
load('x_axis_TFs.mat');

%% Calculate cross spectrum
left_x_mics_cpsd = left_x_mic_1_ave_TF .* conj(left_x_mic_2_ave_TF);
right_x_mics_cpsd = right_x_mic_1_ave_TF .* conj(right_x_mic_2_ave_TF);

%% Calculate intensity in the x-axis direction
left_x_act_intensity_cpsd = int_scaling_factor .* imag(left_x_mics_cpsd);
right_x_act_intensity_cpsd = int_scaling_factor .* imag(right_x_mics_cpsd);

%% 2D plot
figure;
tiledlayout(1, 2, 'TileSpacing','compact');
nexttile;
imagesc(head_rot, f_vec, real(left_x_act_intensity_cpsd));
ylim([200, 8e3]);
xlabel('Body rotation angle (degrees)');
ylabel('Frequency (Hz)');
%colorbar;
caxis([-1e-7, 1e-7]);

nexttile;
imagesc(head_rot, f_vec, real(right_x_act_intensity_cpsd));
ylim([200, 8e3]);
xlabel('Body rotation angle (degrees)');
ylabel('Frequency (Hz)');
cB = colorbar;
caxis([-1e-7, 1e-7]);
cB.Label.String = 'Intensity (linear scale)';