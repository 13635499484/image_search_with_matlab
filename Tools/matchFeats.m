function matchFeats(feats,features)
    num0=size(feats,1);
    num1=size(features,1)
    
    matchsocre = zeros(num0*num1,1);
    
    for i=1:num0
        matchsocre(i:(i+num1-1))=pdist2(feats,features(1,:),'Euclidean');
        



end