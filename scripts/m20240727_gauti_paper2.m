% Change current folder to the directory containing the .json files
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Specify the filenames
filename_dots = 'data/phillips_curve_dots.json';
filename_crosses = 'data/phillips_curve_crosses.json';

% Read the JSON data from the files
jsonData_dots = fileread(filename_dots);
jsonData_crosses = fileread(filename_crosses);

% Decode the JSON data
data_dots = jsondecode(jsonData_dots);
data_crosses = jsondecode(jsonData_crosses);

% Extract dataset for dots
dataset_dots = data_dots.datasetColl(1);
x_data_dots = [];
y_data_dots = [];

for i = 1:length(dataset_dots.data)
    x_data_dots(end+1) = dataset_dots.data(i).value(1);
    y_data_dots(end+1) = dataset_dots.data(i).value(2);
end

% Extract dataset for crosses
dataset_crosses = data_crosses.datasetColl(1);
x_data_crosses = [];
y_data_crosses = [];

for i = 1:length(dataset_crosses.data)
    x_data_crosses(end+1) = dataset_crosses.data(i).value(1);
    y_data_crosses(end+1) = dataset_crosses.data(i).value(2);
end

% Create a figure
figure;

% Plot the data from dots
plot(x_data_dots, y_data_dots, 'o', 'MarkerEdgeColor', [200, 0, 0]/255, 'MarkerFaceColor', [200, 0, 0]/255);
hold on; % Keep the plot for additional data

% Plot the data from crosses
plot(x_data_crosses, y_data_crosses, 'x', 'MarkerEdgeColor', [0, 0, 200]/255, 'MarkerFaceColor', [0, 0, 200]/255);

% Calculate and plot the curve for the given equation
x_curve = linspace(min([x_data_dots, x_data_crosses]), max([x_data_dots, x_data_crosses]), 1000);
y_curve = 9.638 * (x_curve .^ -1.394) - 0.900;
plot(x_curve, y_curve, 'k-', 'LineWidth', 2);

% Add labels and title
xlabel('Unemployment, %.');
ylabel('Rate of change of money wage rates, % per year.');
title('Philips Curve 1861-1913 (1958)');

% Add grid
grid on;

% Save the figure
saveas(gcf, 'outputs/gauti_paper_2.pdf');







% Change current folder to the directory containing the .json file
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Specify the filename
filename = 'data/philips_curve_dots.json';

% Read the JSON data from the file
jsonData = fileread(filename);
data = jsondecode(jsonData);

% Extract dataset
dataset = data.datasetColl(1); % Use parentheses for structure array
x_data = [];
y_data = [];

for i = 1:length(dataset.data)
    x_data(end+1) = dataset.data(i).value(1); % Extract the first value in the value array
    y_data(end+1) = dataset.data(i).value(2); % Extract the second value in the value array
end

% Create a figure
figure;

% Plot the data
plot(x_data, y_data, 'o', 'MarkerEdgeColor', [200, 0, 0]/255, 'MarkerFaceColor', [200, 0, 0]/255);
xlabel('Unemployment, %.'); % Adjust the label as needed
ylabel('Rate of change of money wage rates, % per year.'); % Adjust the label as needed
title('Philips Curve (1958), 1861-1913'); % Adjust the title as needed

% Add grid
grid on;

% Save the figure
saveas(gcf, 'outputs/gauti_paper_2.pdf');