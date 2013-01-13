function [cnames,error,deviation] = test_classifiers( dataset )

    % The classifiers that need to be tested
    %classifiers = {qdc,knnc([],1), bpxnc(2, 1000), svc, fisherc, ldc, klldc, lkc, lmnc, loglc, lssvc, nmc, nmsc, nusvc, perlc, polyc, qdc, rbnc, rssvc, parzenc};
    classifiers = {...
        knnc,...
        lkc, ...
        dtc, ...
        qdc, ...
        fisherc, ...
        ldc, ...
        klldc, ...
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
     
     names = {...
        'knnc',...
        'lkc', ...
        'dtc', ...
        'qdc', ...
        'fisherc', ...
        'ldc', ...
        'klldc', ...
        'lkc', ...
        'loglc', ...
        'naivebc', ...
        'nmc', ...
        'nmsc',  ...
        'perlc', ...
        'polyc', ...
        'qdc',...
        'vpc',...
        'udc',...
        'rsscc',...
        'pcldc',...
        'parzenc'};

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
    time =[];
    deviation=[];
    cnames = [];

    for classifier = classifiers
        %training = dataset(label ~= cv, :);
        %testing = dataset(label, :);
        %errors = testc(testing, training*classifiers);
        
        [e,d] = crossval(dataset, classifier, 20);
        %cnames(length(cnames) + 1) = classifier{length(cnames) + 1};
        
        tic; 
        error(length(error)+1)                = e;
        deviation(length(deviation) + 1,1)    = d{1}(1);
        deviation(length(deviation) + 1,2)    = d{1}(2);
        time(length(time)+1)                  = toc;
    end

    best = find(error == min(error));
    classifiers{best}
    error(best)
    deviation(best, :)
    
    scatter(error,time,75,'filled','r')
    
    for i = 1:20
        text(error(i)+0.015,time(i),names(i),'FontSize',50);
    end
    
    names
    error
    time
    %disp(classifiers{best});


end

