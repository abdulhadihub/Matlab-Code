% Read the original image
originalImage = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg'); 
% Typecast the image to double
doubleImage = im2double(originalImage);

% Apply local histogram equalization separately to each channel
localEqImage = zeros(size(doubleImage));

for i = 1:size(doubleImage, 3)
    localEqImage(:,:,i) = adapthisteq(doubleImage(:,:,i), 'NumTiles', [8, 8]);
end

% Display the original and locally equalized images
figure;
subplot(1, 2, 1);
imshow(doubleImage);
title('Original Image');

subplot(1, 2, 2);
imshow(localEqImage);
title('Locally Equalized Image');

