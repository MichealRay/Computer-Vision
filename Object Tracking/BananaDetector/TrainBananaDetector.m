
%load negative folder
negDir = fullfile('/Users','kevin', 'Documents', 'USC', 'Summer2015', 'CompVision', 'Object Tracking','MinionDetector', 'negSamples');

%Train the minion detector
trainCascadeObjectDetector('minionDetectorHOG.xml',MinionData,negDir,...
    'FalseAlarmRate',0.001,'NumCascadeStages',20,'FeatureType','HOG');

%Load the minion detector
detector = vision.CascadeObjectDetector('minionDetectorHOG.xml');

%See the result
for i = 1:size(MinionData,2)
    img = imread(MinionData(i).imageFilename);
    img = imresize(img,[150 NaN]);
    bbox = step(detector,img);
    detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'minion');
    figure(i);
    imshow(detectedImg);
end
