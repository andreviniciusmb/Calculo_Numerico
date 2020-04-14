// Método iterativo para resolução de sistemas de equações lineares
// Precisa de um chute inicial

function x = Gauss_Seidel(a,b,x0,N,tol)
    n = size(a,1)
    x = zeros(n,1)
    sol = %F
    for iteracao = 1:N
        for i = 1:n
            soma=0
            for j = 1:i-1
                soma = soma + a(i,j)*x(j)
            end
            for j = i+1:n
                soma = soma + a(i,j)*x0(j)
            end
            x(i) = (b(i) - soma)/a(i,i)
        end
        if abs(x-x0) <= tol then
            disp('Num de iteracoes: ')
            disp(iteracao)
            sol = %T
            break
        end
        x0 = x
    end
    if sol == %F then
        disp('Num de iteracoes: ')
        disp(iteracao)
        disp('Nao achou uma solucao aceitavel!!!')
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
        disp(m)
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

a = [255 128 173;192 128 216;203 128 230]
b = [64;224;208]
x0 = [0.5; 0.5; 0.5]
s = Gauss_Seidel(a,b,x0,100,0.00001)
disp("Gauss-Seidel: ")
disp(s)
