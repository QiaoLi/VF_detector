function [filtdata]  = smp50Hzfilt(data, Fs, Fnotch)

% [filtdata]  = smp50Hzfilt(data, Fs, Fnotch);
% apply an FIR notch filter (coeffs designed by Neil Townsend)
% at Fnotch Hz for a sampling frequency of Fs Hz
% Defaults: Fnotch = 50.0;  Fs = 256;
%
% gari AT mit DOT edu ... G.D. Clifford 2004

% Data should be zeromeaned before calling this function

if nargin < 3
Fnotch  = 50.0;  % Hz    
end

if nargin < 2
Fs      = 256;  % Hz    
end

denominator = 1;
numerator = [1 1 1];
% numerator(1) = 1;
% numerator(3) = 1;
numerator(2) = -2.0*cos(2*pi*Fnotch/Fs);

% = 1.0/(2.0 + data->ds_smooth_fir_mult[ds][1]);

% make transfer function have unit gain
norm = sum(numerator);
numerator = numerator/norm;

% Forward-Reverse zero phase filter data
filtdata = filtfilt(numerator,denominator,data);
