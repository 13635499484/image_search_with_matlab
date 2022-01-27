%%Gabor计算特征值
function [ g ] = Gabor_transforms( f )
b1=class(f);
if b1==char('int16')
    f1=im2uint8(f);
else
     f1=f;
end
f1=double(f1);
[G1,gabout1] = gaborfilter(f1,2,4,16,pi/10);        %调用garborfilter()函数对图像做小波变换,采用参数pi/10
J1=fft2(gabout1);                             %对滤波后的图像做FFT变换，变换到频域 
A1=double(J1);
[m1,n1]=size(A1);
B1=A1;
C1=zeros(m1,n1);
for ii=1:m1-1
    for jj=1:n1-1
        B1(ii,jj)=A1(ii+1,jj+1);
        C1(ii,jj)=abs(round(A1(ii,jj)-B1(ii,jj)));
    end
end
h1=imhist(mat2gray(C1))/(m1*n1);                  %对矩阵C归一化处理后求其灰度直方图，得到归一化的直方图
mean1=0;con1=0;ent1=0;
for ii=1:256                                  %求图像的均值、对比度和熵
    mean1=mean1+(ii*h1(ii))/256;
    con1=con1+ii*ii*h1(ii);
    if(h1(ii)>0)
        ent1=ent1-h1(ii)*log2(h1(ii));
    end
end
g=[mean1 con1 ent1];
end

