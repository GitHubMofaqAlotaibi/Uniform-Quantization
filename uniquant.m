function [Ys1,Ys2,MSE1,MSE2,Fs] = uniquant(fname,ext,bit1,bit2,k)
% Mofaq Alotaibi_HW3_Part1_CS543
% UNIQUANT Uniformly quantize input audio (fname.ext) by bit1 and bit2.
% 
% The program outputs the quantized files (Ys1, Ys2), the distrotion
% values(MSE1, MSE2) and the sampling frequqnecy (Fs). also, it produces
% plots for visualization.

% Read audio file: filename.ext
[Y,Fs] = audioread([fname,'.',ext]);

% Create quantizations grids of bit1 and bit2
ymin  = -1;     % always -1, due to audioread
ymax  = +1;     % always +1, due to audioread
qnt1  = (ymax - ymin)/2^bit1;
qnt2  = (ymax - ymin)/2^bit2;
grid1 = (ymin + qnt1/2):qnt1:(ymax - qnt1/2);  
grid2 = (ymin + qnt2/2):qnt2:(ymax - qnt2/2);

% Loop through all samples
Ys1 = Y;        % allocate space for output
Ys2 = Y;        % allocate space for output
for i = 1:length(Y),
    
   % Finding the closest quantization value to the original one:
   % a) Subtract the original value from the grid 
   % b) Compute the absolute value of the vector 
   % c) Find the index of the smallest element (idx), (preferably zero)
   % d) Clearly, the closest value will be (idx)th element of the grid
   % e) Do everything for both bit1 and bit2 grids
   [~,idx1] = min(abs((grid1 - Y(i))));
   [~,idx2] = min(abs((grid2 - Y(i))));
     Ys1(i) = grid1(idx1); 
     Ys2(i) = grid2(idx2);
     
end

% Compute distortion (Mean-Squared-Error)
MSE1 = sum((Ys1 - Y).^2)/length(Y);
MSE2 = sum((Ys2 - Y).^2)/length(Y);

% Write (bit1) and (bit2) quantized audio files
audiowrite(['MofaqAlotaibi_part1_',fname,num2str(bit1),'bit.wav'],Ys1,Fs)
audiowrite(['MofaqAlotaibi_part1_',fname,num2str(bit2),'bit.wav'],Ys2,Fs)

% Create plot of audio files in range of (t)
t = 1000:1200;
figure(k); plot(t,Y(t),'r-'); hold on;
plot(t,Ys1(t),'b--'); plot(t,Ys2(t),'k:'); grid on;
legend('original','4bit uniform quantized','8bit uniform quantized');
xlabel('Sample (#)'); ylabel('Amplitude'); 
title(['Quantization of ',fname,'.',ext])

end