function ero=Erosion(im,x,y)
%--------------------------------------
% Entrees : im   -> image initiale
%           x, y -> parametres de l'element structurant
% Sortie :  ero  -> resultat de l'erosion
%--------------------------------------

% --> COMPLETEZ LA FONCTION
    [lines, columns] = size(im);
    ero = zeros(size(im));
    for l=1:lines
        for c=1:columns
            rect = im(max(1,l-y):min(lines, l+y),max(1,c-x):min(columns,c+x)); 
            ero(l,c) = min(rect(:));
        end
    end
end

