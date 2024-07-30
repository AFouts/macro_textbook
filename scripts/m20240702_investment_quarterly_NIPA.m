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
investment_chained_dollars = data(strcmp(data.x_SeriesCode', 'A006RX'), :);

% Extract quarter and variable columns
period = investment_chained_dollars.Period;
A006RX = investment_chained_dollars.Value;

% Remove thousands separators and convert 'Value' to numeric
A006RX = strrep(A006RX, ',', '');
A006RX = str2double(A006RX);

% Convert 'Period' to datetime using quarters
period = datetime(period, 'InputFormat', 'yyyyQQQ');

% Compute the natural logarithm of rgdpmad
%log_A191RX = log(A191RX);

% Plot the quarterly investment for USA
figure;
plot(period, A006RX, '-o');
title('Quarterly investment for the USA, 1947-2024');
xlabel('Quarter');
ylabel('Investment');
grid on;

% Add source information below the graph
source_text = 'Source: NIPA, [A006RX-Q] Gross private domestic investment, Chained Dollars, Level, as of 2 July 2024';
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/investment_A006RX-Q.pdf');