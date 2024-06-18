% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and rgdpmad columns
years = usa_data.year;
rgdpmad = usa_data.rgdpmad;

% Plot the rgdpmad per year for USA
figure;
plot(years, rgdpmad, '-o');
title('GDP per capita per Year for USA');
xlabel('Year');
ylabel('GDP per capita');
grid on;

% Save the figure
saveas(gcf, 'outputs/rgdpmad.pdf');