
    
function Feats = GetIMFeats(IM)
    
    %获取图像的特征
    
    f_img = rgb2gray(IM);
    [g1] = Gray_level_cooccurrence_matrix(f_img); %5
    [g2] = Gabor_transforms(f_img);%3
    [g3] = GrayGradinet(f_img);%15
    [g4] = GLDS(f_img);%4
    textFeats = [g1,g2,g3,g4];
    
    shapeFeats = HuSquare(IM);
    
    colorFeat = colorFeatures(IM);
    
    Feats = [textFeats,shapeFeats,colorFeat];
end