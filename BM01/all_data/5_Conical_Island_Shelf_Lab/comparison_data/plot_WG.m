clf
clear all
warning('off')

clf

for j=1:9
    
    % j=1, X=7.5m, Y=0m
    % j=2, X=13.0m, Y=0m
    % j=3, X=21.0m, Y=0m
    % j=4, X=7.5m, Y=5.0m
    % j=5, X=13.0m, Y=5.0m
    % j=6, X=21.0m, Y=5.0m
    % j=7, X=25m, Y=0m
    % j=8, X=25m, Y=5.0m
    % j=9, X=25m, Y=10.0m
    
    exp_data=['WG' num2str(j)];
    eval(['load ' exp_data '.txt'])
    eval(['WGdata=' exp_data ';'])
    
    subplot(9,1,j)
    plot(WGdata(:,1),WGdata(:,2)/100)
    axis([0 20 -.1 .42])
    if j==1
        title('FSE @ X=7.5m, Y=0m')
    elseif j==2
        title('FSE @ X=13.0m, Y=0m')
    elseif j==3
        title('FSE @ X=21.0m, Y=0m')
    elseif j==4
        title('FSE @ X=7.5m, Y=5.0m')
    elseif j==5
        title('FSE @ X=13.0m, Y=5.0m')
    elseif j==6
        title('FSE @ X=21.0m, Y=5.0m')
    elseif j==7
        title('FSE @ X=25m, Y=0m')
    elseif j==8
        title('FSE @ X=25m, Y=5.0m')
    elseif j==9
        title('FSE @ X=25m, Y=10.0m')
    end
    ylabel('\eta (m)')
end
xlabel('Time (sec)')
print -djpeg100 WG_data.jpg
