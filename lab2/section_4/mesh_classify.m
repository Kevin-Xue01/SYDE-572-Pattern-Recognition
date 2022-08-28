function classes = mesh_classify(X1, X2, G, naB, nbA)
%   params:
%       X1, X2 (AxB): matrices of meshgrid values for contour plot
%       G (2x2xJ matrix): each 'slice' is the mu value of a classifier
%       naB (1xJ matrix): #times G classifies a point from a as class B
%       nbA (1xJ matrix): #times G classifies a point from b as class A
%       
% returns:
%   classes(AxB): matrix of classes

meshgrid_dim_1_size = size(X1, 1);
meshgrid_dim_2_size = size(X1, 2);
classes = zeros(size(X1));

for i=1:meshgrid_dim_1_size
    for j=1:meshgrid_dim_2_size
        current_pt = [X1(i, j); X2(i, j)];
        classes(i,j) = sequential_classify(current_pt, G, naB, nbA);
    end
end