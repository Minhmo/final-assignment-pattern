function processed = dig_2_data(a)

    classSize = size(a, 1) / 10;
    %labels = zeros(1,classSize*10);
    labels = {{}};
    k = 1;
    for i = 0:9
        for j = 1:classSize 
            index = classSize*i+j;
            nist = a(index);
            im = data2im(nist);
            im = cleanUp(im);
            clean(index,:) = im(:);
            tmp = HOG(im);
            processed(index,:) = tmp(:);
            
            labels{index} = strcat('digit_',num2str(i));
        end
    end
    clean = dataset(clean,labels');
    processed = dataset(processed,labels');
    processed(1)
    %A = pca(clean,0.99);
    %B = pca(processed,0.99);
end

