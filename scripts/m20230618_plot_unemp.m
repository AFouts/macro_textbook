% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and rgdpmad columns
years = usa_data.year;
unemp = usa_data.unemp;

% Plot the unemp per year for USA
figure;
plot(years, unemp, '-o');
title('Unemployment rate per Year for USA');
xlabel('Year');
ylabel('Unemployment rate');
grid on;

% Save the figure
saveas(gcf, 'outputs/unemp.pdf');