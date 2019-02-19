% Mofaq Alotaibi_HW3_Part1_CS543
% Uniform quantization of audio files
%
% The program reads the given audio files and executes uniform quantization
% of the given bits (bit1), (bit2), and returns with the quantized audio
% files and the distortion between the original and quantized audio.
%
% The main algorithm is to sample the amplitude on a grid, which is created
% by LSB/2 : LSB : LSB/2, where LSB = (ymax - ymin)/2^bit.
close all
clear
clc
%--------------------------------------------------------------------------
% Audio files
fname1 = 'goodbye';
fname2 = 'dee';
fname3 = 'lyinEyes';
ext    = 'wav';

% Bit size
a = 4;
b = 8;
%--------------------------------------------------------------------------
% 1) First audio file 
[Y1a,Y1b,MSE1a,MSE1b,Fs1] = uniquant(fname1,ext,a,b,1);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n',a,fname1,ext,MSE1a);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n\n',b,fname1,ext,MSE1b);

% Check output audio (uncomment if needed, one by one)
% sound(Y1a,Fs1);
% sound(Y1b,Fs1);
%--------------------------------------------------------------------------
% 2) Second audio file 
[Y2a,Y2b,MSE2a,MSE2b,Fs2] = uniquant(fname2,ext,a,b,2);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n',a,fname2,ext,MSE2a);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n\n',b,fname2,ext,MSE2b);

% Check output audio (uncomment if needed, one by one)
% sound(Y2a,Fs2);
% sound(Y2b,Fs2);
%--------------------------------------------------------------------------
% 3) Third audio file 
[Y3a,Y3b,MSE3a,MSE3b,Fs3] = uniquant(fname3,ext,a,b,3);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n',a,fname3,ext,MSE3a);
fprintf('Distortion of %d bit quantized %s.%s audio file is %1.4e\n\n',b,fname3,ext,MSE3b);

% Check output audio (uncomment if needed, one by one)
% sound(Y3a,Fs3);
% sound(Y3b,Fs3);
%--------------------------------------------------------------------------