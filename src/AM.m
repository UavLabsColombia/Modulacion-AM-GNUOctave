
# Escrito por Heberth Alexander Ardila
# heberthardila@gmail.com
# uavlabs.org
# El siguiente codigo describe el proceso de Modulacion de Amplitud
# que se realiza a una señal portadora en base a una moduladora

# en Voltios pico
# portadora de 10mV
Vc = 1*10^-3;  
disp("Voltaje de Portadora"), disp(Vc);
# mensaje o moduladora  de 6V
Vm = 1.5;
disp("Voltaje de Moduladora"), disp(Vm);


#Valores de Resistencia y COndensador para la Oscilacion del XR2206
disp("Valores de R1 y C1 para la oscilacion del Xr2206")
R = 10*10^3; 
disp(R);
C = 1*10^-9;
disp(C);
# en Herz
fc = 1/(R*C);
tp = 1/fc;
disp("Frec de portadora:"), disp(fc);
#disp("Periodo de portadora"), disp(fc);
fm= 3000;


# Liena de tiempo en segundos. para graficar
t = 0:tp/2048:tp*30;

# Representacion de la moduladora y portadora sobre el tiempo
# cada una con su frecuencia natural de oscilacion. 
Vmt = Vm*sin(2*pi*fm*t);
Vct = Vc*sin(2*pi*fc*t);

##Envolente o resultante de AM
Vamt = (Vc + Vm*sin(2*pi*fm*t)).*(sin(2*pi*fc*t));


##Transformada rapida sobre la envolvente. 
#N = 4096;
#fftam=abs(fft(Vamt,N));
#F = [0:N-1]/N;




## plots para las graficas. 
subplot(3,1,1);
plot(t,Vmt);
title ("moduladora de baja frecuencia (tono puro)");
xlabel ("t(s)");
ylabel ("Vm(t)");
subplot(3,1,2);
plot(t,Vct);
title ("portadora de alta frecuencia");
xlabel ("t(s)");
ylabel ("Vc(t)");
legend ("");

subplot(3,1,3);
plot(t,Vamt);
title ("Envolvente de AM");
xlabel ("t(s)");
ylabel ("Vam(t)");


#subplot(4,1,4);
#plot(t*1000,abs(fftam));
#plot(F,fftam)
#legend ("");
