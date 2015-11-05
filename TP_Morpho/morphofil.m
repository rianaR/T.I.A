function mtdt=morphofil(dep,x,y)
%--------------------------------------------------------------------------
% function mtdt=morphofil(dep,x,y)
%
% Max entre le Top hat de l'image name1 et son dual
%
% Entrees : dep   -> image de depart
%           x,y   -> pour definir l'element structurant plan (rectangle de
%                    dimension (2x+1)x(2y+1) centre en 0)
%
% Sortie : mtdt
%--------------------------------------------------------------------------

% --> COMPLETEZ LA FONCTION
ouv = double(Dilatation(Erosion(dep, x, y), x, y));

mtdt = double(dep) - ouv;
% -- Affichage
figure;
imagesc(mtdt); axis off; axis image; colormap gray;
title(['Max entre Top hat et son dual ES : (',num2str(x),',',num2str(y),')']);