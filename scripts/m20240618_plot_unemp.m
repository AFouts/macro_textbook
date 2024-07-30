% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Load the data from the .xls file
filename = 'data/JSTdatasetR6_augmented.xlsx';
data = readtable(filename);

% Filter data for USA only
usa_data = data(strcmp(data.country, 'USA'), :);

% Extract year and rgdpmad columns
years = usa_data.year;
unemp = usa_data.unemp;

% Plot the unemp per year for USA
figure;
plot(years, unemp, '-o');
title('Yearly unemployment rate for the USA, 1870-2023');
xlabel('Year');
ylabel('Unemployment rate');
grid on;

% Add source information below the graph
source_text = {'Source: Òscar Jordà, Moritz Schularick, and Alan M. Taylor. 2017. Macrofinancial History and the New Business Cycle Facts. in NBER', 'Macroeconomics Annual 2016, volume 31, edited by Martin Eichenbaum and Jonathan A. Parker. Chicago: University of Chicago Press,', '[unemp] Unemployment rate (percent), as of 18 June 2024 (1890-1946: Mitchell, Brian (2013), International Historical Statistics The', 'Americas, 1750 – 2010, Palgrave Macmillan, London; 1947-2023: ILOSTAT (2024))'};
dim = [0.2, 0.1, 0.7, 0.1]; % Adjust the position and size of the text box as needed
annotation('textbox', dim, 'String', source_text, 'FitBoxToText', 'on', 'EdgeColor', 'none', 'FontSize', 6);

% Save the figure
saveas(gcf, 'outputs/unemp.pdf');