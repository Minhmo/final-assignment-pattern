INIT = exist('INIT');
if INIT == 0
    [raw,hog]=loadData(10,[32,32]);
    INIT = 1;
end

crossval(raw,ldc,10);
crossval(hog,ldc,10);
crossval(hog,svc,5);
%crossval(hog, knnc([],3),10);

%%Linear Discriminant data analysis