function output_image = histogram_equalization(input_image)
    % Convert the input image to grayscale if it's in color
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    % Calculate the histogram of the input image
    histogram = imhist(input_image);
    
    % Calculate the cumulative distribution function (CDF) of the histogram
    cdf = cumsum(histogram) / numel(input_image);
    
    % Perform histogram equalization
    output_image = uint8(255 * cdf(input_image + 1));
end
