function [gridscalar,Xgrid,Ygrid]=uneven2grid(scalar,X,Y,xres,yres)

%%% This function trasnform the quantity scalar in uneven (aleatory)
%%% positions to the matrix gridscalar, which is the same variable but in
%%% regular (grid) positions. 
%%% Scalar a certain value (vector)
%%% X, x position of scalar (vector)
%%% Y, y positions of scalar (vector)
%%% xres, Number of division or resolution in the x direction
%%% yres, Number of division or resolution in the y direction
%%% The variables Scalar, X and Y  are vector of the same size
%%% xres and yres are numbers, i.er. size (1 x 1)
%%% Xghrid
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                
                xmin=min(X);
				ymin=min(Y);
				xmax=max(X);
				ymax=max(Y);
               
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                
                xv=linspace(xmin,xmax,xres);
                yv=linspace(ymin,ymax,yres);
                
                [Xgrid,Ygrid]=meshgrid(xv,yv);               

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                gridscalar=griddata(X,Y,scalar,Xgrid,Ygrid);
