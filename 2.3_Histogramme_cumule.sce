xdel(winsid());
clown = double((imread("images/CLOWN_LUMI2.BMP")));

//Histogramme de l'image là où il y a des valeurs
[cf, ind] = histc(min(clown(:)):max(clown(:)), clown, normalization = %f);

//Calcul de l'histogramme cumulé, complété pour que les valeurs
//soient comprises entre 0 et 255
ComplementMoins = zeros(1:min(clown(:)));
ComplementPlus = ones(1:255-max(clown(:)));
HSum = [ComplementMoins,cumsum(cf/(512*512)),ComplementPlus];

//Egalisation de l'histogramme de l'image clown avec son histogramme cumulé
for num_rows = 1:512
        for num_cols = 1:512
            clownEtale(num_rows,num_cols) = 255*HSum(clown(num_rows,num_cols));
            //clownEtale(num_rows,num_cols) = 255*HSum(cf(ind(num_rows, num_cols)));
        end;
end;

//Affichage de l'image et son histogramme
imshow(clownEtale/255);
figure;histplot(255,clownEtale);
