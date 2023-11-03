a = rgb2gray(imread('C:\Users\Abdul Hadi\Desktop\test1.jpg'));
[r, c] = size(a);
b = zeros(r, c);
filterSize = 3;

for i = 2:1:r-1
    for j = 2:1:c-1
        myN = a(i-1:i+1,j-1:j+1);
        myNR = reshape(myN,1,9);
        myNRS = sum(myNR);
        myValue = myNRS/9;
        b(i,j)=myValue;
    end
end


figure;imshow(a,[]);
figure;imshow(b,[]);