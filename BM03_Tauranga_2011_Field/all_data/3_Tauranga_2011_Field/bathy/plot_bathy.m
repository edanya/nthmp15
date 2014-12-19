clear all
clf

% This script will load the Tauranga Bay bathy data, generate coordinates in
% cartesian coordinates, and rotate the grid such that the domain is
% rectangular with axis aligned with x and y. If you want to load the data
% in true (lat,long) coordinates, take a look at the file
% TAU_Whole_Harbour_10_m_srf6.txt


% % work below commented out - skip to loading the generated data.  Uncomment
% % to re-generate (takes about 10 minutes).
% 
% load TAU_Whole_Harbour_10_m_srf6_hmat.txt -ascii
% ht=flipud(TAU_Whole_Harbour_10_m_srf6_hmat);
%    
% [m,n]=size(ht);
% 
% dx=10;
% dy=10;
% 
% x=ht*0.;
% for i=1:n
%    x(:,i)=x(:,i)+(i-1)*dx;
% end
% 
% 
% y=ht*0.;
% for j=1:m
%    y(j,:)=y(j,:)+(j-1)*dy;
% end
% 
% 
% xo=x(1,round(n/2));
% yo=y(round(m/2),1);
% ang=49;
% 
% R= [cosd(ang),-sind(ang); sind(ang),cosd(ang)]; % rotation matrix
% 
% xr=x*0;
% yr=y*0;
% for j=1:m
%     for i=1:n  % rotate coordinates "ang"
%         xr(j,i)=x(j,i)*R(1,1)+y(j,i)*R(1,2);
%         yr(j,i)=x(j,i)*R(2,1)+y(j,i)*R(2,2);
%     end
% end
% 
% xc=reshape(xr,[m*n,1]);
% yc=reshape(yr,[m*n,1]);
% hc=reshape(ht,[m*n,1]);
% 
% disp('TriScatteredInterp')
% F = TriScatteredInterp(xc,yc,hc,'natural');
% 
% xn=[-2.2e4:dx:1.9e4];
% yn=[10000:dx:3.24e4];
% nx=length(xn);
% ny=length(yn);
% for i=1:nx
%     [i nx]
%     for j=1:ny
%         hm(j,i)=F(xn(i),yn(j));
%         if yn(j)<2.12e4 & isnan(hm(j,i))==1
%             hm(j,i)=-20;
%         end
%     end
% end
% 
% 
% for j=1:ny
%     if isnan(hm(j,nx))==1
%         for i=2:nx
%             if isnan(hm(j,i))==1
%                 hm(j,i)=hm(j,i-1);
%             end
%         end
%     end
%     if isnan(hm(j,1))==1
%         for i=nx:-1:1
%             if isnan(hm(j,i))==1
%                 hm(j,i)=hm(j,i+1);
%             end
%         end
%     end
% end
% save TAU_Whole_Harbour_10_m_srf6_hmat.mat

load TAU_Whole_Harbour_10_m_srf6_hmat.mat
x=xn-xn(1);
y=yn-yn(1);
z=-hm;

pcolor(x,y,z)
shading interp
xlabel({'Longshore Coordinate (m)'})
ylabel('Cross-shore Coordinate (m)')
colormap(jet)
colorbar
axis equal
axis tight
caxis([-25 35])
view(0,90)

print -djpeg100 bathy.jpg 




