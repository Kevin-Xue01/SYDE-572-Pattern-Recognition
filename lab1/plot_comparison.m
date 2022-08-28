function plot_comparison(case_number, X1, X2, ...
    MED_classes, GED_classes, MAP_classes, NN_classes, kNN_classes,...
    transformed_pts_A, transformed_pts_B, transformed_pts_C, transformed_pts_D, transformed_pts_E)
    
    marker_size = 30;
    legend_font_size = 12;
    axis_font_size = 15;
    title_font_size = 15;
    
    if case_number == 1
        % plot of MED, GED and MAP decision boundaries
        figure;
        contour(X1, X2, MED_classes, 1, 'k');
        hold on;
        contour(X1, X2, GED_classes, 1, 'c');
        hold on;
        contour(X1, X2, MAP_classes, 1, '--m');
        hold on;
        scatter(transformed_pts_A(:, 1), transformed_pts_A(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_B(:, 1), transformed_pts_B(:, 2), marker_size, 'blue', 'x');
        hold on;
        legend({'MED Decision Boundary', 'GED/MICD Decision Boundary', 'MAP Decision Boundary', 'Class A', 'Class B'},'Location','southwest', "FontSize", legend_font_size);
        title('Case 1: MED, GED, and MAP decision boundaries for Class A and B', "FontSize", title_font_size);
        xlabel('x_1', 'FontSize', axis_font_size);
        ylabel('x_2', 'FontSize', axis_font_size);
    
        % plot of NN and KNN decision boundaries
        figure;
        contour(X1, X2, NN_classes, 1, 'k');
        hold on;
        contour(X1, X2, kNN_classes, 1, 'm');
        hold on;
        scatter(transformed_pts_A(:, 1), transformed_pts_A(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_B(:, 1), transformed_pts_B(:, 2), marker_size, 'blue', 'x');
        hold on;
        legend({'NN Decision Boundary', 'kNN Decision Boundary', 'Class A', 'Class B'},'Location','southwest', "FontSize", legend_font_size);
        title('Case 1: NN and kNN (k=5) decision boundaries for Class A and B', "FontSize", title_font_size);
        xlabel('x_1', 'FontSize', axis_font_size);
        ylabel('x_2', 'FontSize', axis_font_size);
    else 
        % plot of MED, GED and MAP decision boundaries
        figure;
        contour(X1, X2, MED_classes, 2, 'k');
        hold on;
        contour(X1, X2, GED_classes, 2, 'c');
        hold on;
        contour(X1, X2, MAP_classes, 2, '--m');
        hold on;
        scatter(transformed_pts_C(:, 1), transformed_pts_C(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_D(:, 1), transformed_pts_D(:, 2), marker_size, 'blue', 'x');
        hold on;
        scatter(transformed_pts_E(:, 1), transformed_pts_E(:, 2), marker_size, 'green', 'x');
        hold on;
        legend({'MED Decision Boundary', 'GED/MICD Decision Boundary', 'MAP Decision Boundary', 'Class C', 'Class D', 'Class E'},'Location','southwest', "FontSize", legend_font_size);
        title('Case 2: MED, GED, and MAP decision boundaries for Class C, D, and E', "FontSize", title_font_size);
        xlabel('x_1', 'FontSize', axis_font_size);
        ylabel('x_2', 'FontSize', axis_font_size);
    
        % plot of NN and kNN decision boundaries
        figure;
        contour(X1, X2, NN_classes, 2, 'k');
        hold on;
        contour(X1, X2, kNN_classes, 2, 'm');
        hold on;
        scatter(transformed_pts_C(:, 1), transformed_pts_C(:, 2), marker_size, 'red', 'x');
        hold on;
        scatter(transformed_pts_D(:, 1), transformed_pts_D(:, 2), marker_size, 'blue', 'x');
        hold on;
        scatter(transformed_pts_E(:, 1), transformed_pts_E(:, 2), marker_size, 'green', 'x');
        hold on;
        legend({'NN Decision Boundary', 'kNN Decision Boundary', 'Class C', 'Class D', 'Class E'},'Location','southwest', "FontSize", legend_font_size);
        title('Case 2: NN and kNN (k=5) decision boundaries for Class C, D, and E', "FontSize", title_font_size);
        xlabel('x_1', 'FontSize', axis_font_size);
        ylabel('x_2', 'FontSize', axis_font_size);
    end
end

