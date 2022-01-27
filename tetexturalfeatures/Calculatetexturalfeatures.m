function fea = Calculatetexturalfeatures(maindirpath,formats)
%¼ÆËãÎÆÀíÌØÕ÷
% maindirpatn="Í¼Æ¬¿â"£»
fea = [];
if nargin<2
    formats = ["*.jpg","*.png","*.jpeg"];
end
img_list = GetImageList(maindirpath,formats);

parfor j = 1 : length(img_list)
    %j = 2
%     j
    f_img = imread(strcat(img_list(j).folder,'\',img_list(j).name));
    f_img = rgb2gray(f_img);
    [g1] = Gray_level_cooccurrence_matrix(f_img); %5
    [g2] = Gabor_transforms(f_img);%3
    [g3] = GrayGradinet(f_img);%15
    [g4] = GLDS(f_img);%4
    hg = [g1,g2,g3,g4];
    fea = [fea;hg];
    hg = [];
end













