INIT = exist('INIT');
if INIT == 0
    [raw,hog,rawPCA,hogPCA]=loadData(10,[40,40]);
    INIT = 1;
end

%crossval(raw,ldc,10);
%crossval(rawPCA,ldc,10);
%crossval(hog,ldc,10);
crossval(hogPCA,vpc,40);
clas = vpc(hogPCA);
confmat(hogPCA*clas)
%crossval(hogPCA,klldc,10);

%test_classifiers(hog);
%test_classifiers(hogPCA);