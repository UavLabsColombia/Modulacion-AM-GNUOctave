
# Escrito por Heberth Alexander Ardila
# heberthardila@gmail.com
# uavlabs.org
# El siguiente codigo describe el proceso de Modulacion de Amplitud
# que se realiza a una señal portadora en base a una moduladora

# tiempo en segundos
t = 0:1*10^-3:1;

# en Voltios pico
# portadora de 10mV
Vc = 1*10^-3;  
# mensaje o moduladora  de 6V
Vm = 6;

# en Herz
fc = 40;
fm= 2;

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
