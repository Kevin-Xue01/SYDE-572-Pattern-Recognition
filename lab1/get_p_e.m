function error = get_p_e(c)
% sum of the confusion matrix entries minus the sum of its diagonal entries
% divided by the sum of the confusion matrix entries.
all_vals_sum = sum(c, 'all');
error = (all_vals_sum - sum(diag(c)))/all_vals_sum;
end