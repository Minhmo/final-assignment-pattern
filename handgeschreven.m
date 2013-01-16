% im = imread('handgeschreven.tif');
% bin = im(:, :, 1) > 100;
% %huh = bwlabel(bin, 8);
% huh = bwlabeln(bin);
% show(huh, []);
% 
% binaryImage = bin;
% binaryImage = imfill(binaryImage, 'holes');
% 
% labeledImage = bwlabeln(bin, 8);     % Label each blob so we can make measurements of it
% coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % pseudo random color labels
% 
% subplot(3, 3, 4);
% imshow(labeledImage, []);
% title('Labeled Image, from bwlabel()'); 
% axis square;
% subplot(3, 3, 5); 
% imagesc(coloredLabels);
% axis square;
% caption = sprintf('Pseudo colored labels, from label2rgb().\nBlobs are numbered from top to bottom, then from left to right.');
% title(caption);

im = imread('handgeschreven.tif');
tresholded = im(:, :, 1) < 100;

tresholded = imclose(tresholded, [1 1 1; 1 1 1; 1 1 1;]);

huh = bwlabeln(tresholded, 8);

maxh = 0;
maxhc = 0;
for h = 1:100
    f = huh .* (huh==h);
    hc = sum(sum(f));
    if hc > maxhc
        maxhc = hc;
        maxh = h;
    end
    if (sum(sum(f)) > 200)
        disp(h)
        disp('gevonden')
        show(f); %show(data2im(f))
    end
end

show(huh .* (huh == h));

%show(huh);
data = im2double(tresholded);

%show(huh == 1)

% UGliEr tHAn JSavAsCRipT
images = {};
im0 = imread('handgeschreven0.tif');
im0 = im0(1, :, :) < 100;
im1 = imread('handgeschreven1.tif');
im1 = im1(1, :, :) < 100;
im2 = imread('handgeschreven2.tif');
im2 = im2(1, :, :) < 100;
im3 = imread('handgeschreven3.tif');
im3 = im3(1, :, :) < 100;
im4 = imread('handgeschreven4.tif');
im4 = im4(1, :, :) < 100;

dataset({size(im2double(im4(:, :, 1) < 100))}, 1);
%a = dataset(im2double({im0,im1,im2,im3,im4}),[0 1 2 3 4]');