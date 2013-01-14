function processed = handwritten_data_test()
    load('handwritten_numbers.mat');
    
    labels = {{}};
    k = 1;
    for i = 0:9
        for j = 1:10 
            index = 10*i+j;
            im = handwritten_numbers{index};
            
            % Boolean conversion
            vv = size(im);
            %im = im < 180
            im(1:vv(1),1:vv(2)) = im < 180;
            im = double(im);
           
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
    
    
    [data,PCA]      = loadData(10);
    w             	= vpc(data*PCA);
    confmat(processed*PCA*w);
   
end

