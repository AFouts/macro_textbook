% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year, rgdpmad and unemp columns
years = usa_data.year;
rgdpmad = usa_data.rgdpmad;
unemp = usa_data.unemp;

% Compute the ratio of rgdp and unemp
gdp_unemp_ratio = rgdpmad ./ unemp;



% Plot the ratio of rgdp and unemp per year for USA
figure;
plot(years, gdp_unemp_ratio, '-o');
title('GDP per capita/unemployment rate per Year for USA');
xlabel('Year');
ylabel('GDP per capita/unemployment rate');
grid on;

% Save the figure
saveas(gcf, 'outputs/gdp_unemp_ratio.pdf');