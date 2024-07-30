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
government_C_I_chained_dollars = data(strcmp(data.x_SeriesCode', 'A822RX'), :);

% Extract quarter and variable columns
period = government_C_I_chained_dollars.Period;
A822RX = government_C_I_chained_dollars.Value;

% Remove thousands separators and convert 'Value' to numeric
A822RX = strrep(A822RX, ',', '');
A822RX = str2double(A822RX);

% Convert 'Period' to datetime using quarters
period = datetime(period, 'InputFormat', 'yyyyQQQ');

% Compute the natural logarithm of rgdpmad
%log_A191RX = log(A191RX);

% Plot the quarterly government consumption expenditures and gross investment for USA
figure;
plot(period, A822RX, '-o');
title('Quarterly government consumption expenditures and gross investment for the USA, 1947-2024');
xlabel('Quarter');
ylabel('Government consumption expenditures and gross investment');
grid on;

% Add source information below the graph
source_text = 'Source: NIPA, [A822RX-Q] Government, Chained Dollars, Level, as of 2 July 2024';
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/government_C_I_A822RX-Q.pdf');