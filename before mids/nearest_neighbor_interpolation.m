% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
gray_scale = rgb2gray(original_image);

% Get the size of the original image
[R, C] = size(gray_scale);

% Initialize the transformed image as a zeros matrix
B = zeros(R, C);

% Transformation parameters
scaleX = 1.0;  % Change this value for scaling along the X-axis
shearX = 0.0;  % Change this value for shearing along the X-axis
translateX = 0; % Change this value for translation along the X-axis
shearY = 0.0;  % Change this value for shearing along the Y-axis
scaleY = 1.0;  % Change this value for scaling along the Y-axis
translateY = 0; % Change this value for translation along the Y-axis

% Transformation matrix
T = [scaleX, shearX, translateX; shearY, scaleY, translateY; 0, 0, 1];

% Loop over the pixels of the original image
for i = 1:R
    for j = 1:C
        % Apply the transformation
        transformed_point = T * [i; j; 1];
        
        % Extract the transformed coordinates
        x = round(transformed_point(1)); % Nearest neighbor interpolation
        y = round(transformed_point(2)); % Nearest neighbor interpolation
        
        % Check if the transformed coordinates are within the image bounds
        if x >= 1 && x <= R && y >= 1 && y <= C
            % Assign the pixel value using nearest-neighbor interpolation
            B(i, j) = gray_scale(x, y);
        end
    end
end

% Display the transformed image
imshow(uint8(B)); % Convert to uint8 for displaying grayscale image
