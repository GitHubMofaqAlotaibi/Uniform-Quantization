function [error,f0] = encoder(fname)
% Mofaq Alotaibi_HW3_Part2_CS543
% ENCODER Encoder for predictive lossless coding for input audio by:
%
%   f(n)_hat = f(n-1) 
%       e(n) = f(n) - f(n)_hat
%
% Output is the encoded error sequence and initial value f0.

% Read audio file
Y = audioread(fname);

% Save first element
f0 = Y(1);

% Error is simply: (current) - (previous) value 
error = Y(2:end) - Y(1:end-1);

% Number of bins for histogram plot
n = 256;

% Create figure (2 x 2 subplot)
figure;
subplot(221);
plot(Y);
title(['Audio signal: ',fname]);
xlabel('Samples'); ylabel('Magnitude');
xlim([1 length(Y)]);

subplot(222);
plot(hist(Y,n));
title('Histogram of audio');
xlabel('Sample value'); ylabel('Count');
xlim([0 n]);

subplot(223);
plot(1:length(error),error);
title(['Error signal: ',fname]);
xlabel('Samples'); ylabel('Magnitude');
xlim([1 length(error)]);

subplot(224);
plot(hist(error,n));
title('Histogram of error');
xlabel('Sample value'); ylabel('Count');
xlim([0 n]);

set(gcf,'Position',[100 100 1200 700]); % for better visualization

end

