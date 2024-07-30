% Change current folder
cd '/Users/adrienfoutelet/Dropbox/Adrien/8_Brown/RA/202406_Eggertsson/macro_textbook'

% Import data from the Excel file
data = readtable('data/GoogleTrendLSCPI.xlsx');

% Extract columns from the table
months = data.Month;
coreCPIInflation = data.CoreCPIInflation;
laborShortage = data.LaborShortage;
supplyShortages = data.SupplyShortages;
supplyChainShortage = data.SupplyChainShortage;

% Convert months to datetime format if necessary
months = datetime(months, 'InputFormat', 'yyyy-MM');

% Create a new figure
figure;

% Plot Core CPI Inflation on the left y-axis
yyaxis left;
plot(months, coreCPIInflation, 'r-', 'DisplayName', 'Core CPI Inflation', 'LineWidth', 2);
ylabel('Core CPI Inflation');
ax = gca;
ax.YColor = 'k'; % Set color of left y-axis, its label, and ticks to black
ax.FontName = 'Times New Roman';
ax.FontSize = 12;

% Plot Labor Shortage, Supply Shortages, and Supply Chain Shortage on the right y-axis
yyaxis right;
hold on;
plot(months, laborShortage, 'b-', 'DisplayName', 'Labor Shortage', 'LineWidth', 2);
plot(months, supplyShortages, 'Color', [0, 0.5, 0], 'LineStyle', '-', 'DisplayName', 'Supply Shortages', 'LineWidth', 2); % Darker Green
plot(months, supplyChainShortage, 'Color', [0.9, 0.9, 0], 'LineStyle', '-', 'DisplayName', 'Supply Chain Shortage', 'LineWidth', 2); % Darker Yellow

ax = gca;
ax.YColor = 'k'; % Set color of right y-axis, its label, and ticks to black

% Customize the legend
lgd = legend({'Core CPI Inflation (left y-axis)', 'Labor Shortage (right y-axis)', 'Supply Shortage', 'Supply Chain Shortage'});
lgd.Box = 'off';           % Removes the box around the legend
lgd.Color = 'none';        % Makes the background transparent
lgd.Location = 'northwest';
lgd.FontName = 'Times New Roman';

% Customize the x-axis to display only years
datetick('x', 'yyyy', 'keepticks'); % Format x-axis as years only
ax.XAxis.TickLabelFormat = 'yyyy'; % Ensure the tick labels are formatted to show only year
%xlabel('Year');                    % Label x-axis as 'Year'

% Additional customization for better presentation
grid on;                           % Ensure grid is on

% Save the figure
saveas(gcf, 'outputs/gauti_figure7.eps');