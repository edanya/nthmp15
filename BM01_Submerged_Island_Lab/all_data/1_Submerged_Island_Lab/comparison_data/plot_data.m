clear all
clf

load SL_S1_U.dat;
te1 = SL_S1_U(:,1);
ue1 = SL_S1_U(:,2);

load SL_S1_V.dat;
te2 = SL_S1_V(:,1);
ve2 = SL_S1_V(:,2);

load SL_S2_U.dat;
te3 = SL_S2_U(:,1);
ue3 = SL_S2_U(:,2);

load SL_S2_V.dat;
te4 = SL_S2_V(:,1);
ve4 = SL_S2_V(:,2);

%=============================================================

figure(2)

subplot(4,1,1)
plot(te1,ue1,'o-',...     'LineWidth',0.8,...
    'MarkerEdgeColor','k',... 
    'MarkerSize',5)
hold on
xlabel('time(second)','fontsize',12)%,'fontweight','b')
ylabel('u_1(m/s)','fontsize',12)%,'fontweight','b')


subplot(4,1,2)
plot(te2,ve2,'o-',...     'LineWidth',0.8,...
    'MarkerEdgeColor','k',... 
    'MarkerSize',5)
%axis([0 40 -0.15 0.15])
xlabel('time(second)','fontsize',12)%,'fontweight','b')
ylabel('v_1(m/s)','fontsize',12)%,'fontweight','b')


subplot(4,1,3)
plot(te3,ue3,'o-',...    'LineWidth',0.8,...
    'MarkerEdgeColor','k',... 
    'MarkerSize',5)
%axis([0 40 0.0 0.25])
xlabel('time(second)','fontsize',12)%,'fontweight','b')
ylabel('u_2(m/s)','fontsize',12)%,'fontweight','b')

subplot(4,1,4)
plot(te4,ve4,'o-',...    'LineWidth',0.8,...
    'MarkerEdgeColor','k',... 
    'MarkerSize',5)
%axis([0 40 -0.1 0.1])
xlabel('time(second)','fontsize',12)%,'fontweight','b')
ylabel('v_2(m/s)','fontsize',12)%,'fontweight','b')

print -djpeg100 data.jpg

