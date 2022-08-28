function [X1, X2, classes] = plotter(a, b, G, naB, nbA)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
marker_size = 30;
title_font_size = 15;
legend_font_size = 8;
axis_font_size = 15;
LineWidth = 1.5;

step = 1;
x_lower = min(min(a(:,1)), min(b(:,1))) - 5;
x_upper = max(max(a(:,1)), max(b(:,1))) + 5;
y_lower = min(min(a(:,2)), min(b(:,2))) - 5;
y_upper = max(max(a(:,2)), max(b(:,2))) + 5;

[X1, X2] = meshgrid(x_lower:step:x_upper, y_lower:step:y_upper);

classes = mesh_classify(X1, X2, G, naB, nbA);

figure

colormap([1 0.8 0.8; 0.8 1 0.8; 0.8 0.8 1]);
contourf(X1, X2, classes);
hold on;
scatter(a(:, 1), a(:, 2), marker_size, 'red', 'x');
hold on;
scatter(b(:, 1), b(:, 2), marker_size, 'blue', 'x');
hold on;
xlabel("x_1")
ylabel("x_2")
legend({'Decision Boundary', 'Class A', 'Class B'},'Location','southwest', "FontSize", legend_font_size);

end

