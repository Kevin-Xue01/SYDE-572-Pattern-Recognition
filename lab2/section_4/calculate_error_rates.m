function [avg_error, min_error, max_error, std_error] = calculate_error_rates(a, b, J)
% CALCULATE_ERROR_RATES
%   Params:
%       a (Nx2 matrix): sample of class 1
%       b (Nx2 matrix): sample of class 2
%       J (int): number of classifiers
%   Returns:
%       avg_error: mean of error
%       min_error: minimum error
%       max_error: maximum error
%       std_error: standard deviation of error

    rng(360) %340, 360, 104
    n_a = size(a,1);
    n_b = size(b,1);
    n_total = n_a + n_b;

    avg_error = zeros(J,1);
    min_error = zeros(J,1);
    max_error = zeros(J,1);
    std_error = zeros(J,1);

    for j=1:J
        error_rate = zeros(20,1);
        
        for k=1:20
            num_error = 0;

            % generate sequential classifier
            [G, naB, nbA] = gen_sequential_classifier(a, b, J);

            % check for set a
            for i=1:n_a
                a_class = sequential_classify(a(i,:)', G, naB, nbA);

                % check if point is misclassified as class B (2)
                if(a_class == 2)
                    num_error = num_error + 1;
                end
            end

            % check for set b
            for i=1:n_b
                b_class = sequential_classify(b(i,:)', G, naB, nbA);
                
                % check if point is misclassified as class A (1)
                if(b_class == 1)
                    num_error = num_error + 1;
                end
            end
            
            % get overall error rate
            error_rate(k) = num_error/n_total;
        end

        avg_error(j) = mean(error_rate);
        min_error(j) = min(error_rate);
        max_error(j) = max(error_rate);
        std_error(j) = std(error_rate);
    end 
end

