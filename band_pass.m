function [output] = band_pass(data,sampfreq)
% 
% See: Irena Jekova and Vessela Krasteva. Real time detection of 
% ventricular fibrillation and tachycardia. 2004 Physiol. Meas.
% 25:1167-1178
%
% Input: 
%  data: ECG data
%
% Output:
%  outout: filtered data 
%
% Last modified by:
% Qiao Li, 4 Oct, 2012
% qiaolibme AT gmail DOT com

if nargin<2
    sampfreq=250;
end

% data_n = length(data);
% 
% output(1)=0;
% output(2)=0;
% 
% for i=3:data_n
%     output(i)=(14*output(i-1)-7*output(i-2)+(data(i)-data(i-2))/2)/8;
% end

if sampfreq==250
    b=[0.5/8 0 -0.5/8];
    a=[1 -14/8 7/8];
else
    [b,a]=butter(1, [13/(sampfreq/2), 16.5/(sampfreq/2)]);
end

output=filtfilt(b,a,data);

end
