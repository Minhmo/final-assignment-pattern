global INIT;
global a;
[cleanLargeOriented,processedLargeOriented]=loadData(1,1)
[cleanSmallOriented,processedSmallOriented]=loadData(10,1);


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

% %Try data on Support Vector Machine
% crossval(processed,svc([],'p'),10)
% crossval(processed,(proxm(gendat(processed,300),'p')*vpc),10);

%NOTE: try these svm's nusvc rbsvc 
% WHAT IS FISHER MAPPING ETC???? fisherm  nlfisherm 
% COMBINE CLASSIFIERS??? 

%K = proxm(processed,'distance')

%mapped = processed*kernelm(processed,proxm([],'p'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'h'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'e'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'r'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'s'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'d'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'m'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'c'))
%crossval(mapped,vpc([],1000),40);
%mapped = processed*kernelm(processed,proxm([],'cosine'))
%crossval(mapped,vpc([],1000),40);

%mapped = processed*kernelm(processed,proxm([],'e'))
%test_classifiers(mapped);

%crossval(processed,svc([],'p'),10)

