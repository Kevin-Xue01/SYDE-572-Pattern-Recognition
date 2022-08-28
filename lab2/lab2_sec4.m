%% Section 4 - Sequential Discriminants
clear % clear all variables from memory
close all % close all open figures
clc

load('lab2_3.mat') % contains (200x2) matrices: a and b

max_len = 20;

rng(341); % set random number seed for repeatability
[G1, naB1, nbA1] = gen_sequential_classifier(a, b, max_len);

rng(422); % set for each classifier so any code in between does not affect
[G2, naB2, nbA2] = gen_sequential_classifier(a, b, max_len);

rng(572);
[G3, naB3, nbA3] = gen_sequential_classifier(a, b, max_len);

[X11, X21, classes1] = plotter(a, b, G1, naB1, nbA1);
[X12, X22, classes2] = plotter(a, b, G2, naB2, nbA2);
[X13, X23, classes3] = plotter(a, b, G3, naB3, nbA3);

% if any(any(~classes1)) || any(any(~classes2)) || any(any(~classes3))
%     "ERROR"
% end

J=5;
[avg_error, min_error, max_error, std_error] = calculate_error_rates(a, b, J);

% Plot the error rates
plot_error(avg_error, min_error, max_error, std_error);
