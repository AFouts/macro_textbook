% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and cpi columns
years = usa_data.year;
cpi = usa_data.cpi;

% Calculate the inflation rate as the percentage change in CPI
inflation_rate = (cpi(2:end) - cpi(1:end-1)) ./ cpi(1:end-1) * 100;

% Plot the CPI per year for USA
figure;
plot(years, inflation_rate, '-o');
title('CPI inflation rate per year for the USA, 1870-2020');
xlabel('Year');
ylabel('CPI');
grid on;

% Save the figure
saveas(gcf, 'outputs/cpi_inflation.pdf');