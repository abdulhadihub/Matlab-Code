% Load your image
input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Set the window size (choose an odd value)
window_size = 3;

% Apply local histogram equalization
output_image = local_histogram_equalization(input_image, window_size);

% Display the results
figure;
subplot(2, 1, 1), imshow(input_image), title('Original Image');
subplot(2, 1, 2), imshow(output_image, []), title('Local Histogram Equalized Image');
