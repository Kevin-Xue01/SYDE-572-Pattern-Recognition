function classes = test_classify(test_pts, method, a, b, c)
% params:
%   test_pts(Nxd): matrix of points in the training set
%   method: function handle corresponding to method
%   a:
%       method = MED, GED, MAP
%           mu (dxC): matrix of means values of a class
%       method = NN, KNN
%           pts (Nxd): matrix of N points with d dimensions
%   b:
%       method = GED, MAP
%           sigma (dx(d*C)): concatenated covariance matrices of each class
%       method = NN, KNN
%           pts_classes (1xN): matrix of class values
%   c:
%       method = MAP
%           prior (1xC): row vector of prior values for each class
%       
% returns:
%   classes(1xN): matrix of classes

N = size(test_pts, 1);
classes = zeros(1,N);
for i=1:N
    classes(i) = method(test_pts(i,:)', a, b, c);
end