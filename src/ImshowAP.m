function ImshowAP(pos,LF)
close all;

x_=pos(2);
y_=pos(1);

figure;
img=squeeze(LF(5,5,:,:,:));
imshow(img,'border','tight','initialmagnification','fit');
hold on;plot(pos(1),pos(2),'r.','Markersize',20);
axis normal;
truesize;


h=figure ;
small_im=(squeeze(LF(:,:,x_,y_,:)));
imagesc(small_im); 
axis equal
axis off
set(gcf,'color',[1 1 1]);
set(gca,'xtick',[],'ytick',[]);
set(0,'DefaultFigureMenu','figure');
set(h,'Position',[500,200,800,500])
