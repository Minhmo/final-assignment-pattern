function [ raw , hog ] = loadData(interval,dim)
a = prnist([0:9],[1:interval:1000]);

raw = [];
hog = [];

period = floor(1000/interval);
labels = zeros(1, period*10);



for i = 0:9
    for j = 0:(period-1)
        index = period * i + j;
        nist = a(index + 1);
        im = data2im(nist);
        imr = imresize(im, dim);
        raw(index + 1, :) = imr(:);
        tmp = HOG(imr);
        hog(index+1,:) = tmp(:);
        labels(index + 1) = i;
    end
end
raw = dataset(raw, labels');
hog = dataset(hog, labels');
end

