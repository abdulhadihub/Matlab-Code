% Load the two images
image1 = imread('C:\Users\Abdul Hadi\Desktop\test images\019.jpeg');  % Replace with the path to your first image
image2 = imread('C:\Users\Abdul Hadi\Desktop\test images\020.jpg');  % Replace with the path to your second image

% Convert the images to grayscale and ensure they are of the same size
image1 = rgb2gray(image1);
image2 = rgb2gray(image2);
image2 = imresize(image2, size(image1));

% Convert the images to integers
image1 = uint8(image1);
image2 = uint8(image2);

% Extract the last two LSB from image1
LSB_mask = uint8(3);  % Binary: 00000011
extracted_LSBs = bitand(image1, LSB_mask);

% Extract the two MSB from image2
MSB_mask = uint8(192);  % Binary: 11000000
extracted_MSBs = bitand(bitshift(image2, -6), MSB_mask);

% Combine the two sets of bits to create the hidden image
hidden_image = bitor(extracted_LSBs, extracted_MSBs);

% Display the original images and the hidden image
subplot(1, 3, 1);
imshow(image1);
title('Image 1');

subplot(1, 3, 2);
imshow(image2);
title('Image 2');

subplot(1, 3, 3);
imshow(hidden_image);
title('Hidden Image');

