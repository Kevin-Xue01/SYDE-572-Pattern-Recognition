function plot_error(avg_error, min_error, max_error, std_error)
    marker_size = 30;
    title_font_size = 15;
    legend_font_size = 8;
    axis_font_size = 15;
    LineWidth = 1.5;
    
    figure;
    hold on;
    plot(avg_error,'-o');
    plot(min_error,'-o');
    plot(max_error,'-o');
    plot(std_error,'-o');
    xlabel("J")
    ylabel("Error Rate")
    title("Error Rates for Different J", "FontSize", title_font_size);
    axis([1 5 0 0.6])
    legend({'Average Error Rate', 'Minimum Error Rate', 'Maximum Error Rate', 'Standard Deviation of Error Rates'},'Location','northeast', "FontSize", legend_font_size);
end

