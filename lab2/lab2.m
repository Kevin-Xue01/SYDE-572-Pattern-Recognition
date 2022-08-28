% SYDE 572 Lab 2
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
legend_font_size = 8;
axis_font_size = 15;
LineWidth = 1.5;
%% Section 2 - Model Estimation 1D Case
load('lab2_1.mat')

x_a = 0:0.1:10;
x_b = 0:0.1:10;

mu_a = 5;
sigma_a = 1;

lambda_b = 1;
mu_b = 1/lambda_b;

%%% True pdfs
guassian_true = normpdf(x_a, mu_a, sigma_a);
exponential_true = exppdf(x_b, mu_b);

%% Section 2.1 - Parametric Estimation - Gaussian
close all % close all open figures

[guassian_ml_estimate_mu_a, guassian_ml_estimate_sigma_a] = parametric_estimation_gaussian_1d(a);
[guassian_ml_estimate_mu_b, guassian_ml_estimate_sigma_b] = parametric_estimation_gaussian_1d(b);

guassian_ml_estimate_a = normpdf(x_a, guassian_ml_estimate_mu_a, guassian_ml_estimate_sigma_a);
guassian_ml_estimate_b = normpdf(x_b, guassian_ml_estimate_mu_b, guassian_ml_estimate_sigma_b);

figure()
plot(x_a, guassian_ml_estimate_a, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_a, guassian_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Gaussian 1D Parametric Estimation - Gaussian Dataset A")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_b, guassian_ml_estimate_b, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_b, exponential_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Gaussian 1D Parametric Estimation - Exponential Dataset B")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)
%% Section 2.2 - Parametric Estimation - Exponential
close all % close all open figures

exponential_ml_estimate_lambda_a = parametric_estimation_exponential_1d(a);
exponential_ml_estimate_lambda_b = parametric_estimation_exponential_1d(b);

exponential_ml_estimate_a = exppdf(x_a, 1/exponential_ml_estimate_lambda_a);
exponential_ml_estimate_b = exppdf(x_b, 1/exponential_ml_estimate_lambda_b);

figure()
plot(x_a, exponential_ml_estimate_a, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_a, guassian_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Exponential Parametric Estimation - Gaussian Dataset A")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_b, exponential_ml_estimate_b, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_b, exponential_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Exponential Parametric Estimation - Exponential Dataset B")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)
%% Section 2.3 - Parametric Estimation - Uniform
close all % close all open figures

[uniform_ml_estimate_a_a, uniform_ml_estimate_b_a] = parametric_estimation_uniform_1d(a); 
[uniform_ml_estimate_a_b, uniform_ml_estimate_b_b] = parametric_estimation_uniform_1d(b);

uniform_ml_estimate_a = unifpdf(x_a, uniform_ml_estimate_a_a, uniform_ml_estimate_b_a);
uniform_ml_estimate_b = unifpdf(x_b, uniform_ml_estimate_a_b, uniform_ml_estimate_b_b);

figure()
plot(x_a, uniform_ml_estimate_a, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_a, guassian_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Uniform Parametric Estimation - Gaussian Dataset A")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_b, uniform_ml_estimate_b, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_b, exponential_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Uniform Parametric Estimation - Exponential Dataset B")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)
%% Section 2.4 - Non-parametric estimation 
close all % close all open figures

non_parametric_estimate_a_0 = non_parametric_estimation(a, x_a, 0.1);
non_parametric_estimate_b_0 = non_parametric_estimation(b, x_b, 0.1);

non_parametric_estimate_a_1 = non_parametric_estimation(a, x_a, 0.4);
non_parametric_estimate_b_1 = non_parametric_estimation(b, x_b, 0.4);

figure()

plot(x_a, non_parametric_estimate_a_0, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_a, guassian_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Non-parametric Estimation(h = 0.1) - Gaussian Dataset A")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_b, non_parametric_estimate_b_0, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_b, exponential_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Non-parametric Estimation(h = 0.1) - Exponential Dataset B")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_a, non_parametric_estimate_a_1, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_a, guassian_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Non-parametric Estimation(h = 0.4) - Gaussian Dataset A")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

figure()
plot(x_b, non_parametric_estimate_b_1, 'LineWidth', LineWidth, 'Color', 'r'), hold on
plot(x_b, exponential_true, 'LineWidth', LineWidth, 'Color', 'b'), hold on
xlabel("x")
ylabel("p(x)")
title("Non-parametric Estimation(h = 0.4) - Exponential Dataset B")
legend('Estimated pdf','True pdf', 'Location','northwest','FontSize',legend_font_size)

%% Section 3 - Model Estimation 2-D case
clear % clear all variables from memory
close all % close all open figures
clc

rng(137);

marker_size = 30;
case_number = 2;
title_font_size = 15;
legend_font_size = 8;
axis_font_size = 15;
LineWidth = 1.5;

load('lab2_2.mat')

res = 1;
non_parametric_sigma = sqrt(400);

max_x = ceil(max(vertcat(al(:,1), bl(:,1), cl(:,1))));
min_x = floor(min(vertcat(al(:,1), bl(:,1), cl(:,1))));

max_y = ceil(max(vertcat(al(:,2), bl(:,2), cl(:,2))));
min_y = floor(min(vertcat(al(:,2), bl(:,2), cl(:,2))));

final_min = min([min_x min_y]);
final_max = max([max_x max_y]);

x = final_min:res:final_max;
y = final_min:res:final_max;

%% Section 3.1 - Parametric Estimation 
close all
[X, Y] = meshgrid(x, y);

sample_mu_a = mean(al);
sample_sigma_a = cov(al(:,1), al(:,2));

sample_mu_b = mean(bl);
sample_sigma_b = cov(bl(:,1), bl(:,2));

sample_mu_c = mean(cl);
sample_sigma_c = cov(cl(:,1), cl(:,2));

meshgrid_dim_1_size = size(X, 1);
meshgrid_dim_2_size = size(X, 2);
parametric_ml_classes = zeros(size(X));

for i=1:meshgrid_dim_1_size
    for j=1:meshgrid_dim_2_size
        current_pt = [X(i, j); Y(i, j)];
        parametric_ml_classes(i,j) = parametric_estimation_2d_gaussian(current_pt, [sample_mu_a' sample_mu_b' sample_mu_c'], ...
            [sample_sigma_a sample_sigma_b sample_sigma_c]);
    end
end

figure();
colormap([1 0.8 0.8; 0.8 0.8 1; 0.8 1 0.8]);
contourf(X, Y, parametric_ml_classes, 2, 'k');
hold on;
scatter(al(:, 1), al(:, 2), marker_size, 'red', 'x');
hold on;
scatter(bl(:, 1), bl(:, 2), marker_size, 'blue', 'x');
hold on;
scatter(cl(:, 1), cl(:, 2), marker_size, 'green', 'x');
hold on;
xlabel("x_1")
ylabel("x_2")
legend({'Decision Boundary', 'Class A', 'Class B', 'Class C'},'Location','southwest', "FontSize", legend_font_size);
title('Gaussian 2D Parametric Estimation', "FontSize", title_font_size);

%% Section 3.2 - Non-parametric Estimation 
% increase this parameter to increase parzen window function size, making
% the classification boundaries much smoother
close all

window_scaling_factor = 100; 

parzen_res = [res final_min final_min final_max final_max];
window_x = -window_scaling_factor*non_parametric_sigma: res: window_scaling_factor*non_parametric_sigma;
parzen_window = normpdf(window_x', zeros([length(window_x) 1]), repmat(non_parametric_sigma, [length(window_x) 1]));

[parzen_pdf_a, parzen_x_a, parzen_y_a] = parzen(al, parzen_res, parzen_window);
[parzen_pdf_b, parzen_x_b, parzen_y_b] = parzen(bl, parzen_res, parzen_window);
[parzen_pdf_c, parzen_x_c, parzen_y_c] = parzen(cl, parzen_res, parzen_window);

[X, Y] = meshgrid(parzen_x_a, parzen_y_a);

non_parametric_ml_classes = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       [~, class] = max([parzen_pdf_a(i,j), parzen_pdf_b(i,j), parzen_pdf_c(i,j)]);
       non_parametric_ml_classes(i,j) = class;
   end
end

figure();
colormap([1 0.8 0.8; 0.8 0.8 1; 0.8 1 0.8]);
contourf(X, Y, non_parametric_ml_classes, 2, 'k');
hold on;
scatter(al(:, 1), al(:, 2), marker_size, 'red', 'x');
hold on;
scatter(bl(:, 1), bl(:, 2), marker_size, 'blue', 'x');
hold on;
scatter(cl(:, 1), cl(:, 2), marker_size, 'green', 'x');
hold on;
xlabel("x_1")
ylabel("x_2")
legend({'Decision Boundary', 'Class A', 'Class B', 'Class C'},'Location','southwest', "FontSize", legend_font_size);
title('Non-parametric Estimation(std = 20)', "FontSize", title_font_size);
