function feats = GenFeatures(maindirpath)
%% 图片文件夹
    %计算纹理特征
    tic
    S_fea_textural = Calculatetexturalfeatures(maindirpath);
    %计算形状特征
    S_fea_shape = Calculateshapefeature(maindirpath);
    %计算颜色特征
    S_fea_color = Calculatecolorfeatures(maindirpath);
    S_fea = [S_fea_textural,S_fea_shape,S_fea_color];
    
    feats=real(S_fea);


    %保存数据
%     save(fullfile(maindirpath,"feature.mat"),"feats");
end

