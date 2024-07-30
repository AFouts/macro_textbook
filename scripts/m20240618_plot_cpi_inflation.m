% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6_augmented.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and cpi columns
years = usa_data.year;
cpi = usa_data.cpi;

% Calculate the inflation rate as the percentage change in CPI
inflation_rate = (cpi(2:end) - cpi(1:end-1)) ./ cpi(1:end-1) * 100;

% Adjust the years vector to match the inflation rate calculation
years_inflation = years(2:end);

% Plot the CPI per year for USA
figure;
plot(years_inflation, inflation_rate, '-o');
title('Yearly CPI inflation rate for the USA, 1870-2023');
xlabel('Year');
ylabel('CPI');
grid on;

% Add source information below the graph
source_text = {'Source: Òscar Jordà, Moritz Schularick, and Alan M. Taylor. 2017. Macrofinancial History and the New Business Cycle Facts. in NBER', 'Macroeconomics Annual 2016, volume 31, edited by Martin Eichenbaum and Jonathan A. Parker. Chicago: University of Chicago Press,', '[cpi] Consumer prices (index, 1990=100), as of 18 June 2024 ((1870-1946: Peter H. Lindert and Richard Sutch, “Consumer price indexes,', 'for all items: 1774-2003”; 1947-1977: FRED dataset; 1978-2023: Bureau of Labor Statistics (2024))'};
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/cpi_inflation.pdf');