function fea = Calculatecolorfeatures(maindirpath)
%计算纹理特征
% maindirpatn="图片库"；
fea = [];
if nargin<2
    formats = ["*.jpg","*.img_list","*.jpeg"];
end
img_list = GetImageList(maindirpath,formats);
for j = 1 : length(img_list)
    %j = 2
    I = imread(strcat(img_list(j).folder,'\',img_list(j).name));
    colorFeats=colorFeatures(I);
    fea = [fea;colorFeats];
    colorFeats = [];
end