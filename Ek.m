function [R, e] = Ek(Y, Z, S)
   lenz = length(Z);
   leny = length(Y);
   R = zeros(lenz,leny);
   e = zeros(1, lenz);
    for i = 1 : lenz
        e(i) = Z(i)*(S(i) - Z(i))*(1-Z(i));
        for j =  1:leny
            R(i, j) = Y(j)*e(i);
        end
    end
end