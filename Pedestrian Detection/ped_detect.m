threshold = [1,0.9,0.8,0.7,0.60];
for i = 1:5
    img = imread(['ped' int2str(i) '.jpg']);
    [scale, ~, ~] = size(img);
    scale = 500/scale;
    imresize(img, scale);
    output = personDetect(img, threshold(i));
    imwrite(output, ['output_ped' int2str(i) '.jpg']);
    figure;
    imshow(['output_ped' int2str(i) '.jpg']);
end    