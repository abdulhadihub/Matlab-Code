% Read the grayscale image
a = rgb2gray(imread('C:\Users\Abdul Hadi\Desktop\stars.jpg'));

% Get the size of the input image
[r, c] = size(a);

% Set the filter size (you can change this value as needed)

filterSize = input('Enter filter size: ') % Change this to the desired filter size

% Calculate the padding size based on the filter size
padding = floor(filterSize / 2);

% Initialize the output image
b = zeros(r, c);

% Nested loops to apply the filter
for i = 1 + padding : r - padding
    for j = 1 + padding : c - padding
        % Extract the neighborhood based on the filter size
        myN = a(i - padding : i + padding, j - padding : j + padding);
        
        % Calculate the filter result (in this case, the average)
        myValue = mean(myN(:));
        
        % Assign the result to the corresponding pixel in the output image
        b(i, j) = myValue;
    end
end

% Display the original and filtered images
figure; imshow(a, []);
figure; imshow(b, []);
