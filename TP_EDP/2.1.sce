// 2.1.SCE

exec("grad2.sci");
exec("div2.sci");

imOrigins = double(imread("Images/lena.bmp"));
im = double(imread("Images/lena.bmp"));

dt=0.25;
nbIterations = 20;

for i=1:nbIterations

    g=grad2(im);
    d=div2(g);
    im=im+dt*d;
    im;
end

imshow(im/255);

imshow((im-imOrigins)/255);
