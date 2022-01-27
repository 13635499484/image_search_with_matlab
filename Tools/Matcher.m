function [val,idx,IM]=Matcher(img_path,features)

    IM  = imread(img_path);
    feats = KmeansSegmentsFeats(IM);

    %% 特征空间归一化
    all_feats = [feats;features];
    feats_ma = max(all_feats,[],1);
    feats_mi = min(all_feats,[],1);

    feats_mis=repmat(feats_mi,size(all_feats,1),1);
    feats_mas=repmat(feats_ma,size(all_feats,1),1);
    all_feats = (all_feats-feats_mis)./(feats_mas-feats_mis+0.000001);

    %% 匹配距离
    dist = pdist2(all_feats(1:size(feats,1),:),all_feats(size(feats,1)+1:end,:),'Euclidean');
    dist = min(dist);
    dist = reshape(dist,[size(feats,1),size(features,1)/size(feats,1)]);
    dist = min(dist);
    max_dist = max(dist);
    dist = dist/max_dist;
    [val,idx]=sort(dist);

    
end