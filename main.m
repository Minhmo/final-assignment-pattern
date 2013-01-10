shit_initialized = exist('shit_initialized');
if shit_initialized == 0
    %addpath I:
    %prstartup

    a = prnist([0:9],[1:40:1000]);
    show(a);
    shit_initialized = true;
end

%array(row, column) so I don' t forget

data = [];
labels = zeros(1, 250); %zeros(10, 25);

% Create dataset from images
for i = 0:9
    for j = 0:24
        index = 25 * i + j;
        nist = a(index + 1);
        im = data2im(nist);
        imr = imresize(im, [16, 16]);
        data(index + 1, :) = imr(:);
        labels(index + 1) = i;
    end
end

toTrain = dataset(data, labels');
crossval(toTrain, nmc);

%nmc(toTrain);

% TODO hog
