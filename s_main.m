I1 = imread('img31.png');
I1gray = rgb2gray(I1);
I1gray = im2double(I1gray);
H = [0.5 0 0;0 0.5 0;0 0 1];
P1 = f_warp(I1gray,H);
P2 = f_warp(P1,H);
P3 = f_warp(P2,H);
Payramid = {I1gray};
 corner1 = f_getCorners(Payramid);
%   corner2 = [corner1(:,1).*(corner1(:,3)) corner1(:,2).*(corner1(:,3))]
   imshow(I1gray);hold on
  plot(corner1(:,2),corner1(:,1),'r*')