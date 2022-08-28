function [ml_estimate_mu, ml_estimate_sigma] = parametric_estimation_gaussian_1d(data)
ml_estimate_mu = (1/length(data))*sum(data);
ml_estimate_mu_arr = repmat(ml_estimate_mu, length(data), 1);
ml_estimate_sigma = (1/length(data))*sum((data' - ml_estimate_mu_arr).^2);
end

