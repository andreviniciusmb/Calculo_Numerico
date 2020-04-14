a = [255 0 255;255 255 165;255 139 255]
b = [255;20;147]
n = size(a,1) //Num de linhas
c = size(a,2) //Num de colunas

//Eliminação de Gauss com pivotamento
for k = 1:n-1
    pivo = a(k,k)
    linha_pivo = k
    for t = k+1:n
        if abs(a(t,k)) > abs(pivo) then
            pivo = a(t,k)
            linha_pivo = t
        end
    end  
    aux_a = a(linha_pivo,:)  
    a(linha_pivo,:) = a(k,:)
    a(k,:) = aux_a
    aux_b = b(linha_pivo)
    b(linha_pivo) = b(k)
    b(k) = aux_b
    
    for i = k+1:n
        m = a(i,k)/a(k,k)
        for j = k:n
            a(i,j) = a(i,j) - (m*a(k,j))
        end
        b(i) = b(i) - (m*b(k))
    end
end

x(n) = b(n)/a(n,n)
for i = (n-1):-1:1  //Substituicao retroativa
    soma = 0
    for j = (i+1):n
        soma = soma + a(i,j)*x(j)
    end
    x(i) = (b(i)-soma)/a(i,i)
end

disp('Solucao x:')
disp(x)
