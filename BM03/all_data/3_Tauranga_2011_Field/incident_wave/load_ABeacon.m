clear all
clf

load port_data.txt

% ABeacon  176.17781 -37.60287
tAB=port_data(:,1);
zAB(:,1)=port_data(:,2);  %tsunami only
zAB(:,2)=port_data(:,3);  % total
zAB(:,3)=zAB(:,2)-zAB(:,1);   % tide only


for iplot=1:3
    
    subplot(3,1,iplot)
    
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
        str='Extracted Tsunami Signal @';
    elseif iplot==2
        str='Total Recorded Signal @';
    else
        str='Extracted Tidal Signal @';
    end
    
    plot(tAB,zAB(:,iplot))
    axis([xs xe ys ye])
    title([str ' ABeacon '])
    ylabel('z (m)')
    
    
    
end

xlabel('Time post-EQ (hrs)')
print -djpeg100 ABeacon.jpg






