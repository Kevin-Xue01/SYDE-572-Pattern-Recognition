function class = parametric_estimation_2d_gaussian(current_pt, mu, sigma)
number_of_classes = size(mu, 2);
discriminant = zeros(number_of_classes, 1);
for k=1:number_of_classes
    current_mu = mu(:, k);
    current_sigma = sigma(:, 2*k-1:2*k);
    discriminant(k) = exp(-0.5*(current_pt-current_mu)'*inv(current_sigma)*(current_pt-current_mu))/(sqrt(det(current_sigma)));
end
[~, max_index] = max(discriminant);
class = max_index;
end
