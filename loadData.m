function [cleanO,processedO] = loadData(interval,rmo)

    global INIT;
    global a;
   
    if INIT ~= interval   
        a = prnist([0:9],[1:interval:1000]);
        INIT = interval;
    end

        period = floor(1000/interval);
        labels = zeros(1, period*10);
        
        for i = 0:9
            for j = 0:(period-1)
                index = period * i + j;
                nist = a(index + 1);
                
                im1 = data2im(nist);
                tmp = HOG2(im1);
                clean(index + 1, :) = tmp(:);
                
                im2 = cleanUp(im1);
                tmp = HOG(im2);
                processed(index+1,:) = tmp(:);
                
                labels(index + 1) = i;
            end
        end
        
        clean = dataset(clean,labels');
        processed = dataset(processed,labels');
     
        A = pca(clean,0.99)
        B = pca(processed,0.99)

        cleanO = clean*A;
        processedO = processed*B;
        
        %TODO: REMOVE OUTLIERS remoutl 
        if(rmo==1)
            cleanO = remoutl(cleanO)
            processedO = remoutl(processedO)
        end
end

