% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
gray_scale = rgb2gray(original_image);

% Get the size of the original image
[R, C] = size(gray_scale);

% Initialize the transformed image as a zeros matrix
B = zeros(R, C);

% Rotation angle in degrees (counter-clockwise)
theta = 45; % You can change this angle as needed

% Convert the angle to radians
theta_rad = deg2rad(theta);

% Rotation parameters
a0 = cos(theta_rad);
a1 = -sin(theta_rad);
a2 = 0;
b0 = sin(theta_rad);
b1 = cos(theta_rad);
b2 = 0;

% Transformation matrix
T = [a0, a1, a2; b0, b1, b2; 0, 0, 1];

% Loop over the pixels of the original image
for i = 1:R
    for j = 1:C
        % Apply the transformation
        transformed_point = T * [i; j; 1];
        
       % Apply the inverse transformation
        inverse_value = inv(T) * [i; j; 1];
        
        % Extract the inverse coordinates
        x = inverse_value(1);
        y = inverse_value(2);
        
        % Check if the inverse coordinates are within the image bounds
        if x >= 1 && x <= R && y >= 1 && y <= C
            % Interpolate pixel values if necessary
            x1 = floor(x);
            x2 = ceil(x);
            y1 = floor(y);
            y2 = ceil(y);
            
            % Bilinear interpolation (you can use other methods if needed)
            value = (1 - (x - x1)) * (1 - (y - y1)) * gray_scale(x1, y1) + ...
                    (1 - (x - x1)) * (y - y1) * gray_scale(x1, y2) + ...
                    (x - x1) * (1 - (y - y1)) * gray_scale(x2, y1) + ...
                    (x - x1) * (y - y1) * gray_scale(x2, y2);
            
            % Assign the interpolated value to the transformed image
            B(i, j) = value;
            end
        
        % Extract the transformed coordinates
        x = transformed_point(1);
        y = transformed_point(2);
        
        % Check if the transformed coordinates are within the image bounds
        if x >= 1 && x <= R && y >= 1 && y <= C
            % Interpolate pixel values if necessary
            x1 = floor(x);
            x2 = ceil(x);
            y1 = floor(y);
            y2 = ceil(y);
            
            % Bilinear interpolation (you can use other methods if needed)
            value = (1 - (x - x1)) * (1 - (y - y1)) * gray_scale(x1, y1) + ...
                    (1 - (x - x1)) * (y - y1) * gray_scale(x1, y2) + ...
                    (x - x1) * (1 - (y - y1)) * gray_scale(x2, y1) + ...
                    (x - x1) * (y - y1) * gray_scale(x2, y2);
            
            % Assign the interpolated value to the transformed image
            B(i, j) = value;
        end
    end
end

% Display the transformed image
imshow(uint8(B)); % Convert to uint8 for displaying grayscale image
