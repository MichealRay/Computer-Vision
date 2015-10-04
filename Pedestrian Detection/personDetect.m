function [output_img] = personDetect(img, threshold);
detector = vision.PeopleDetector('ClassificationThreshold', threshold);
[bboxes, score] = step(detector, img);
output_img = insertObjectAnnotation(img, 'rectangle', bboxes, 'Person');
end