% Mofaq Alotaibi_HW3_Part2_CS543
% Predictive encoding of audio files

clear 
close all
clc
%--------------------------------------------------------------------------
% 1) Audio file
ext    = 'wav';
fname  = 'goodbye';
[Y,Fs] = audioread([fname,'.',ext]);    % read file to determine Fs

[error,f0] = encoder([fname,'.',ext]);  % encode file
fn = decoder(error,f0);                 % decode encoded sequence

audiowrite(['MofaqAlotaibi_part2_',fname,'_decoded.wav'],fn,Fs)
MSE = sum((Y - fn).^2)/length(Y); 
fprintf('Distortion of encoded/decoded %s.%s audio file is  %1.4e.\n',fname,ext,MSE);
%--------------------------------------------------------------------------
% 2) Audio file
fname  = 'dee';
[Y,Fs] = audioread([fname,'.',ext]);    % read file to determine Fs

[error,f0] = encoder([fname,'.',ext]);  % encode file
fn = decoder(error,f0);                 % decode encoded sequence

audiowrite(['MofaqAlotaibi_part2_',fname,'_decoded.wav'],fn,Fs)
MSE = sum((Y - fn).^2)/length(Y); 
fprintf('Distortion of encoded/decoded %s.%s audio file is  %1.4e.\n',fname,ext,MSE);
%--------------------------------------------------------------------------
% 3) Audio file
fname  = 'lyinEyes';
[Y,Fs] = audioread([fname,'.',ext]);    % read file to determine Fs

[error,f0] = encoder([fname,'.',ext]);  % encode file
fn = decoder(error,f0);                 % decode encoded sequence

audiowrite(['MofaqAlotaibi_part2_',fname,'_decoded.wav'],fn,Fs)
MSE = sum((Y - fn).^2)/length(Y); 
fprintf('Distortion of encoded/decoded %s.%s audio file is  %1.4e.\n',fname,ext,MSE);


