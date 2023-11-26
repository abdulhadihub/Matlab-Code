% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\017.jpeg');  % Replace with the path to your image

% Convert the image to grayscale
A = rgb2gray(im2double(original_image));

% Specify the bit position you want to extract (0 to 7)
bit_position = 0;  % Change this value to the desired bit position

% Initialize a new image for the extracted bit plane
bit_plane = zeros(size(A));

% Extract the specified bit plane
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        pixel_value = A(i, j);
        % Check if the bit at the specified position is set
        if bitget(uint8(pixel_value), bit_position + 1)
            bit_plane(i, j) = 255;  % Set the pixel to white (255) if the bit is set
        end
    end
end

% Display the original image and the extracted bit plane
subplot(1, 2, 1);
imshow(A);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(bit_plane));
title(['Bit Plane ', num2str(bit_position)]);
