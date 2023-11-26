% Load your image
input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Apply histogram equalization
output_image = histogram_equalization(input_image);

% Display the results
figure;
subplot(2, 1, 1), imshow(input_image), title('Original Image');
subplot(2, 1, 2), imshow(output_image), title('Histogram Equalized Image');
