function mcpq = momentsCentraux(F, p, q)
[L, C] = size(F);
m00 = moments(F, 0, 0);
m01 = moments(F, 0, 1);
m10 = moments(F, 1, 0);

xBar = m10/m00; yBar = m01/m00;
s = 0;
for i = 1 : L
    for j = 1 : C
        s = s + (i - xBar)^p * (j - yBar)^q * F(i, j);
    end
end

mcpq = s;
end