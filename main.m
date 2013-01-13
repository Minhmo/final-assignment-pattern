global INIT;
global a;
[cleanLargeOriented,processedLargeOriented]=loadData(5,0)
[cleanSmallOriented,processedSmallOriented]=loadData(100,0);


%Unprocessed data set test
disp('PCLDC CLASSIFIER ON CLEAN DATASET:');
crossval(cleanLargeOriented,pcldc,40);
crossval(cleanSmallOriented,pcldc,40);
disp('VPC CLASSIFIER ON CLEAN DATASET:');
crossval(cleanLargeOriented,vpc,40);
crossval(cleanSmallOriented,vpc,40);

disp('PCLDC CLASSIFIER ON PROCESSED DATASET:');
crossval(processedLargeOriented,pcldc,40);
crossval(processedSmallOriented,pcldc,40);
disp('VPC CLASSIFIER ON PROCESSED DATASET:');
crossval(processedLargeOriented,vpc,40);
crossval(processedSmallOriented,vpc,40);


test_data_sets(processedSmallOriented,processedLargeOriented)


