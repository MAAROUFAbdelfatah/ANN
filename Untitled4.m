clear;
clc;

clear;
clc;
A1 = imread('BD\Classe A\imageA_1.jpg');
A2 = imread('BD\Classe A\imageA_2.jpg');
A3 = imread('BD\Classe A\imageA_3.jpg');
B1 = imread('BD\Classe B\imageB_1.jpg');
B2 = imread('BD\Classe B\imageB_2.jpg');
B3 = imread('BD\Classe B\imageB_3.jpg');
C1 = imread('BD\Classe C\imageC_1.jpg');
C2 = imread('BD\Classe C\imageC_2.jpg');
C3 = imread('BD\Classe C\imageC_3.jpg');
% 
BRV = zeros(9, 7);
% 
A1 = im2bw(A1);
A2 = im2bw(A2);
A3 = im2bw(A3);
B1 = im2bw(B1);
B2 = im2bw(B2);
B3 = im2bw(B3);
C1 = im2bw(C1);
C2 = im2bw(C2);
C3 = im2bw(C3);
% 
A1 = inverser(A1);
A2 = inverser(A2);
A3 = inverser(A3);
B1 = inverser(B1);
B2 = inverser(B2);
B3 = inverser(B3);
C1 = inverser(C1);
C2 = inverser(C2);
C3 = inverser(C3);
% 
BRV(1, :)= momentHu(A1);
BRV(2, :)= momentHu(A2);
BRV(3, :)= momentHu(A3);
BRV(4, :)= momentHu(B1);
BRV(5, :)= momentHu(B2);
BRV(6, :)= momentHu(B3);
BRV(7, :)= momentHu(C1);
BRV(8, :)= momentHu(C2);
BRV(9, :)= momentHu(C3);
% 
test = imread('BD\Test\image2.jpg');

test = im2bw(test);

test = inverser(test);
% 
phiTest = momentHu(test);

Zs = zeros(9,3);
Zs(1, :)= [1, 0, 0];
Zs(2, :)= [1, 0, 0];
Zs(3, :)= [1, 0, 0];
Zs(4, :)= [0, 1, 0];
Zs(5, :)= [0, 1, 0];
Zs(6, :)= [0, 1, 0];
Zs(7, :)= [0, 0, 1];
Zs(8, :)= [0, 0, 1];
Zs(9, :)= [0, 0, 1];

Vji = rand(3, 7)
X0 = ones(1,7);
Y0 = ones(1,3);
Wkj = rand(3,3)
DpEk = zeros(3,3);
DpFj = zeros(3,7);
Et = zeros(1,3);
ni = 0.9;
for i = 1 : 1000
    for j = 1 : 9
        phi = BRV(j, :);
        s = Zs(j, :);
        Y = propagation(phi, Vji, X0);
        Z = propagation(Y, Wkj, Y0);
        [DpEk, Et] = Ek(Y, Z, s);
        [DpFj, Ft] = Fj(phi, Y, Et, Wkj);
        [Vji, X0] = new(DpFj, Vji, ni, X0, Ft);
        [Wkj, Y0] = new(DpEk, Wkj, ni, Y0, Et);
    end
end
    

Wkj
Vji

 Y = propagation(BRV(1,:), Vji, X0);
 Z = propagation(Y, Wkj, Y0)
 sum = Z(1)+Z(2)+Z(3);
 Z(1) = (Z(1))/sum
 Z(2) = (Z(2))/sum
 Z(3) = (Z(3))/sum
 Z = activation('softmax', [Z(1), Z(2), Z(3)])
 if(Z(1)> Z(2) && Z(1)>Z(3))
     display('Classe A');
 elseif(Z(2)> Z(1) && Z(2)>Z(3))
     display('Classe B');
 else
     display('Classe C');
 end