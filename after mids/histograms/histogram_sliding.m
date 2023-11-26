function output_image = histogram_sliding(input_image, target_range)
    % Convert the input image to grayscale if it's in color
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    input_image = im2double(input_image);
    
    % Ensure the target range is valid (between 0 and 1)
    target_range = max(0, min(target_range, 1));
    
    % Calculate the target intensity range
    target_min = quantile(input_image(:), target_range(1));
    target_max = quantile(input_image(:), target_range(2));
    
    % Perform histogram sliding
    output_image = imadjust(input_image, [target_min/255, target_max/255], [0, 1]);
end
