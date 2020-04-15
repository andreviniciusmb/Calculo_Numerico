// Determina uma função através dos pontos passados e busca o ponto desejado através de uma interpolação

function [delta] = Delta(x,y)
    n = length(x)
    delta(:,1) = y
    for j = 2:n
        for i = 1:n-j+1
            delta(i,j) = (delta(i,j-1) - delta(i+1,j-1))/(x(i) - x(i+j-1))
        end 
    end 
endfunction

function [p] = Newton(x,y,ponto)
//p -> resultado da interpolação
p = y(1)
n = length(x)
tabela = Delta(x,y)
for i = 2:n
    m = 1
    for j = 1:i-1
        m = m*(ponto-x(j))  
    end  
    p = p + tabela(1,i)*m
end
endfunction

function [p] = Gregory_Newton(x,y,ponto)
    //p -> resultado da interpolação
    //delta -> diferenças entre y+1 - y
    n = length(x)
    delta(:,1) = y
    for j = 1:n-1
        for i = n:-1:j+1
            delta(i) = delta(i)-delta(i-1)
        end
    end
    //Processo de Horner
    u = (ponto - x(1))/(x(2)-x(1))
    p = delta(n)
    for i = n-1:-1:1
        p = p*(u-i+1)/i + delta(i)
    end
endfunction

x = [110 120 130]
y = [2.041 2.079 2.114]   
ponto = input('Digite o ponto:')

sol_n = Newton(x,y,ponto)
disp(sol_n)

sol_gn = Gregory_Newton(x,y,ponto)
disp(sol_gn)
