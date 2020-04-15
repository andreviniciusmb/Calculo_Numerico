// O objetivo desse trabalho é criar uma função para estimar o preço de um carro Fiat Palio 1.0 através do ajuste linear múltiplo

ano = [2017;2017;2017;2017;2016;2016;2016;2016;2015;2015;2015;2015;2015;2014;2014;2014;2014;2013;2013;2013;2013;2012;2012;2012;2012;2011;2011;2011;2011;2010;2010;2010;2010;2009;2009;2009;2009;2008;2008;2008;2008]
km = [50000;26000;67000;78602;23100;28195;29247;34500;34002;41087;42871;46404;59445;16200;26000;39000;44216;33452;70000;79000;144407;44003;72449;85000;87898;14100;43125;71813;87566;62318;84793;121538;136977;15252;60000;97789;107423;65050;91000;161211;175000]
preco = [29900;31990;30990;26990;25900;24490;28500;22900;23990;27900;26900;27890;22980;25990;26800;27990;20990;23990;18990;25900;17990;25900;22900;16900;19900;24800;23900;15990;15990;13900;20900;17900;20900;16990;22900;12900;14900;14500;20900;14990;15990]

//Maximos, Minimos e Medias
ano_max = max(ano)
ano_med = sum(ano)/length(ano)
ano_min = min(ano)
km_max = max(km)
km_med = sum(km)/length(km)
km_min = min(km)
preco_max = max(preco)
preco_med = sum(preco)/length(preco)
preco_min = min(preco)

//Normalizando dados
ano_norm = abs(ano(:,1)-ano_med)/(ano_max-ano_min)
km_norm = abs(km(:,1)-km_med)/(km_max-km_min)
preco_norm = abs(preco(:,1)-preco_med)/(preco_max-preco_min)

// Fazendo o ajuste linear múltiplo e verificando a qualidade do ajuste
Z = [ones(ano) ano km]
a = (Z'*Z)\(Z'*preco) //3x1

st = sum((preco - mean(preco)).^2)
sr = sum((preco - Z*a).^2)

r2 = 1 - sr/st

disp('Qualide do ajuste: ')
disp(r2)
//Função preço encontrada

function p = Previsao_Preco(ano,km,a)
    p = a(3)*km + a(2)*ano + a(1)
endfunction

//Calculando o Erro Quadrado Médio
preco_prev = a(3)*(km(:,1))+a(2)*ano(:,1) + a(1)
erro = preco(:,1) - preco_prev(:,1) 

eqm = sum(erro.^2)/length(erro)
disp('Erro Quadrado Medio: ')
disp(eqm)

//Mostrando os precos que sao abusivos
j = 1
o = 1
ab = 1
//Relação de preços
for i = 1:41
   p = Previsao_Preco(ano(i),km(i),a)
   h(i) = abs(100*(preco(i) - p)/p)
end

justos = sum(h(:) < 10)
oportunidades = sum(h(:) < 20) - justos
abusivos = sum(h(:) > 20)

l = [ones(h)] * 10
plot([1:41],h','bo')
plot([1:41],l','r-')
title('Ágio de cada anúncio')
xlabel('Quantidade')
ylabel('Porcentagem')

//Depreciação do carro a cada 10.000km rodados
disp('Depreciacao (em reais) a cada 10.000km rodados: ')
disp(abs(a(3)*10000))

//Depreciação do carro a cada ano
disp('Depreciacao (em reais) a cada ano: ')
disp(a(2))





