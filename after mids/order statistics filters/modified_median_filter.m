function output_image = modified_median_filter(input_image, window_size)
    [rows, cols] = size(input_image);
    half_window = floor(window_size / 2);
    
    input_image = im2double(input_image);
    % Pad the input image to handle border pixels
    padded_image = padarray(input_image, [half_window, half_window], 'replicate');
    
    % Initialize the output image
    output_image = zeros(rows, cols);
    
    % Apply the modified median filter
    for i = 1:rows
        for j = 1:cols
            % Extract the window
            window = padded_image(i:i+window_size-1, j:j+window_size-1);
            
            % Flatten the window to a 1D array
            window_flat = window(:);
            
            % Remove repeating values
            unique_values = unique(window_flat);
            
            % Calculate the median value
            median_value = median(unique_values);
            
            % Assign the result to the output image
            output_image(i, j) = median_value;
        end
    end
end
