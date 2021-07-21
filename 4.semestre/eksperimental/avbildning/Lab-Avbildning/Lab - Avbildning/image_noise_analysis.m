
function [m,v]=image_noise_analysis(filepath,filename)
% [m,v]=image_noise_analysis(filepath,filename)
%
% Stephane Nicolas 18/04/2017

% size cropped image
ny=100;
nx=100;

fname=fullfile(filepath,filename);
im1=imread(fname);
info=imfinfo(fname);

% plot image
figure(1)
clf
imagesc(im1)
colorbar
title(filename)
axis equal
hold on
Ny=size(im1,1);
Nx=size(im1,2);
cc=[round(Nx/2) round(Ny/2)];
plot(cc(1),cc(2),'r+')
rectangle('position',[cc(1)-round(nx/2),cc(2)-round(ny/2),nx,ny]);

% extract green channel
im2=im1(:,:,2);
% crop image
im2=im2(cc(2)-round(ny/2):cc(2)+round(ny/2)-1,cc(1)-round(nx/2):cc(1)+round(nx/2)-1);
%mean im2
m=mean(im2(:));
% convert im2 from uint8 to int
im2=double(im2);
figure(2)
imagesc(im2)
colorbar
title(['Cropped - green channel - mean = ' num2str(m)])
axis equal

% neighbour difference
im3=im2(:,1:end-1)-im2(:,2:end);
%variance im3
v=var(im3(:));
figure(3)
imagesc(im3)
colorbar
title(['Cropped  - green channel - Horizontal neighbor difference - var = ' num2str(v)])
axis equal


