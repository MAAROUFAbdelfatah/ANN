function [newWs, Snew] = new(Dp , Wold, ni, Sold, E)
[L, C] = size(Wold);
newWs = zeros(L,C);

    for k = 1 : L
       for j = 1 : C
            newWs(k, j) = Wold(k, j) + ni*Dp(k, j);  
       end
       Snew(k)= ni*E(k) +Sold(k);

    end
end