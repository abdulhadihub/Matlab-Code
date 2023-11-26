function output_image = alpha_trimmed_mean_filter(input_image, window_size, alpha)
    [rows, cols] = size(input_image);
    half_window = floor(window_size / 2);
    
    input_image = im2double(input_image);
    % Pad the input image to handle border pixels
    padded_image = padarray(input_image, [half_window, half_window], 'replicate');
    
    % Initialize the output image
    output_image = zeros(rows, cols);
    
    % Apply the alpha-trimmed mean filter
    for i = 1:rows
        for j = 1:cols
            % Extract the window
            window = padded_image(i:i+window_size-1, j:j+window_size-1);
            
            % Flatten the window to a 1D array
            window_flat = window(:);
            
            % Sort the pixel values
            sorted_values = sort(window_flat);
            
            % Remove the smallest and largest alpha/2 values
            trimmed_values = sorted_values(1+alpha/2:end-alpha/2);
            
            % Calculate the average of the remaining values
            mean_value = mean(trimmed_values);
            
            % Assign the result to the output image
            output_image(i, j) = mean_value;
        end
    end
end
