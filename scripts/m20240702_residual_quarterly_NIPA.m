% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/FlatFiles/nipadataQ.txt';

% Read the data from the .txt file
opts = delimitedTextImportOptions("NumVariables", 3);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["x_SeriesCode'", "Period", "Value"];
opts.VariableTypes = ["string", "string", "string"];

data = readtable(filename);

% Filter data for USA only
residual_chained_dollars = data(strcmp(data.x_SeriesCode', 'A960RX'), :);

% Extract quarter and variable columns
period = residual_chained_dollars.Period;
A960RX = residual_chained_dollars.Value;

% Remove thousands separators and convert 'Value' to numeric
A960RX = strrep(A960RX, ',', '');
A960RX = str2double(A960RX);

% Convert 'Period' to datetime using quarters
period = datetime(period, 'InputFormat', 'yyyyQQQ');

% Compute the natural logarithm of rgdpmad
%log_A191RX = log(A191RX);

% Plot the quarterly residual for USA
figure;
plot(period, A960RX, '-o');
title('Quarterly residual for the USA, 1947-2024');
xlabel('Quarter');
ylabel('Residual');
grid on;

% Add source information below the graph
source_text = 'Source: NIPA, [A960RX-Q] Residual, Chained Dollars, Level, as of 2 July 2024';
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/residuals_A960RX-Q.pdf');