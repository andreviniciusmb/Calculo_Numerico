a = [173 128 255;216 128 192;230 128 203]
d = [a(1,1)/255 a(2,1)/255 a(3,1)/255;a(1,2)/255 a(2,2)/255 a(3,2)/255;a(1,3)/255 a(2,3)/255 a(3,3)/255]'
b = [64;224;208]
n = size(a,1) //Num de linhas
c = size(a,2) //Num de colunas

//Eliminação de Gauss sem pivotamento
for k = 1:n-1
    for i = k+1:n
        m = a(i,k)/a(k,k)
        for j = k:n
            a(i,j) = a(i,j) - m*a(k,j)
        end
        b(i) = b(i) - m*b(k)
    end
end

x(n) = b(n)/a(n,c)
for i = (n-1):-1:1  //Substituicao retroativa
    soma = 0
    for j = (i+1):c
        soma = soma + a(i,j)*x(j)
    end
    x(i) = (b(i)-soma)/a(i,i)
end

s = [x(1);x(2);x(3)]
disp("Sem pivo:")
disp(s)

