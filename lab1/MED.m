function class = MED(current_pt, mu, b, c)
% params:
%   current_pt (dx1): point to classify
%   mu (dxC): matrix of means values of a class
%   b: unused
%   c: unused
%       
% returns:
%   class (int): predicted class of current_pt
number_of_classes = size(mu, 2);
discriminant = zeros(number_of_classes, 1);
for k=1:number_of_classes
    current_mu = mu(:, k);
    discriminant(k) = -(current_mu' * current_pt) + 0.5 * (current_mu') * current_mu;
end
[~, min_index] = min(discriminant);
class = min_index;
end