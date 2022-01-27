function img_list=GetImageList(maindirpatn,formats)
    % maindirpatn="图片库"；
    if nargin<2
        formats = ["*.jpg","*.png","*.jpeg"];
    end

    subdirpath = fullfile(maindirpatn,formats(1));
    img_list = dir(subdirpath);      % 子文件夹下找后缀为图像的文件

    for i=2:length(formats)
        subdirpath = fullfile(maindirpatn,formats(i));
        img_list = [img_list;dir(subdirpath)];
    end
end



