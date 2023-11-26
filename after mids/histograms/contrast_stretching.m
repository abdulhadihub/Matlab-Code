function contrastStretchedImage = contrast_stretching(originalImage)
    % Convert the original image to double if it's not already
    originalImage = im2double(rgb2gray(originalImage));

    % Find the minimum and maximum pixel values
    minIntensity = min(originalImage(:));
    maxIntensity = max(originalImage(:));

    % Perform simple contrast stretching
    contrastStretchedImage = ((originalImage - minIntensity) / (maxIntensity - minIntensity)) * 255;
end
