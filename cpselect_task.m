image1 = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');
image2 = imread('C:\Users\Abdul Hadi\Desktop\test images\006 - copy.jpeg');

cpselect(image1, image2);

[inputPoints, basePoints] = cpstruct.InputPoints, cpstruct.BasePoints;
