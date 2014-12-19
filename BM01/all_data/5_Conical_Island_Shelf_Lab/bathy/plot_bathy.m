%  This file opens the LIDAR survey from Oregon State University Tsunami
%  Wave Basin done in July 2008.
%  Line 76 plots the final bathy/topo data
clear all
close all
clf

Path=[cd '\'];
%Path=strcat('C:\OSU_Tsunamos2_Summer2008\LIDAR Survey\');

file_07172008_5cm=strcat('TWB 071708_5CM_XYZ_METERS.txt');

bb=dir([Path file_07172008_5cm]);
bdev=bb.name;
survey_5cm=load([Path '\' bdev]);

j=0;
survey_5cm_points_tmp=0.*survey_5cm;
for i=1:length(survey_5cm)
    if survey_5cm(i,1)<10.2
        j=j+1;
        survey_5cm_points_tmp(j,:)=survey_5cm(i,:);
    end
end

survey_5cm_points=survey_5cm_points_tmp(1:j,:);

zero_offset_5cm=mean(survey_5cm_points(:,3));

zero_survey_5cm(:,1)=survey_5cm(:,1);
zero_survey_5cm(:,2)=survey_5cm(:,2);
zero_survey_5cm(:,3)=survey_5cm(:,3)-zero_offset_5cm;


xres=1000; yres=1000;
[zero_survey_5cm_gridscalar,zero_survey_5cm_Ygrid,zero_survey_5cm_Xgrid]=uneven2grid(zero_survey_5cm(:,3),zero_survey_5cm(:,2),zero_survey_5cm(:,1),yres,xres);

x=zero_survey_5cm_Xgrid(:,1)';
y=zero_survey_5cm_Ygrid(1,:);
z=zero_survey_5cm_gridscalar';

% add shoal
ny=length(y);
nx=length(x);
dx=x(2)-x(1);
dy=y(2)-y(1);

yc=0;  %centerline coordinate
ys=yc;
xs=17;  %15.5
rs=3;
hs=.45;

x_ind=find(x>xs,1);
y_ind=find(y>ys,1);
rx_ind=round(rs/dx);
ry_ind=round(rs/dy);

h_shoal=zeros(nx,ny);
for i=x_ind-rx_ind:x_ind+rx_ind
   for j=y_ind-ry_ind:y_ind+ry_ind
      r_loc=sqrt( (x(i)-xs)^2 + (y(j)-ys)^2);
      if r_loc<rs
         h_shoal(i,j)=hs*(1-r_loc/rs);
      end
   end
end

z=z+h_shoal';

pcolor(x,y,z)  % the bathymetry data! subtract 0.78 to adjust datum to still water level.
shading interp
text(0,0,1,['WAVEMAKER'],'VerticalAlignment','cap','HorizontalAlignment','center','Rotation',90,'FontSize',18,'Color','w')
zlabel({'Vertical Elevation (m)'})
ylabel({'Longshore Location (m) [Centerline @ Y=0m]'})
xlabel('Cross-shore Location from Wavemaker (m) [SWL @ X=25.75m]')
grid on
colormap(jet)
colorbar
axis equal
axis tight
view(0,90)

print -djpeg100 bathy.jpg 

