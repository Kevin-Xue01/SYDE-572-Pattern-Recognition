function classes = mesh_classify(X1, X2, method, a, b, c)
% params:
%   X1, X2 (AxB): matrices of meshgrid values for contour plot
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
%           prior(double): scalar
%       
% returns:
%   classes(AxB): matrix of classes

meshgrid_dim_1_size = size(X1, 1);
meshgrid_dim_2_size = size(X1, 2);
classes = zeros(size(X1));

for i=1:meshgrid_dim_1_size
    for j=1:meshgrid_dim_2_size
        current_pt = [X1(i, j); X2(i, j)];
        classes(i,j) = method(current_pt, a, b, c);
    end
end