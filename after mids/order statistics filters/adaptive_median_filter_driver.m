inputImage = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');
maxWindowSize = 7; % Adjust as needed

meanValue = 0;
varianceValue = 0.01; 
noisyImage = imnoise(inputImage, 'gaussian', meanValue, varianceValue);
outputImage = adaptiveMedianFilter(noisyImage, maxWindowSize);

% Display the original and filtered images
figure;
subplot(3, 1, 1);
imshow(inputImage);
title('Original Image');

subplot(3, 1, 2);
imshow(noisyImage);
title('Noisy Image');

subplot(3, 1, 3);
imshow(outputImage);
title('Filtered Image');
