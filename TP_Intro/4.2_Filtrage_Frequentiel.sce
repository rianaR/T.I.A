xdel(winsid());
function [imFiltree] = filtre(src, filt)
    //Zero-padding du filtre
    filtZeros = zeros(src);
    filtZeros(1:size(filt,1),1:size(filt,2))=filt;
    fftFiltre = (fft2(filtZeros));
    fftSrc = (fft2(double(src)));
    imFiltree = ifft(fftSrc .* fftFiltre);
    imFiltree = real(imFiltree);
endfunction

//lena = double(imread("lena.bmp"));
lena = imread("images/lena.bmp");
figure; ShowImage(lena, "Lena")
h = ones(5,5)/25;
[imFiltre] = filtre(lena,h);
figure; ShowImage(imFiltre, "Image lissée/floutée");
