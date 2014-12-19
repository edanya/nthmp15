clf
clear all
warning('off')


% caseind='A' for data recorded at x=13m, y=0m, z=0.75 m (3 cm below still water level) 
% caseind='B' for data recorded at x=21m, y=0m, z=0.77 m (1 cm below still water level))
% caseind='C' for data recorded at x=21m, y=-5m, z=0.77 m (1 cm below still water level) 
caseind='A';

clf

for j=1:6
    if j==1
        exp_data=['U_Velocity_Average' caseind ];
    elseif j==2
        exp_data=['V_Velocity_Average' caseind ];
    elseif j==3
        exp_data=['W_Velocity_Average' caseind ];
    elseif j==4
        exp_data=['U_RMS' caseind ];
    elseif j==5
        exp_data=['V_RMS' caseind ];
    elseif j==6
        exp_data=['W_RMS' caseind ];
    end
    
    eval(['load ' exp_data '.txt'])
    eval(['veldata=' exp_data ';'])
    
    subplot(6,1,j)
    plot(veldata(:,1),veldata(:,2))
    if j==1
        axis([0 30 -1 2.5])
        ylabel('Mean U component (m/s)')
    elseif j==2
        ylabel('Mean V component (m/s)')
        axis([0 30 -.5 .5])
    elseif j==3
        ylabel('Mean W component (m/s)')
        axis([0 30 -.5 .5])
    elseif j==4
        axis([0 30 0 .35])
        ylabel('RMS u\prime component (m/s)')
    elseif j==5
        ylabel('RMS v\prime component (m/s)')
        axis([0 30 0 .35])
    elseif j==6
        ylabel('RMS w\prime component (m/s)')
        axis([0 30 0 .35])
    end
    
end
xlabel('Time (sec)')
print -djpeg100 ADV_data.jpg



