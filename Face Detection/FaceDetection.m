%KEVIN WANG
function [DetectImg] = FaceDetection(imgname, threshold, output)

img = imread(imgname);
img = imresize(img, 0.5);
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART', 'MergeThreshold', threshold);

bboxes = step(faceDetector, img);
DetectImg = insertObjectAnnotation(img, 'rectangle', bboxes, 'Face');

imshow(DetectImg);

imwrite(DetectImg, output);
