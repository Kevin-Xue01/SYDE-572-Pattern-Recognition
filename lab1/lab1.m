% SYDE 572 Lab 1
% Group Members: 
% 1. Kevin (Kaiwen) Xue, ID# 20814292 
% 2. Anni Wang, ID# 20849760
% 3. Howard Nguyen-Huu, ID# 20825782
% 4. Valerie Liu, ID# 20829258

clear % clear all variables from memory
close all % close all open figures
clc

rng(137);

marker_size = 30;
case_number = 2;
title_font_size = 15;
legend_font_size = 12;
axis_font_size = 15;

%% Class Definitions
% Class A
N_A = 200;
mu_A = [5 10]';
sigma_A = [8 0; 0 4];
% Class B
N_B = 200;
mu_B = [10 15]';
sigma_B = [8 0; 0 4];
% Class C
N_C = 100;
mu_C = [5 10]';
sigma_C = [8 4; 4 40];
% Class D
N_D = 200;
mu_D = [15 10]';
sigma_D = [8 0; 0 8];
% Class E
N_E = 150;
mu_E = [10 5]';
sigma_E = [10 -5; -5 20]; 
%% Section 2 - Generating Clusters
[pts_A, transformed_pts_A, unit_standard_deviation_contour_A] = generate_clusters(N_A, mu_A, sigma_A);
[pts_B, transformed_pts_B, unit_standard_deviation_contour_B] = generate_clusters(N_B, mu_B, sigma_B);
[pts_C, transformed_pts_C, unit_standard_deviation_contour_C] = generate_clusters(N_C, mu_C, sigma_C);
[pts_D, transformed_pts_D, unit_standard_deviation_contour_D] = generate_clusters(N_D, mu_D, sigma_D);
[pts_E, transformed_pts_E, unit_standard_deviation_contour_E] = generate_clusters(N_E, mu_E, sigma_E);

% Plotting samples and unit standard deviation contour
if case_number == 1
    figure;
    scatter(transformed_pts_A(:, 1), transformed_pts_A(:, 2), marker_size, 'red', 'x');
    hold on;
    scatter(transformed_pts_B(:, 1), transformed_pts_B(:, 2), marker_size, 'blue', 'x');
    hold on;
    plot(unit_standard_deviation_contour_A(1, :), unit_standard_deviation_contour_A(2, :), 'red', "LineStyle",":", "LineWidth", 2);
    hold on;
    plot(unit_standard_deviation_contour_B(1, :), unit_standard_deviation_contour_B(2, :), 'blue', "LineStyle",":", "LineWidth", 2);
    title('Case 1: Plotting randomly generated samples for Class A and B and their unit standard deviation contours', 'FontSize', title_font_size);
    legend({'Class A', 'Class B', "Class A - unit std dev contour", "Class B - unit std dev contour"}, ...
            'Location','southwest', 'FontSize', legend_font_size);
else
    scatter(transformed_pts_C(:, 1), transformed_pts_C(:, 2), marker_size, 'red', 'x');
    hold on;
    scatter(transformed_pts_D(:, 1), transformed_pts_D(:, 2), marker_size, 'blue', 'x');
    hold on;
    scatter(transformed_pts_E(:, 1), transformed_pts_E(:, 2), marker_size, 'green', 'x');
    hold on;
    plot(unit_standard_deviation_contour_C(1, :), unit_standard_deviation_contour_C(2, :), 'red', "LineWidth", 2, "LineStyle",":");
    hold on;
    plot(unit_standard_deviation_contour_D(1, :), unit_standard_deviation_contour_D(2, :), 'blue', "LineWidth", 2, "LineStyle",":");
    hold on;
    plot(unit_standard_deviation_contour_E(1, :), unit_standard_deviation_contour_E(2, :), 'green', "LineWidth", 2, "LineStyle",":");
    title('Case 2: Plotting randomly generated samples for Class C, D, and E and their unit standard deviation contours', "FontSize", title_font_size);
    legend({'Class C', 'Class D', 'Class E', "Class C - unit std dev contour", "Class D - unit std dev contour", ...
            "Class E - unit std dev contour"},'Location','southwest', "FontSize", legend_font_size);
end
xlabel('x_1', 'FontSize', axis_font_size);
ylabel('x_2', 'FontSize', axis_font_size);

%% Section 3 - Classifiers
step = 0.05;
case_1_x1 = floor(min([min(transformed_pts_A(:, 1)) min(transformed_pts_B(:, 1))])):step:ceil(max([max(transformed_pts_A(:, 1)) max(transformed_pts_B(:, 1))]));
case_1_x2 = floor(min([min(transformed_pts_A(:, 2)) min(transformed_pts_B(:, 2))])):step:ceil(max([max(transformed_pts_A(:, 2)) max(transformed_pts_B(:, 2))]));
case_2_x1 = floor(min([min(transformed_pts_C(:, 1)) min(transformed_pts_D(:, 1)) min(transformed_pts_E(:, 1))])):step:ceil(max([max(transformed_pts_C(:, 1)) max(transformed_pts_D(:, 1)) max(transformed_pts_E(:, 1))]));
case_2_x2 = floor(min([min(transformed_pts_C(:, 2)) min(transformed_pts_D(:, 2)) min(transformed_pts_E(:, 2))])):step:ceil(max([max(transformed_pts_C(:, 2)) max(transformed_pts_D(:, 2)) max(transformed_pts_E(:, 2))]));


if case_number == 1
    [X1, X2] = meshgrid(case_1_x1, case_1_x2);
elseif case_number == 2
    [X1, X2] = meshgrid(case_2_x1, case_2_x2);
end

% MED Classifier
if case_number == 1
    MED_classes = mesh_classify(X1, X2, @MED, [mu_A mu_B], 0, 0);
    plot_figure(case_number, case_1_x1, case_1_x2, MED_classes, transformed_pts_A, transformed_pts_B, [], [], []);
    title('Case 1: MED decision boundary for Class A and B',"FontSize", title_font_size);
else
    MED_classes = mesh_classify(X1, X2, @MED, [mu_C mu_D mu_E], 0, 0);
    plot_figure(case_number, case_2_x1, case_2_x2, MED_classes, [], [], transformed_pts_C, transformed_pts_D, transformed_pts_E);
    title('Case 2: MED decision boundary for Class C, D, and E', "FontSize", title_font_size);
end

% GED Classifier
if case_number == 1
    GED_classes = mesh_classify(X1, X2, @GED, [mu_A mu_B], [sigma_A sigma_B], 0);
    plot_figure(case_number, case_1_x1, case_1_x2, GED_classes, transformed_pts_A, transformed_pts_B, [], [], []);
    title('Case 1: GED/MICD decision boundary for Class A and B', "FontSize", title_font_size);
else
    GED_classes = mesh_classify(X1, X2, @GED, [mu_C mu_D mu_E], [sigma_C sigma_D sigma_E], 0);
    plot_figure(case_number, case_2_x1, case_2_x2, GED_classes, [], [], transformed_pts_C, transformed_pts_D, transformed_pts_E);
    title('Case 2: GED/MICD decision boundary for Class C, D, and E', "FontSize", title_font_size);
end

% MAP Classifier
case_1_total_cases = N_A + N_B;
prior_A = N_A/case_1_total_cases;
prior_B = N_B/case_1_total_cases;

prior_case_2_total_cases = N_C + N_D + N_E;
prior_C = N_C/prior_case_2_total_cases;
prior_D = N_D/prior_case_2_total_cases;
prior_E = N_E/prior_case_2_total_cases;

if case_number == 1
    MAP_classes = mesh_classify(X1, X2, @MAP, [mu_A mu_B], [sigma_A sigma_B], [prior_A prior_B]);
    plot_figure(case_number, case_1_x1, case_1_x2, MAP_classes, transformed_pts_A, transformed_pts_B, [], [], []);
    title('Case 1: MAP decision boundary for Class A and B', "FontSize", title_font_size);
else
    MAP_classes = mesh_classify(X1, X2, @MAP, [mu_C mu_D mu_E], [sigma_C sigma_D sigma_E], [prior_C prior_D prior_E]);
    plot_figure(case_number, case_2_x1, case_2_x2, MAP_classes, [], [], transformed_pts_C, transformed_pts_D, transformed_pts_E);
    title('Case 2: MAP decision boundary for Class C, D, and E', "FontSize", title_font_size);
end

% NN Classifier 
if case_number == 1
    NN_classes = mesh_classify(X1, X2, @NN, ...
        vertcat(transformed_pts_A, transformed_pts_B), ...
        [ones(1, size(pts_A, 1)) 2*ones(1, size(pts_B, 1))], ...
        0);
    plot_figure(case_number, case_1_x1, case_1_x2, NN_classes, transformed_pts_A, transformed_pts_B, [], [], []);
    title('Case 1: NN decision boundary for Class A and B', "FontSize", title_font_size);
else
    NN_classes = mesh_classify(X1, X2, @NN, ...
        vertcat(transformed_pts_C, transformed_pts_D, transformed_pts_E), ...
        [ones(1, size(pts_C, 1)) 2*ones(1, size(pts_D, 1)) 3*ones(1, size(pts_E,1))], ...
        0);
    plot_figure(case_number, case_2_x1, case_2_x2, NN_classes, [], [], transformed_pts_C, transformed_pts_D, transformed_pts_E);
    title('Case 2: NN decision boundary for Class C, D, and E', "FontSize", title_font_size);
end

% KNN Classifier
K = 5;
if case_number == 1
    kNN_classes = mesh_classify(X1, X2, @KNN, ...
        vertcat(transformed_pts_A, transformed_pts_B), ...
        [ones(1, size(pts_A, 1)) 2*ones(1, size(pts_B, 1))], ...
        0);
    plot_figure(case_number, case_1_x1, case_1_x2, kNN_classes, transformed_pts_A, transformed_pts_B, [], [], []);
    title('Case 1: kNN (k=5) decision boundary for Class A and B', "FontSize", title_font_size);
else
    kNN_classes = mesh_classify(X1, X2, @KNN, ...
        vertcat(transformed_pts_C, transformed_pts_D, transformed_pts_E), ...
        [ones(1, size(pts_C, 1)) 2*ones(1, size(pts_D, 1)) 3*ones(1, size(pts_E,1))], ...
        0);
    plot_figure(case_number, case_2_x1, case_2_x2, kNN_classes, [], [], transformed_pts_C, transformed_pts_D, transformed_pts_E);
    title('Case 2: kNN (k=5) decision boundary for Class C, D, and E', "FontSize", title_font_size);
end

% comparison plots
plot_comparison(case_number, X1, X2, ...
    MED_classes, GED_classes, MAP_classes, NN_classes, kNN_classes,...
    transformed_pts_A, transformed_pts_B, transformed_pts_C, transformed_pts_D, transformed_pts_E);

% Section 4 - Error Analysis
error_analysis;
