load port_data.txt

% ABeacon 
tAB=port_data(:,1);
zAB(:,1)=port_data(:,2);  %tsunami only
zAB(:,2)=port_data(:,3);  % total
zAB(:,3)=zAB(:,2)-zAB(:,1);   % tide only


% Tug  
tTug=port_data(:,4);
zTug(:,1)=port_data(:,5);
zTug(:,2)=port_data(:,6);
zTug(:,3)=zTug(:,2)-zTug(:,1);


% Sulfur Point  
tSP=port_data(:,7);
zSP(:,1)=port_data(:,8);
zSP(:,2)=port_data(:,9);
zSP(:,3)=zSP(:,2)-zSP(:,1);


load tide_gauge.txt

% Taut  
tTT=tide_gauge(:,1);
zTT(:,1)=tide_gauge(:,2);
zTT(:,2)=tide_gauge(:,3);
zTT(:,3)=zTT(:,2)-zTT(:,1);

% Motu  
tMT=tide_gauge(:,4);
zMT(:,1)=tide_gauge(:,5);
zMT(:,2)=tide_gauge(:,6);
zMT(:,3)=zMT(:,2)-zMT(:,1);

load currents.txt

% ADCP 
tADCP=currents(:,1);
utsuADCP=currents(:,2);
vtsuADCP=currents(:,3);
speedtsuADCP=currents(:,4);
dirtsuADCP=currents(:,5);
uallADCP=currents(:,6);
vallADCP=currents(:,7);
speedallADCP=sqrt(uallADCP.^2+vallADCP.^2);
utideADCP=uallADCP-utsuADCP;
vtideADCP=vallADCP-vtsuADCP;
speedtideADCP=sqrt(utideADCP.^2+vtideADCP.^2);

for iplot=1:3
    figure(iplot)
    clf
    
    nsubplos=4;
    xs=0;
    xe=40;
    if iplot==1
        ys=-.5;
        ye=.5;
    else
        ys=-1;
        ye=1.2;
    end

    if iplot==1
        str='Extracted Tsunami Signal';
    elseif iplot==2
        str='Total Recorded Signal';
    else
        str='Extracted Tidal Signal';
    end
    
    subplot(nsubplos,1,1)
    plot(tAB,zAB(:,iplot))
    axis([xs xe ys ye])
    title([str ' ABeacon '])
    ylabel('z (m)')
    
    subplot(nsubplos,1,2)
    plot(tTug,zTug(:,iplot))
    axis([xs xe ys ye])
    title([str ' Tug Berth '])
    ylabel('z (m)')
    
    subplot(nsubplos,1,3)
    plot(tSP,zSP(:,iplot))
    axis([xs xe ys ye])
    title([str ' Sulfur Point '])
    ylabel('z (m)')
    
%     subplot(nsubplos,1,4)
%     plot(tTT,zTT(:,iplot))
%     axis([xs xe ys ye])
%     title([str ' Taut '])
%     ylabel('z (m)')
    
    subplot(nsubplos,1,4)
    plot(tMT,zMT(:,iplot))
    axis([xs xe ys ye])
    title([str ' Motu '])
    ylabel('z (m)')
    xlabel('Time post-EQ (hrs)')
    
    if iplot==1
        print -djpeg100 FSE_Tsunami_Only.jpg
    elseif iplot==2
        print -djpeg100 FSE_Tsunami_And_Tide.jpg
    elseif iplot==3
        print -djpeg100 FSE_Tide_Only.jpg
    end
        
end

figure(4)
clf

xs=0;
xe=40;
ys=-0;
ye=2.5;

subplot(3,1,1)
plot(tADCP,speedtideADCP)
axis([xs xe ys ye])
ylabel('speed (m/s)')
title('ADCP Data: (Filtered) Tide Signal Only')

subplot(3,1,2)
plot(tADCP,speedtsuADCP)
axis([xs xe ys ye])
ylabel('speed (m/s)')
title('ADCP Data: (Filtered) Tsunami Signal Only')

subplot(3,1,3)
plot(tADCP,speedallADCP)
axis([xs xe ys ye])
ylabel('speed (m/s)')
xlabel('Time post-EQ (hrs)')
title('ADCP Data: Measured (Complete) Signal')

print -djpeg100 Speed_Data.jpg






