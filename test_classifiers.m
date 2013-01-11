function [cnames,error,deviation] = test_classifiers( dataset )

    % The classifiers that need to be tested
    %classifiers = {qdc,knnc([],1), bpxnc(2, 1000), svc, fisherc, ldc, klldc, lkc, lmnc, loglc, lssvc, nmc, nmsc, nusvc, perlc, polyc, qdc, rbnc, rssvc, parzenc};
    classifiers = {...
        knnc,...
        knnc([],1),...
        knnc([],2),...
        knnc([],3),...
        knnc([],4),...
        knnc([],5),...
        knnc([],6),...
        knnc([],7),...
        knnc([],8),...
        knnc([],10),...
        knnc([],20),...
        knnc([],30),...
        knnc([],40),...
        knnc([],50),...
        knnc([],60),...
        knnc([],70),...
        knnc([],80),...
        knnc([],90),...
        knnc([],100),...
        lkc, ...
        dtc, ...
        qdc, ...
        fisherc, ...
        ldc, ...
        klldc, ...
        lkc, ...
        loglc, ...
        naivebc, ...
        nmc, ...
        nmsc,  ...
        perlc, ...
        polyc, ...
        qdc,...
        vpc,...
         udc,...
        rsscc,...
        pcldc,...
         parzenc};

%slower: mogc 
    
%%    bayesc
%%    bpxnc
%%    dcsc
%%    drbmc
%%    dtc
%%    fdc
%%    ffnc
%%    knnc
%%    ldc
%%    lkc
%%    lmnc
%%    loglc
%    lssvc
%    mdsc
%    meanc
%    medianc
%    minc
%    mlrc
%%    mogc
%    naivebcc
%    naivebc
%    nbayesc
%    neurc
%    *nmc
%    *nmsc
%    nusvc
%    parsc
%    *parzenc
%    parzendc
%    **pcldc
%    perc
%    *perlc
%    *polyc
%    prodc
%    *qdc
%    quadrc
%    rblibsvc
%    rbnc
%    rbsvc
%    regoptc
%    rnnc
%    roc
%    *rsscc
%    stumpc
%    subsc
%    svc
%    *udc
%    *vpc
 
    %classifiers = {qdc, knnc};

    % Assign each value to a group for 10 fold crossvalidation
    %cv = crossvalind('Kfold', length(dataset), 10);

    %for label=1:10;

    %results = zeros(length(classifiers),1)
    error=[];
    deviation=[];
    cnames = [];

    for classifier = classifiers
        %training = dataset(label ~= cv, :);
        %testing = dataset(label, :);
        %errors = testc(testing, training*classifiers);
        
        [e,d] = crossval(dataset, classifier, 10);
        %cnames(length(cnames) + 1) = classifier{length(cnames) + 1};

        disp(classifier)
        e
        
        error(length(error) + 1)              = e;
        deviation(length(deviation) + 1,1)    = d{1}(1);
        deviation(length(deviation) + 1,2)    = d{1}(2);
    end

    best = find(error == min(error));
    classifiers{best}
    error(best)
    deviation(best, :)
    %disp(classifiers{best});


end

