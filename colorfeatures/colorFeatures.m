function colorFeats=colorFeatures(I)
    R=I(:,:,1);
    G=I(:,:,2);
    B=I(:,:,3);
    R=double(R);
    G=double(G);
    B=double(B);
    [m,n]=size(R);
    %一阶矩（均值）
    Rmean=mean2(R);
    Gmean=mean2(G);
    Bmean=mean2(B);
    %二阶矩（标准差）
    Rstd=std2(R);
    Gstd=std2(G);
    Bstd=std2(B);
    %三阶矩（偏差）
    sum=0.0;
    for i=1:m
        for j=1:n
            sum=sum+(R(i,j)-Rmean)^3;
        end
    end
    Rske=(sum/(m*n))^(1/3);
    sum=0.0;
    for i=1:m
        for j=1:n
            sum=sum+(G(i,j)-Gmean)^3;
        end
    end
    Gske=(sum/(m*n))^(1/3);
    sum=0.0;
    for i=1:m
        for j=1:n
            sum=sum+(B(i,j)-Bmean)^3;
        end
    end
    Bske=(sum/(m*n))^(1/3);
    colorFeats = [Rmean,Rstd,Rske,Gmean,Gstd,Gske,Bmean,Bstd,Bske];
end