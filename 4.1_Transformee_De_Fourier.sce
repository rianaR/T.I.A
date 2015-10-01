xdel(winsid());
//lena = double(imread("lena.bmp"));
lena = double(imread("images/lena.bmp"));


//4.1
intLena = int(lena);
ShowImage(intLena);
fftLena = fftshift(fft2(intLena));
set(gcf(),"color_map",jetcolormap(128));
grayplot(0:255,0:255,abs(lena)');
