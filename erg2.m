function erg2
clc;clear;

syms t w

x(t)=(1+cos(pi*t)).*(heaviside(t+2)-heaviside(t-4));
g(t)=(t.*exp(-t).*cos(3*t)).*heaviside(t);

Xc(w)= (exp(2*1i*w)-exp(-4*1i*w))/(1i*w) + (1/2)*(1i*exp(-4*1i*(pi+w))-1i*exp(2*1i*(pi+w)))/(pi+w) + (1/2)*(exp(4*1i*(pi-w))-exp(-2*1i*(pi-w)))/(1i*(pi-w));
Xt(w)= 1i*(1/2)*((cos(4*w)- cos(2*w)).*(1./(pi+w)-1./(pi-w))) + 1i*((cos(4*w)-cos(2*w))./w)+ (1/2).*((sin(4*w)+sin(2*w)).*(1./(pi+w)-1./(pi-w))) + (sin(4*w)+sin(2*w))./w;
G(w) = 1./(2*(1i*(w-3)+1).^2) + 1./(2*(1i*(w+3)+1).^2);

Xc=simplify(Xc);
Xt=simplify(Xt);
G=simplify(G);

figure(1)
subplot(221)
fplot(t,x,[-3 5]);grid on;
xlabel('t'), title('signal x');

subplot(222)
ezplot(abs(Xt(w)));
grid on;
xlabel('w'), title('Fourier Transform of signal x (trig form) - Xt(w)');

subplot(223)
fplot(t,g,[-1 10]);grid on;
xlabel('t'),title('signal g'); 

subplot(224)
ezplot(abs(G(w)));
grid on; 
xlabel('w'), title('Fourier Transform of signal g');

figure(2)
subplot(211)
fplot(t,x,[-3 5]);grid on;
xlabel('t'), title('signal x');

subplot(212)
ezplot(abs(Xc(w)));
grid on;
ylim([0 6.2]), xlabel('w'), title('Fourier Transform of signal x (complex form) - Xc(w)');

end