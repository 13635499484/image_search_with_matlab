clc 
clear all;
close all;

maindirpath="图片库";
formats = ["*.jpg","*.png","*.jpeg"];
img_list = GetImageList(maindirpath,formats);
num = length(img_list);
parfor j = 1 : num
    if mod(j,50)==0
        disp(strcat(num2str(j),"//",num2str(num)))
    end
    f_img=fullfile(img_list(j).folder,img_list(j).name);
    KmeansSeg(f_img,6);
end
