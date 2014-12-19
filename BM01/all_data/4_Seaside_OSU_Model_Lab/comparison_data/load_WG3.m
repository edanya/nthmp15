clear all
clf

load Wavegage.txt

time=Wavegage(:,1);
WG3=Wavegage(:,6);

plot(time,WG3)
axis([0 40 -.02 .3])
ylabel(' Water Surface Elevation (m)')
xlabel(' Time (sec)')
title('Measured Data @ X=18.618m, Y=0m ')

print -djpeg WG3.jpg