function fn = decoder(error,f0)
% Mofaq Alotaibi_HW3_Part2_CS543
% DECODER Decoder for predictive lossless coding for input audio by:
%
%   f(n)_hat = f(n-1) 
%       e(n) = f(n) - f(n)_hat
%
% Output is the decoded fn sequence.

% For this simple predictive coding structure, only the differences of the
% signal is sent, therefore the differences can be integrated and added to
% the constant initial value "f0" over the entire sampling interval. Since
% the error terms are one element less, hence when adding up, the error
% integral sequence should be augmented with a leading zero.

errInt = cumsum(error);                  
init   = f0*ones(length(error) + 1,1); 
fn     = init + [0; errInt];




end

