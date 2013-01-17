function out = cleanUp(im)
se = strel('disk',1);
im = imclose(im,se);
im = imerode(im,se);
im = imdilate(im,se);

im = correct_slant(im);

%im = im_box(im,5,1);
%moments = im_moments(im,'central');
%alpha = atan(2*moments(3)/(moments(1)-moments(2)));
%im = im_rotate(im,(0.5*pi-alpha));
%im = im_box(im,1,1);

level = graythresh(im);
im = im2bw(im,level);
im = imresize(im,[32,32]);
out = im;
end