% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Specify the filename
filename = 'data/20240719_gauti.xlsx';

% Read the data from the .xlsx file
data = readtable(filename);

% Extract columns
dates = data{:, 1}; % Assuming the first column is dates
left_y_data = data{:, 2}; % Second column for the left y-axis (Google Trend Labor shortage)
right_y_data3 = data{:, 5}; % Fifth column for the right y-axis (inflation)

% Convert the dates to datetime if they are not already
dates = datetime(dates, 'InputFormat', 'yyyy-MM');

% Create a figure
figure;

% Plot the data for the left y-axis (inflation)
yyaxis left
hold on;
plot(dates, right_y_data3, '-', 'Color', [1, 0, 0], 'LineWidth', 1.5); % Custom red for the inflation data
ylabel('$\theta$', 'FontSize', 12, 'Interpreter', 'latex', 'Color', 'k'); % Adjust the label
ax = gca;
ax.YColor = 'k'; % Set the left y-axis graduations color to black
hold off;

% Plot the data for the right y-axis (Google Trend Labor shortage)
yyaxis right
plot(dates, left_y_data, '-', 'Color', [0, 0, 1], 'LineWidth', 1.5); % Pure blue for the Google Trend Labor shortage data
ylabel('Google Index', 'FontSize', 12, 'Interpreter', 'latex', 'Color', 'k'); % Adjust the label

% Set the title
%title('Monthly vacancies and unemployment for the USA, January 2008 - March 2024', 'FontSize', 14, 'Interpreter', 'latex'); % Adjust the title

% Set the font size and style for the axes
ax.FontSize = 12;
ax.FontName = 'Times New Roman'; % Set the font to Times New Roman

% Adjust the x-axis ticks
ax.XTick = datetime(2008:2:2024, 1, 1);

% Set the right y-axis graduations color to black
ax.YAxis(2).Color = 'k';

% Add legend
legend_obj = legend({'Inflation (left y-axis)', 'Google Index (right y-axis)'}, 'Location', 'northwest', 'FontSize', 10, 'Interpreter', 'latex');

% Remove legend box and set background to none
set(legend_obj, 'Box', 'off');
set(legend_obj, 'Color', 'none');

% Adjust legend position
legend_position = get(legend_obj, 'Position');
legend_position(1) = 0.2; % Adjust this value to move the legend left/right
set(legend_obj, 'Position', legend_position);

% Add grid
grid on;
ax.GridAlpha = 0.3; % Set grid line transparency

% Set figure background to white
set(gcf, 'Color', 'w');

% Save the figure
saveas(gcf, 'outputs/gauti_figure2.eps');