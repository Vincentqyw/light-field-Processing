

function ZoomIm(im,pos)

% figure
% im=IM_Pinhole;pos=[44,65,67,76];

up_leftX=pos(1);
up_leftY=pos(2);
down_rightX=pos(3);
down_rightY=pos(4);

imshow(im);set(gcf,'color',[1 1 1]);
line([up_leftX, down_rightX]   ,[up_leftY   ,up_leftY],'linestyle','-','linewidth',3,'color','r');
line([up_leftX, up_leftX]      ,[up_leftY   ,down_rightY],'linestyle','-','linewidth',3,'color','r');
line([down_rightX, down_rightX],[up_leftY   ,down_rightY],'linestyle','-','linewidth',3,'color','r');
line([up_leftX, down_rightX]   ,[down_rightY,down_rightY],'linestyle','-','linewidth',3,'color','r');




h=figure;
% imshow(im)


small_im=im(up_leftY:down_rightY,up_leftX:down_rightX,:);
imagesc(small_im); 
axis equal
axis off
set(gcf,'color',[1 1 1]);
set(gca,'xtick',[],'ytick',[]);
% set(gca,'position',[0.1 0.1,0.8 0.8])

set(h,'Position',[500,200,800,500])

