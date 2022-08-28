function class = GED(current_pt, mu, sigma, c)
% params:
%   current_pt (dx1): point to classify
%   mu (dxC): matrix of means values of a class
%   sigma (dx(d*C)): concatenated covariance matrices of each class
%   c: unused
%       
% returns:
%   class (int): predicted class of current_pt
number_of_classes = size(mu, 2);
discriminant = zeros(number_of_classes, 1);
for k=1:number_of_classes
    current_mu = mu(:, k);
    current_inv_sigma = inv(sigma(:, 2*k-1:2*k));
    discriminant(k) = (current_pt - current_mu)' * current_inv_sigma * (current_pt - current_mu); 
end
[~, min_index] = min(discriminant);
class = min_index;
end