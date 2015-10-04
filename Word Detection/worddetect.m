function [Idetect] = worddetect(I, conf)
results = ocr(I);
HighConfidenceIdx = results.WordConfidences > conf;
HighConfidenceWord = results.Words(HighConfidenceIdx);
HighConfidenceBBoxes = results.WordBoundingBoxes(HighConfidenceIdx, :);
Idetect = I;
for i = 1:size(HighConfidenceWord, 1)
word = HighConfidenceWord{i};
if size(word,2) == 0
    continue;
end
wordBBox = HighConfidenceBBoxes(i,:);
Idetect = insertObjectAnnotation(Idetect,'rectangle',wordBBox, word);
end
imshow(Idetect);
end