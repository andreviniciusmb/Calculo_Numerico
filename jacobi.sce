// Método iterativo, está menos sujeito ao acúmulo de erros de arredondamento.

function [x0]=Jacobi(a,b,x0)
    n = size(a,1)
    parar=1
    for it = 1:5
       for i = 1:n
        soma = 0
        for j = 1:n
            if j ~= i
                soma = soma + a(i,j)*x0(j)
            end
         end
         x(i) =  (1/a(i,i))*(b(i) - soma)
     end
     if (abs(norm(x) - norm(x0))< 0.001)
        parar = 0; 
    else
        X=x;
    end
    end
endfunction

a = [173 128 255;216 128 192;230 128 203]
b = [64;224;208]
x0 = [0;0;0]
y = linsolve(a,b)
disp(y)
x = Jacobi(a,b,x0)
disp(x)

