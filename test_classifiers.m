function [cnames,error,deviation] = test_classifiers( dataset )

    % The classifiers that need to be tested
    %classifiers = {qdc,knnc([],1), bpxnc(2, 1000), svc, fisherc, ldc, klldc, lkc, lmnc, loglc, lssvc, nmc, nmsc, nusvc, perlc, polyc, qdc, rbnc, rssvc, parzenc};
    classifiers = {
        qdc, ...
        knnc, ... %automatically optimized
        svc, ...
        fisherc, ...
        ldc, ...
        klldc, ...
        lkc, ...
        loglc, ...
        naivebc, ...
        nmc, ...
        nmsc, ...
        nusvc, ...
        perlc, ...
        polyc, ...
        qdc, ...
        parzenc};

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

