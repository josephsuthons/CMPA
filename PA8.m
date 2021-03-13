clc
clear vars
hold on

spacing = (0.7 + 1.95)/199;
V = -1.95:spacing:0.7;
V = V';

Is = 0.01*10^-12;
Ib = 0.1*10^-12;
Vb = 1.3;
Gp = 0.1;

I = [Is*exp(1.2/0.025*V-1)+Gp*V-Ib*exp(-1.2/0.025*(V+Vb)-1)]
badI = I-0.2*rand(200,1).*I

% Task 1
figure (1)
title 'Diode Current and approximations'
plot (V,badI)
figure (2)
title 'logarithmic Diode current and approximations'
semilogy(V,abs(badI))

% Task 2
fourth = polyfit(V, badI, 4);
eighth = polyfit(V,badI,8);
figure (1)
plot (V,polyval(fourth,V))
plot (V,polyval(eighth,V))
figure (2)
hold on
semilogy (V,abs(polyval(fourth,V)))
semilogy (V,abs(polyval(eighth,V)))

% Task 3
% More parameters the crazier the fit, 
% 2 param looks fine but any more and not good
fo1 = fittype('A.*(exp(1.2*x/25e-3)-1) + 0.1*x - B*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fo2 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C.*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fo3 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C.*(exp(1.2*(-(x+D))/25e-3)-1)');
ff1 = fit(V,badI,fo1)
ff2 = fit(V,badI,fo2)
ff3 = fit(V,badI,fo3)

If1 = ff1(V);
If2 = ff2(V);
If3 = ff3(V);

figure (1)
plot (V,If1)
plot (V,If2)
plot (V,If3)

figure (2)
semilogy (V,abs(If1))
semilogy (V,abs(If2))
semilogy (V,abs(If3))






