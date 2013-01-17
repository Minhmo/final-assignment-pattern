%%FEATURE EXTRACTION TO USE
filename    = 'dig_2_data';

%%EVALUATE SMALL DATASET CLASSIFIER WITHOUT PCA
[HOG,PCA]   = loadData(10);
w           = vpc(HOG,10);
small_error = nist_eval(filename,w,100)

%%EVALUATE LARGE DATASET CLASSIFIER WITHOUT PCA
[HOG,PCA]   = loadData(100);
w           = vpc(HOG,1000);
large_error = nist_eval(filename,w,100)

%%EVALUATE SMALL DATASET CLASSIFIER WITH PCA
[HOG,PCA]       = loadData(10);
w               = vpc(HOG*PCA,10);
small_error_PCA = nist_eval(filename,PCA*w,100)

%%EVALUATE LARGE DATASET CLASSIFIER WITH PCA
[HOG,PCA]       = loadData(100);
w               = vpc(HOG*PCA,1000);
large_error_PCA = nist_eval(filename,PCA*w,100)


%%PERSONAL MANUAL HANDWRITTEN DATA TEST
[HOG,PCA]       = loadData(100);
w               = vpc(HOG*PCA,1000);
confmat(dig2data(res)*PCA*w);

