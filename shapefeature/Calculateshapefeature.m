function fea = Calculateshapefeature(maindirpath,formats)
%¼ÆËãĞÎ×´ÌØÕ÷
% maindirpatn="Í¼Æ¬¿â"£»
fea = [];
if nargin<2
    formats = ["*.jpg","*.png","*.jpeg"];
end
img_list = GetImageList(maindirpath,formats);

parfor j = 1 : length(img_list)
    %j = 2
    f_img = imread(strcat(img_list(j).folder,'\',img_list(j).name));
    [h] = HuSquare(f_img);
    fea = [fea;h];
end







