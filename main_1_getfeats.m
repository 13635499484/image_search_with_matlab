clc
clear all;
close all;

maindirpath="ImageDataSets";
formats = ["*.jpg","*.png","*.jpeg"];
img_list = GetImageList(maindirpath,formats);
num = length(img_list);
features=[];
parfor j = 1 : num
    if mod(j,50)==0
        disp(strcat(num2str(j),"//",num2str(num)))
    end
    f_imgs=split(fullfile(img_list(j).folder,img_list(j).name),'.');
    path = f_imgs{1};
    features=[features;GenFeatures(path)];
end
save(fullfile(maindirpath,"feature.mat"),"features");
