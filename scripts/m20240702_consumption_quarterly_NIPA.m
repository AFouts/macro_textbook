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
consumption_chained_dollars = data(strcmp(data.x_SeriesCode', 'DPCERX'), :);

% Extract quarter and variable columns
period = consumption_chained_dollars.Period;
DPCERX = consumption_chained_dollars.Value;

% Remove thousands separators and convert 'Value' to numeric
DPCERX = strrep(DPCERX, ',', '');
DPCERX = str2double(DPCERX);

% Convert 'Period' to datetime using quarters
period = datetime(period, 'InputFormat', 'yyyyQQQ');

% Compute the natural logarithm of rgdpmad
%log_A191RX = log(A191RX);

% Plot the quarterly consumption for USA
figure;
plot(period, DPCERX, '-o');
title('Quarterly consumption for the USA, 1947-2024');
xlabel('Quarter');
ylabel('Consumption');
grid on;

% Add source information below the graph
source_text = 'Source: NIPA, [DPCERX-Q] Personal consumption expenditures, Chained Dollars, Level, as of 2 July 2024';
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/consumption_DPCERX-Q.pdf');