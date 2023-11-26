% Load your image
input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Set the target range (values between 0 and 1)
target_range = [0.1, 0.9];

% Apply histogram sliding
output_image = histogram_sliding(input_image, target_range);

% Display the results
figure;
subplot(2, 1, 1), imshow(input_image), title('Original Image');
subplot(2, 1, 2), imshow(output_image), title('Histogram Sliding Image');
