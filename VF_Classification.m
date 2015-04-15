function VF_output = VF_Classification(record)
% Read data file and classify VF / Non_VF
% input: 
%    record: record name of WFDB format data file
%
% output:
%    VF_output: VF (1) / Non_VF (0)
%
% This function need support of The WFDB Toolbox for MATLAB which can be
% download at http://physionet.org/physiotools/matlab/wfdb-app-matlab/
% to read WFDB format data
%
% This function need support of LIBSVM V3.11 for classification which can
% be download at http://www.csie.ntu.edu.tw/~cjlin/libsvm/
%
% Usage: VF_output = VF_Classification('cu01')
%

% suppose the sampling frequency is 250
% if not, please resample the data to 250Hz using resample()
samp_freq=250; 
powerline=60;
window=5; % 5 seconds analysis window

% read data using WFDB_toolbox rdsamp
[tm,signal,Fs]=rdsamp(record);
tempdata=signal;
ECGleads=size(tempdata,2);
    
analysis_lead=1; % analysis the first lead
analysis_data=tempdata(:,analysis_lead);
analysis_data(isnan(analysis_data))=-5; % set NaN to -5 mV

% segments of data
n=floor(length(analysis_data)/samp_freq/window);

load VF_classify_model

% 1 Hz high-pass to remove baseline wander
[b a]=butter(2,1.0/(samp_freq/2),'high');
% 30 Hz low-pass to remove high frequency noise
[b2 a2]=butter(2,30.0/(samp_freq/2));

for i=1:n
    begin_seg=(i-1)*samp_freq*window+1;
    end_seg=i*samp_freq*window;            
    data=analysis_data(begin_seg:end_seg);

    tempfilt=filtfilt(b,a,data);
    tempfilt=filtfilt(b2,a2,tempfilt);
    tempfilt=notchFilt(tempfilt,samp_freq,powerline);

    bandpass_data=band_pass(tempfilt);
    % calculate leakage
    leak=leakage(tempfilt);
    % calculate count2
    [count2] = counts(bandpass_data);
    % Classification by SVM, 1 for VF, 0 for Non_VF
    VF_output(i) = svmpredict(1, [leak,count2], model);
end
end

