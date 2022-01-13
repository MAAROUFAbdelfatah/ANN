function [R, e1] = Fj(X, Y, Ek, Wkj)
[Lw, Cw] = size(Wkj);
lenx = length(X);
lenEk = length(Ek); 
R = zeros(lenEk,lenx);


for k = 1 : Lw
    e = 0;
    for j =1 : Cw
        e = e + (Wkj(k,j)*Ek(k));
    end
    e1(k) = Y(k)*abs(1 - Y(k))*e;
    for i = 1: lenx
        R(k,i) = X(i)*e1(k);
    end
end
end