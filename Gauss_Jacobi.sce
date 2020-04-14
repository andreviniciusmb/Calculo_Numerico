// Versão simplificada do algoritmo de valores próprios de Jacobi

function [x] = Gauss_Jacobi(a,b,x0,tol,N)
    n = size(a,1)
    for iteracao = 1:N
        for k = 1:n-1
            for i = k+1:n
                m = a(i,k)/a(k,k)
                for j = k:n
                    a(i,j) = a(i,j) - m*a(k,j)
                end
                b(i) = b(i) - m*b(k)
            end
        end
    
        x(n) = b(n)/a(n,n)
        for i = (n-1):-1:1  //Substituicao retroativa
            soma = 0
            for j = (i+1):n
                if i ~= j
                    soma = soma + a(i,j)*x0(j)
                end
            end
           x(i) =  (1/a(i,i))*(b(i) - soma)
        end
        y = a*x
        if abs(y-b) < tol then
            disp('Num de iteracoes: ')
            disp(iteracao)
            break
        end
        x0 = x
    end
endfunction

function x = Convergencia(a)
    n = size(a,1)
    cont=0
    for i = 1:n
        soma = 0
        for j = 1:n
            soma = soma + abs(a(i,j))
        end
        m = soma-abs(a(i,i))
        if m <= abs(a(i,i)) then
            cont = cont+1
        end
    end
    if cont == n then
        x = 1
    else
        x = 0
    end
endfunction

a = [173 128 0;21 228 192;20 12 203]
b = [64;224;208]
x0 = [0;0;0]

c = Convergencia(a)
if c == 1 then
    x = Gauss_Jacobi(a,b,x0,0.001,10)
    disp('Solucao: ')
    disp(x)
else
    disp('A matriz precisa ser diagonal dominante!!!')
end



