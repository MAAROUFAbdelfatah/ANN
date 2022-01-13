function mpq = moments(F, p, q)
s = 0;
[L, C] = size(F);
for i=1 : L
    for j = 1 : C
        s = s + (i^p*j^q*F(i, j));
    end
    mpq =s;
end