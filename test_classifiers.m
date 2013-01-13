function [cnames,error,deviation] = test_classifiers( dataset , minimum )

    % The classifiers that need to be tested
    %classifiers = {qdc,knnc([],1), bpxnc(2, 1000), svc, fisherc, ldc, klldc, lkc, lmnc, loglc, lssvc, nmc, nmsc, nusvc, perlc, polyc, qdc, rbnc, rssvc, parzenc};
    classifiers = {...
        knnc,...
        lkc, ...
        dtc, ...
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
        vpc([],10000),...
         udc,...
        rsscc,...
        pcldc,...
         parzenc};
     
     names = {...
        'knnc',...
        'lkc', ...
        'dtc', ...
        'fisherc', ...
        'ldc', ...
        'klldc', ...
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
 
    error=[];
    time =[];
    deviation=[];
    cnames = [];

    for classifier = classifiers      
        [e,d] = crossval(dataset, classifier, 20);
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
    
    fig = figure;
    scatter(error,time,75,'filled','b')
    
    for i = 1:18
        text(error(i)+0.0005,time(i),names(i),'FontSize',50);
    end
    
    line([minimum,minimum],[0,1],'color','r');
    
    axis([0.05 0.9 .000022 .00005])
    
    names
    error
    time
    %disp(classifiers{best});


end

