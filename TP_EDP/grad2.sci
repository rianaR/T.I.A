
// gradiant
function [g] = grad2 (im)
    
    // on definit une matice N,M full if 0
    N=size(im,1)
    M=size(im,2)
    g=zeros(,,2);
    g(:,1 :N-1,1)= im(:,2:N)-im(:,1:N-1);
    g(1:M-1,:,2)= im(2:M,:)-im(1:M-1,:);
endfunction

