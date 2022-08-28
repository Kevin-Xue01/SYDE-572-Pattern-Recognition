function [class] = sequential_classify(current_pt, G, naB, nbA)
% SEQUENTIAL_CLASSIFY
%   Params:
%       current_pt (2x1): point to classify
%       G (2x2xJ matrix): each 'slice' is the mu value of a classifier
%       naB (1xJ matrix): #times G classifies a point from a as class B
%       nbA (1xJ matrix): #times G classifies a point from b as class A
%   Returns:
%       class (int): predicted class of current_pt

    % 1. Let j = 1
    for j = 1:(size(G, 3) - 1)
        mu = G(:,:,j);
        class = MED(current_pt, mu);
        % 2. If Gj classifies x as class B and naB,j = 0 then "Say Class B"
        if class == 2 && naB(1, j) == 0
            return
        % 3. If Gj classifies x as class A and nbA,j = 0 then “Say Class A”
        elseif class == 1 && nbA(1, j) == 0
            return
        end
    end
    
    % At j = J, classify regardless of whether naB,J = nbA,J = 0
    j = size(G, 3);
    mu = G(:,:,j);
    class = MED(current_pt, mu);
end

