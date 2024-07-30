% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6_augmented.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and rgdpmad columns
years = usa_data.year;
rgdpmad = usa_data.rgdpmad;

% Compute the natural logarithm of rgdpmad
log_rgdpmad = log(rgdpmad);

% Plot the log rgdpmad per year for USA
figure;
plot(years, log_rgdpmad, '-o');
title('log GDP per capita for the USA, 1870-2023');
xlabel('Year');
ylabel('GDP per capita');
grid on;

% Add source information below the graph
source_text ={'Source: Òscar Jordà, Moritz Schularick, and Alan M. Taylor. 2017. Macrofinancial History and the New Business Cycle Facts. in NBER', 'Macroeconomics Annual 2016, volume 31, edited by Martin Eichenbaum and Jonathan A. Parker. Chicago: University of Chicago Press,', '[rgdpmad] Real GDP per capita (PPP, 1990 Int$, Maddison), as of 18 June 2024 (1870-2010 from The Maddison-Project; 2011-2024 from', 'International Monetary Fund World Economic Outlook (2024))'};
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/log_rgdpmad.pdf');
