% Load the image
input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the input image to double data type for calculations
input_image = im2double(input_image);

% Define the constant for scaling (adjust as needed)
c = 1;

% Specify the gamma value for the power-law transformation
gamma = 1.5;  % Adjust gamma as needed

% Apply the power-law transformation
output_image = c * (input_image.^gamma);

% Ensure the output is in the range [0, 1]
output_image = min(max(output_image, 0), 1);

% Display the original and transformed images
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');

subplot(1, 2, 2);
imshow(output_image);
title(['Transformed Image (Gamma = ', num2str(gamma), ')']);

% Create a figure for the plot
figure;
% Plot the relationship between original pixel values (A) and transformed values (B)
plot(input_image(:), output_image(:), '.');
title('Transformation Relationship');
xlabel('Original Pixel Values (x)');
ylabel('Transformed Values (f(x))');
show;
