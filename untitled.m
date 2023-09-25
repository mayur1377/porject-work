% Generate random data
num_points = 100; % Change this to the number of random points you want
x = rand(num_points, 1); % Random x-coordinates between 0 and 1
y = rand(num_points, 1); % Random y-coordinates between 0 and 1

% Create an array of structures to store the scatter plot data
scatterDataPoints = struct('x', num2cell(x), 'y', num2cell(y));

% Create a structure with the 'scatterDataPoints' field
scatterData = struct('dataPoints', scatterDataPoints);

% Add circle data to the structure
center_x = 0.5; % X-coordinate of the circle's center
center_y = 0.5; % Y-coordinate of the circle's center
radius = 0.2;   % Radius of the circle
circleData = struct('x', center_x, 'y', center_y, 'radius', radius);

% Create a structure to hold both scatter and circle data
combinedData = struct('scatterData', scatterData, 'circleData', circleData);

% Convert the data to a JSON-formatted string
json_str = jsonencode(combinedData);

% Specify the file name
file_name = 'data.json';

% Write the JSON string to the file
fid = fopen(file_name, 'w');
if fid == -1
    error('Could not open file for writing.');
end
fwrite(fid, json_str, 'char');
fclose(fid);

disp(['Data written to ' file_name]);

% Display the figure
scatter(x, y);
title('Random Data Points');
xlabel('X-axis');
ylabel('Y-axis');
grid on;

% Add a circle in the middle
hold on;
rectangle('Position', [center_x - radius, center_y - radius, 2 * radius, 2 * radius], 'Curvature', [1, 1], 'EdgeColor', 'r');
hold off;
