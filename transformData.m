function output = transformData(a)

    % Hack like this
    interval = 10;
    rmo = 0;
    
        %period = floor(size(a, 1)/interval);
        period = floor(size(a, 1)/interval);
        labels = zeros(1, period*10);
        
        for i = 0:9
            for j = 0:(period-1)
                index = period * i + j;
                nist = a(index + 1);
                im = data2im(nist);
                im = cleanUp(im);
                
                clean(index + 1, :) = im(:);
                
                tmp = HOG(im);
                processed(index+1,:) = tmp(:);
                
                labels(index + 1) = i;
            end
        end
        
        clean = dataset(clean,labels');
        processed = dataset(processed,labels');
     
        A = pca(clean,0.99);
        B = pca(processed,0.99);

        cleanO = clean*A;
        processedO = processed*B;
        
        %TODO: REMOVE OUTLIERS remoutl
        if(rmo==1)
            cleanO = remoutl(cleanO)
            processedO = remoutl(processedO)
        end
    
        output = processed
end
