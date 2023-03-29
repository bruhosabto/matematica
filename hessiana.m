% avaliando se pontos são pontos críticos ou não através da matriz hessiana


pkg load symbolic;

syms x y;

%recebendo a funçã, os pontos a e b do usuário
f = input("informe a função:");

a = input("informe o ponto a:");
b = input("informe o ponto b:");



%calculando as derivadas de primeira e segunda ordem

dfx = diff(f,x);
dfy = diff(f,y);

d2fx = diff(dfx,x);
d2fy = diff(dfy,y);

#calcualndo as derivadas mistas de segunda ordem

d2fxy = diff(dfx,y);
d2fyx = diff(dfy,x);

#montando a hessiana

#hessiana = [d2fx, d2fyx; d2fxy, d2fy];
hessiana = hessian(f);

#calculando o determinante
# a1* a4 - a2*a3 
detH = det(hessiana);


#aplicando os pontos no detH

detH_ab = subs(detH,[x,y],[a,b]);

if (detH_ab > 0 )
	
	critico = subs(d2fx,[x,y],[a,b]);
	
	if(critico > 0)
		printf("o ponto (%d,%d) é um mínimo local da função \n",a,b);
	elseif(critico < 0)
		printf("o ponto (%d,%d) é um máximo local da função \n",a,b);
		
	else
		printf("Nao podemos afirmar nada");
	endif
elseif (detH_ab < 0 )
	printf("o ponto é um ponto (%d,%d) de sela local da função \n",a,b);
else
	printf("Não podemos afirmar nada a respeito do ponto (%d,%d)\n",a,b);
endif
