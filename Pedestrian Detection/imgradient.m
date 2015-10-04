img = imread('img_name.jpg');
img_gray = rgb2gray(img);
img_gray = double(img_gray)/255;
[Gx, Gy] = imgradientxy(img);
[Gmag, Gdir] = imgradient(img_gray);
