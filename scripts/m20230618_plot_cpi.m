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

% Plot the CPI per year for USA
figure;
plot(years, cpi, '-o');
title('CPI per Year for USA');
xlabel('Year');
ylabel('CPI');
grid on;

% Save the figure
saveas(gcf, 'outputs/cpi.pdf');