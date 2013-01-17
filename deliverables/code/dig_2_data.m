function processed = dig_2_data(a)
    classSize = size(a, 1) / 10;
    labels = {{}};

    for i = 0:9
        for j = 1:classSize 
            index = classSize*i+j;
            nist = a(index);
            im = data2im(nist);
            im = cleanUp(im);
            tmp = HOG(im);
            processed(index,:) = tmp(:);
            
            labels{index} = strcat('digit_',num2str(i));
        end
    end

    processed = dataset(processed,labels');
end

