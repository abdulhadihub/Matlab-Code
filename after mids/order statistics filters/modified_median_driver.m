input_image = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Convert to grayscale if needed
input_image_gray = rgb2gray(input_image);

noisyImage = imnoise(input_image_gray, 'salt & pepper', 0.2);

% Set the window size (choose an odd value)
window_size = 3;

% Apply the median filter
output_image = modified_median_filter(noisyImage, window_size);

% Display the results
figure;
subplot(3, 1, 1), imshow(input_image_gray), title('Original Image');
subplot(3, 1, 2), imshow(noisyImage), title('Noisy Image');
subplot(3, 1, 3), imshow(output_image, []), title('Median Filtered Image');