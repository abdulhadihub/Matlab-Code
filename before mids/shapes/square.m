a = zeros(300, 300);
cx = 150;
cy = 150;
myRadius = 40;

[r, c] = size(a);
for i = 1:r
    for j = 1:c
        if (max(abs(i - cx), abs(j - cy)) <= myRadius)
            a(i, j) = 255;
        end
    end
end

figure;
imshow(a, []);
