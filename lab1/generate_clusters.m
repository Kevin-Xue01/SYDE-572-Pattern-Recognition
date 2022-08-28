function [pts, transformed_pts, unit_standard_deviation_contour] = generate_clusters(N, mu, sigma)
% params:
%   N: number of points 
%   mu: 1xd matrix of the mean value of each cluster, where d is the number
%   of dimensions
%   sigma: dxd matrix of covariance values
% returns:
%   pts: dxN matrix of randomly generated points of given mean and cov
%   transformed_pts: 
%   unit_standard_deviation_contour: 

pts = zeros(N, 2);
transformed_pts = zeros(N, 2);
[eigenvectors, eigenvalues] = eig(sigma);

eigenvalues_diag = diag(eigenvalues);
[max_eigenvalue, max_eigenvalue_index] = max(eigenvalues_diag);

min_eigenvalue = min(eigenvalues_diag);
thetha = acos(dot(eigenvectors(:, max_eigenvalue_index), [1 0]')/norm(eigenvectors(:, max_eigenvalue_index)));

% checks to see if the correlation is positive or negative. Takes the principal angle, as
% thetha is not the principal angle in a few cases when the covariance term, b, is positive
if sigma(1,2) > 0 
    thetha = mod(thetha, pi/2);
end

unit_standard_deviation_contour = generate_ellipse_pts(mu(1), mu(2), thetha, sqrt(max_eigenvalue), sqrt(min_eigenvalue));
for i=1:N
    current_pt = randn(2,1);
    pts(i, :) = current_pt;
    % inv(eigenvectors') equals eigenvectors, since transposing an
    % orthogonal matrix is equivalent to inverting, and since you are
    % inverting twice in the left hand side, it is equivalent to orignal

    % transformed_pts(i, :) = inv(eigenvectors')*sqrt(eigenvalues)*current_pt + mu; 
    transformed_pts(i, :) = eigenvectors*sqrt(eigenvalues)*current_pt + mu; 
end


