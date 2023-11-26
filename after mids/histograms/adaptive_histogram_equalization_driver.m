% Load your image
input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Set the window size (choose an odd value)
window_size = 3;
k0 = 0.5;
k1 = 0.5;
k2 = 0.1;

% Apply local histogram equalization
output_image = adaptive_histogram_equalization(input_image, window_size, k0,k1,k2);

% Display the results
figure;
subplot(2, 1, 1), imshow(input_image), title('Original Image');
subplot(2, 1, 2), imshow(output_image, []), title('Adaptive Histogram Equalized Image');
