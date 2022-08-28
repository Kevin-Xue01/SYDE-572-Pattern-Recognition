function class = KNN(current_pt,pts,pts_classes,c)
% params:
%   current_pt (dx1): point to classify
%   pts (Nxd): matrix of labelled points used to calculate neighbors
%   pts_classes (1xN): matrix of labels
%   c: unused
%       
% returns:
%   class (int): predicted class of current_pt

K = 5;
distances = sqrt(sum((pts-current_pt').^2, 2));
[~, indices] = sort(distances, 'ascend');
top_k_classes = pts_classes(indices(1:K,:));
class = mode(top_k_classes);
end