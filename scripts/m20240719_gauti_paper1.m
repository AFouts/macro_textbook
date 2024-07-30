% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Specify the filename
filename = 'data/20240719_gauti.xlsx';

% Read the data from the .xlsx file
data = readtable(filename);

% Extract columns
dates = data{:, 1}; % Assuming the first column is dates
left_y_data = data{:, 2}; % Second column for the left y-axis
right_y_data1 = data{:, 3}; % Third column for the right y-axis
right_y_data2 = data{:, 4}; % Fourth column for the right y-axis
right_y_data3 = data{:, 5}; % Fifth column for the right y-axis

% Convert the dates to datetime if they are not already
dates = datetime(dates, 'InputFormat', 'yyyy-MM');

% Specify the date past which to fill the area
fill_start_date = datetime('2018-01-01');

% Create a figure
figure;

% Plot the data for the right y-axis
yyaxis right
hold on;

% Plot the data on top of the area
plot(dates, right_y_data1, '-', 'Color', [0.8500, 0.3250, 0.0980]); % Custom red for the first right y-axis data
plot(dates, right_y_data2, '-', 'Color', [0.9290, 0.6940, 0.1250]); % Custom yellow for the second right y-axis data
plot(dates, right_y_data3, '-', 'Color', [0.4940, 0.1840, 0.5560]); % Custom purple for the third right y-axis data

% Determine y-axis limits to ensure the fill reaches the top of the plot
y_limits = ylim;
max_y = y_limits(2); % Get the upper limit of the y-axis

% Find the index of the fill start date
fill_start_idx = find(dates >= fill_start_date, 1);

% Fill the area above the curve of right_y_data2 past the fill_start_date
if ~isempty(fill_start_idx)
    fill_dates = [dates(fill_start_idx:end); flip(dates(fill_start_idx:end))];
    fill_values = [right_y_data2(fill_start_idx:end); max_y * ones(size(right_y_data2(fill_start_idx:end)))];
    
    fill(fill_dates, fill_values, [0.8 0.8 0.8], 'EdgeColor', 'none', 'FaceAlpha', 0.5);
end

ylabel(''); % Adjust the label
hold off;

% Plot the data for the left y-axis
yyaxis left
plot(dates, left_y_data, '-', 'Color', [0, 0.4470, 0.7410]); % Custom blue for the left y-axis data
ylabel(''); % Adjust the label

% Set the x-axis label and title
xlabel('Time');
title('Monthly vacancies and unemployment for the USA, January 2008 - March 2024'); % Adjust the title

% Add legend
legend_obj = legend({'Google Trend Labor shortage (left y-axis)', 'v/u (right y-axis)', 'v/u=1 v/u (right y-axis)', 'inflation (right y-axis)'}, 'Location', 'best');

% Adjust legend position
legend_position = get(legend_obj, 'Position');
legend_position(1) = 0.2; % Adjust this value to move the legend left/right
set(legend_obj, 'Position', legend_position);

% Add grid
grid off;

% Add source information below the graph
source_text = 'Source: add source ';
dim = [0.15, 0.6, 0.2, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/gauti_paper_1.pdf');