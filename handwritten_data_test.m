function processed = handwritten_data_test()
    %load('handwritten_numbers.mat');
    
    % We doen nu uit png laden:
    png = imread('cleaned.png');
    im = mean(png, 3);
    out = segment_numbers(im, 1, 1, 1184/10, 1184/10, 10, 10);
    handwritten_numbers = out;
    
    labels = {{}};
    k = 1;
    for i = 0:9
        for j = 1:10 
            index = 10*i+j;
            im = handwritten_numbers{index};
            
            % Boolean conversion
            vv = size(im);
            %im = im < 180
            
            m = median(reshape(im,1,vv(1)*vv(2)))-30;
            im(1:vv(1),1:vv(2)) = im < m;
            im = double(im);
           
            im = cleanUp(im);
            clean(index,:) = im(:);

            tmp = HOG(im);
            processed(index,:) = tmp(:);
            
            % Hack, beter zou zijn om in segment_numbers rijen en kolommen
            % te verwisselen.
            labels{index} = strcat('digit_',num2str(j - 1));
        end
    end
    
    
    
    clean = dataset(clean,labels');
    processed = dataset(processed,labels');
    processed(1)
    
    [data,PCA]      = loadData(100);
    w             	= vpc(data*PCA);
    confmat(processed*PCA*w);
    
    [E,C] = testc(processed * PCA, w)
   
end

