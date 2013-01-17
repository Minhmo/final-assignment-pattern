function [HOG,PCA] = loadData(classSize)
    
    clean = prnist([0:9],[1:classSize]);
    HOG = dig_2_data(clean);
    PCA = pca(HOG,0.99);
    


%    
%    a = prnist([0:9],[1:classSize]);
%    labels = zeros(1,classSize*10);
%
%    for i = 0:9
%        for j = 1:classSize
%            index = classSize*i+j;
%            nist = a(index);
%            im = data2im(nist);
%            im = cleanUp(im);
%            clean(index, :) = im(:);
%
%            tmp = HOG(im);
%            processed(index,:) = tmp(:);
%
%            labels(index) = num2str(i);
%        end
%    end
%
%    clean = dataset(clean,labels');
%    processed = dataset(processed,labels');
%
%    %A = pca(clean,0.99);
%    %B = pca(processed,0.99);
%
%    cleanO = clean;
%    processedO = processed;
end

