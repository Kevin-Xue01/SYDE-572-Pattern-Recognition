function [G, naB, nbA] = gen_sequential_classifier(a, b, J)
% GEN_SEQUENTIAL_DISCRIMINANTS
%   Params:
%       a (Nx2 matrix): sample of class 1
%       b (Nx2 matrix): sample of class 2
%       J (int): max number of classifiers to be made
%   Returns:
%       G (2x2xJ matrix): each 'slice' is the mu value of a classifier
%       naB (1xJ matrix): #times G classifies a point from a as class B
%       nbA (1xJ matrix): #times G classifies a point from b as class A
    
    G = zeros(2, 2, J);
    naB = zeros(1, J);
    nbA = zeros(1, J);
    
    j = 1;
    while j <= J && ~isempty(a) && ~isempty(b)
        % 2. Randomly select one point from a and one point from b
        n_a = size(a, 1);
        mu_a = a(randi(n_a), :);

        n_b = size(b, 1);
        mu_b = b(randi(n_b), :);
    
        % 3. Create a discriminant G using MED with the two points as prototypes
        mu = [mu_a; mu_b]';
        
        % 4. Using all of the data in a and b, n_aB and n_bA
        %    and record the indices in which classification was correct
        n_aB = 0;
        n_aA_indices = [];
        n_bA = 0;
        n_bB_indices = [];
                            
        for i = 1:n_a
            pred = MED(a(i, :)', mu);
            if pred == 1
                n_aA_indices = [n_aA_indices i];
            elseif pred == 2 
                n_aB = n_aB + 1;
            end
        end
        for i = 1:n_b
            pred = MED(b(i, :)', mu);
            if pred == 2
                n_bB_indices = [n_bB_indices i];
            elseif pred == 1 
                n_bA = n_bA + 1;
            end
        end
        
        % 5. If naB 6= 0 and nBa 6= 0 then no good, go back to step 2.
        if n_bA > 0 && n_aB > 0
            continue
        else
        % 6. This discriminant is good
            G(:,:,j) = mu;
            naB(1, j) = n_aB;
            nbA(1, j) = n_bA;
            j = j + 1;
        end
        
        % 7. If naB = 0 then remove those points from b that G classifies as B
        if n_aB == 0
            b(n_bB_indices, :) = [];
        end

        % 8. If nbA = 0 then remove those points from a that G classifies as A
        if n_bA == 0
            a(n_aA_indices, :) = [];
        end
    end
    
    % removes any extra classifiers if loop ends early due to empty a or b
    if j <= J
        G = G(:, :, 1:j-1);
        naB = naB(1, 1:j-1);
        nbA = nbA(1, 1:j-1);
    end
end

