function class = NN(current_pt,pts,pts_classes,c)
% params:
%   current_pt (dx1): point to classify
%   pts (Nxd): matrix of labelled points used to calculate neighbors
%   pts_classes (1xN): matrix of labels
%   c: unused
%       
% returns:
%   class (int): predicted class of current_pt

distances = sqrt(sum((pts-current_pt').^2, 2));
[~, indices] = sort(distances, 'ascend');
class = pts_classes(indices(1,:));
end