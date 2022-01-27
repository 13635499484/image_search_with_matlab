%% 用k均值颜色聚类分割图像。
function KmeansSeg(img_path, nColors)
    if nargin<2
        nColors = 6;
    end
    save_path = split(img_path,'.');

    save_path = save_path{1};
    
    if ~isfolder(save_path)
        mkdir(save_path);
    end

    he = imread(img_path);


    lab_he = rgb2lab(he); %转化为 L*a*b* 颜色空间
    % imshow(lab_he);

    % 将数据转换为数据类型 single，以便与 imsegkmeans 结合使用。使用 imsegkmeans 对对象进行聚类以分为多个簇。
    ab = lab_he(:,:,2:3);
    ab = im2single(ab);

    pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',nColors); %返回一个对应于簇的索引或标签。用像素的标签标注图像中的每个像素。
    figure(),imshow(pixel_labels,[]),title('聚类分割结果');

    % 用 pixel_labels按标签取出原图的对象
    nn = sqrt(nColors);
    nn = floor(nn);
    mm = ceil(nColors/nn);
    for i=1:nColors
        IM = double(pixel_labels==i);
        IM = imfill(IM,'holes'); % 孔洞填充
%         IM = imerode(IM,strel('disk',2));%腐蚀
%         IM = imdilate(IM,strel('disk',2));%膨胀
%         IM=bwareaopen(IM,5,8);
%         subplot(nn,mm,i),imshow(IM);%  %%显示最后结果图像
        resmat = GetBox(IM);
        segimg = he(resmat(1):resmat(3),resmat(2):resmat(4),:);
%         subplot(nn,mm,i),imshow(segimg);%  %%显示最后结果图像
        savepath = fullfile(save_path,strcat(num2str(i),"_sge.jpg"));
        if isempty(segimg)
            segimg = he;
        end
        imwrite(segimg,savepath);
    end
end