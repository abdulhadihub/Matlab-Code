% Load your image
originalImage = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');

% Apply simple contrast stretching using the function
contrastStretchedImage = contrast_stretching(originalImage);

% Display the results
figure;
subplot(2, 1, 1), imshow(originalImage), title('Original Image');
subplot(2, 1, 2), imshow(contrastStretchedImage, []), title('Contrast Stretched Image');
