// 2.1.SCE

exec("grad2.sci");
exec("div2.sci");

imOrigins = double(imread("Images/lena.bmp"));
im = double(imread("Images/lena.bmp"));

// moyenne nullle (pour le bruit à venir)
noise_mean = 0;

// écart-type 20
noise_sigma = 20;

// variance calculée à partir de l'écart-type
noise_var = noise_sigma^2;
noisyImg = im + noise_sigma * rand(im,"normal") + noise_mean;

dt=0.25;
nbIterations = 100;
result = noisyImg;
for i=1:nbIterations
    g=grad2(result);
    d=div2(g);
    result=result+dt*d;
end
result
imshow(result/255);
imwrite(result/255, "lena_EDPfilter.jpg");

imwrite((result-imOrigins)/255, "lena_EDPdiffOrig.jpg");

// écart-type filtre gaussien
sigma = sqrt(2 * nbIterations * dt);

gaussianFilter  = fspecial("gaussian", [7, 7], sigma);
// version "à la main"
filtered = imfilter(noisyImg, gaussianFilter);
imwrite(filtered/255, "lena_GaussianFilter.jpg");
