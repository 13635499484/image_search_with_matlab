clc
clear all
close all

%% 载入检索库
maindirpath="图片库";
formats = ["*.jpg","*.png","*.jpeg"];
img_list = GetImageList(maindirpath,formats);
features_tmp = load(fullfile(maindirpath,"features.mat"));
features = features_tmp.features;

%% 检索
img_path = "图片库//10000.jpeg";
[val,idx,IM] = Matcher(img_path,features);

%% 显示图像

figure()
subplot(3,4,1),imshow(IM);
for i=1:11
    j = idx(i);
    img_path = fullfile(img_list(j).folder,img_list(j).name);
    img_tmp = imread(img_path);
    subplot(3,4,i+1),imshow(img_tmp),title(strcat('相似度',num2str(round((1-val(i))*1000)/10),'%'));
end