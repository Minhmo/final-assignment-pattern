%%FEATURE EXTRACTION TO USE
filename    = 'dig_2_data';

% Train classifier
clean = prnist([0:9],[1:100]);
HOG = dig_2_data(clean);
PCA = pca(HOG,0.99);
w = vpc(HOG*PCA,1000);

% Test it
large_error_PCA = nist_eval(filename,PCA*w,100)
confmat(dig2data(res)*PCA*w);

