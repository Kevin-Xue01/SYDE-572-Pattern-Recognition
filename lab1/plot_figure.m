function plot_figure(case_number, x1, x2, classes, transformed_pts_A, transformed_pts_B, transformed_pts_C, transformed_pts_D, transformed_pts_E)
    marker_size = 30;
    legend_font_size = 12;
    axis_font_size = 15;

    if case_number == 1
        figure;
        colormap([1 0.8 0.8; 0.8 1 0.8; 0.8 0.8 1]);
        contourf(x1, x2, classes, 1, 'k');
        hold on;
        scatter(transformed_pts_A(:, 1), transformed_pts_A(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_B(:, 1), transformed_pts_B(:, 2), marker_size, 'blue', 'x');
        hold on;
        legend({'Decision Boundary', 'Class A', 'Class B'},'Location','southwest', "FontSize", legend_font_size);
    else 
        figure;
        colormap([1 0.8 0.8; 0.8 0.8 1; 0.8 1 0.8]);
        contourf(x1, x2, classes, 2, 'k');
        hold on;
        scatter(transformed_pts_C(:, 1), transformed_pts_C(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_D(:, 1), transformed_pts_D(:, 2), marker_size, 'blue', 'x');
        hold on;
        scatter(transformed_pts_E(:, 1), transformed_pts_E(:, 2), marker_size, 'green', 'x');
        hold on;
        legend({'Decision Boundary', 'Class C', 'Class D', 'Class E'},'Location','southwest', "FontSize", legend_font_size);
    end
    xlabel('x_1', 'FontSize', axis_font_size);
    ylabel('x_2', 'FontSize', axis_font_size);
end

