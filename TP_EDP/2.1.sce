// 2.1.SCE

exec("grad2.sci");
exec("div2.sci");

im = [1,2;5,6]
dt= 0.01;


nbIterations = 3;

for i=1:nbIterations

    g=grad2(im)
    d=div2(g)
    im=im+dt*d
    im
end
