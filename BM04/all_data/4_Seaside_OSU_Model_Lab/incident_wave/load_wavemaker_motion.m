clear all
clf

load Wavegage.txt

time=Wavegage(:,1);
wm_disp=0.47*(Wavegage(:,2)-Wavegage(1,2));

subplot(2,1,1)
plot(time,wm_disp)
axis([0 40 -.1 2])
ylabel(' Wavemaker Displacement (m)')
xlabel(' Time (sec)')
title('Wavemaker Displacement Time Series - REAL DATA. Can use this to drive a moving wall BC')

load ts_5m.txt
subplot(2,1,2)
plot(ts_5m(:,1),ts_5m(:,2))
axis([0 40 -.02 .2])
ylabel(' Water Surface Elevation at X=5m (m)')
xlabel(' Time (sec)')
title('Incident-only Wave Time Series at X=5m - SIMULATED DATA. Can use this to drive a stationary input wave BC at X=5m')

print -djpeg inc_wave.jpg