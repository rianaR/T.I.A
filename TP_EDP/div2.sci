
// divergence du gradiant
function [d] = div2 (g)
    [M,N,K] = size(g);
    div1=zeros(M,N);
    div2=zeros(M,N);
    
    div1(:,1) = g(:,1,1);
    div1(:,$) = -g(:,$-1,1);
    div1(:,2:$-1) = g(:,2:$-1,1) - g(:,1:$-2,1);
    
    div2(1,:) = g(1,:,2);
    div2($,:) = -g($-1,:,2);
    div2(2:$-1,:) = g(2:$-1,:,2) - g(1:$-2,:,2);
    
    d = div1 + div2;
 
endfunction
