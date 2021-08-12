%CONTROLE DE VIBRAÇÕES - EAC 1016

%Exercicio 3 - Determine a frequência natural e o fator de amortecimento 
%de um sistema para as duas primeiras frequências de ressonância.

clear all; clc;

load('sinal'); %Carrega o arquivo .mat;

frequencia = f; %Carrega os valores de vetor de frequência;
amplitude = X; %Carrega os valores do vetor de amplitude;

plot(frequencia, amplitude, 'b') %Gera gráfico dos dados;
xlabel('Frequência (Hz)')
ylabel('Amplitude')

[val, idx] = max(amplitude); %Retorna o valor máximo e o índice desse 
                               %valor em amplitude;
amplitude_max1 = val;

%Como idx foi igual a 99, sei que esse é o valor para o primeiro pico, 
%pois os vetores possuem 1001 valores e três picos diferentes.
%agora, vou buscar o valor de frequência que é indexado em 99.

freq_natural1 = frequencia(idx); %Encontra o valor da frequência natural
                                    %que estava na posição idx.
                                    
%Agora vou usar um for para encontrar o segundo maior valor
for i = 1: 1:1001
    if amplitude(i) >  0.4 && amplitude(i) < amplitude_max1 %Pelo gráfico,
        %sei que o valor vai ser maior que 0.4 e menor que o máximo, então
        %faço essa dupla condição
            amplitude_max2 = amplitude(i); %Guarda o segundo maior valor;
            m = i; %Guarda a posição da segunda maior amplitude;
    end  
end

freq_natural2 = frequencia(m); %Encontra o valor da frequência natural
                                %que estava na posição m.
fprintf('As frequencias naturais sao %f Hz e %f Hz \n', freq_natural1, freq_natural2);

%Próximo passo é encontrar os pontos de meia potência
meia_pot1 = 0.707 * amplitude_max1; %Encontra o ponto para primeira ressonância;
meia_pot2 = 0.707 * amplitude_max2; %Encontra o ponto para segunda ressonância;

fprintf('Os pontos de meia potência são %f e %f  \n', meia_pot1, meia_pot2);

meia_pot1 = round(meia_pot1, 2); %Arredonda o valor encontrado;
meia_pot2 = round(meia_pot2, 2); %Arredonda o valor encontrado;

%Agora, preciso encontrar os valores de frequencia em que são mais próximos
%dos valores de amplitude. Como há a discretização, os numeros não são
%perfeitamente iguais. Vou fazer uma aproximação

freqs_meia_potencia = []; %Vetor para armazenar os indices;

for i = 1: 1: 1001
    igual_1 = abs(amplitude(i)- meia_pot1); %Calcula a diferença entre a amplitude 
                                %e a meia potência
    igual_2 = abs(amplitude(i)-meia_pot2);%Calcula a diferença entre a amplitude 
                                %e a meia potência
    if igual_1 < 0.009 %Compara a diferença a partir de um valor de tolerancia
                            %arbitrario que escolhi a partir dos dados,
                            %pois preciso de 2 valores de frequencia no
                            %minimo
        fprintf('A 1a frequencia de meia potencia 1 é %f Hz\n',frequencia(i));
    end 
    if igual_2 < 0.006 %Compara a diferença a partir de um valor de tolerancia
                            %arbitrario que escolhi a partir dos dados,
                            %pois preciso de 2 valores de frequencia no
                            %minimo
        fprintf('A 1a frequencia de meia potencia 2 é %f Hz\n',frequencia(i));
    end 
end