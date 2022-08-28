function class = MAP(current_pt, mu, sigma, prior)
% params:
%   current_pt (dx1): point to classify
%   mu (dxC): matrix of means values of a class
%   sigma (dx(d*C)): concatenated covariance matrices of each class
%   prior (1xC): row vector of prior values for each class
%       
% returns:
%   class (int): predicted class of current_pt
number_of_classes = size(mu, 2);
discriminant = zeros(number_of_classes, 1);
for k=1:number_of_classes
    current_mu = mu(:, k);
    current_prior = prior(k);
    current_sigma = sigma(:, 2*k-1:2*k);
    discriminant(k) = current_prior*exp(-0.5*(current_pt-current_mu)'*inv(current_sigma)*(current_pt-current_mu))/(sqrt(det(current_sigma)));
end
[~, max_index] = max(discriminant);
class = max_index;
end