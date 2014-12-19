clear all
clf

load Location_B1.txt
load Location_B4.txt
load Location_B6.txt
load Location_B9.txt

subplot(3,1,1)
plot(Location_B1(:,1),Location_B1(:,2),Location_B4(:,1),Location_B4(:,2),Location_B6(:,1),Location_B6(:,2),Location_B9(:,1),Location_B9(:,2))
legend('Location B1 (33.721, -0.588)','Location B4 (35.176, -0.406)','Location B6 (36.635, -0.229)','Location B9 (40.668, 0.269)')
axis([20 40 -.02 .3])
ylabel(' Flow Depth (m)')
xlabel(' Time (sec)')
title('Measured Flow Depth Data')


subplot(3,1,2)
plot(Location_B1(:,1),Location_B1(:,3),Location_B4(:,1),Location_B4(:,3),Location_B6(:,1),Location_B6(:,3),Location_B9(:,1),Location_B9(:,3))
legend('Location B1 (33.721, -0.588)','Location B4 (35.176, -0.406)','Location B6 (36.635, -0.229)','Location B9 (40.668, 0.269)')
axis([20 40 -.2 2.5])
ylabel('Cross-Shore Velocity (m/s)')
xlabel(' Time (sec)')
title('Measured Cross-Shore Velocity Data')


subplot(3,1,3)
plot(Location_B1(:,1),Location_B1(:,4),Location_B4(:,1),Location_B4(:,4),Location_B6(:,1),Location_B6(:,4),Location_B9(:,1),Location_B9(:,4))
legend('Location B1 (33.721, -0.588)','Location B4 (35.176, -0.406)','Location B6 (36.635, -0.229)','Location B9 (40.668, 0.269)')
axis([20 40 -.02 1])
ylabel('Cross-Shore Specific Momentum Flux (m/s)')
xlabel(' Time (sec)')
title('Measured Cross-Shore Momentum Flux Data')

print -djpeg B_locs.jpg