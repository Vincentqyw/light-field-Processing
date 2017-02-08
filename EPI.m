% function EPI
clear all
clc
addpath('code');
addpath('remaps');
mkdir('result');
ext='.mat';
names={'Buddha Remap','horses Remap','Medieval Remap','Mona Remap','rx_watch Remap'};
all_bigimg=cell(1,length(names));
N=9;
for i=1:length(names)
    
    file_name=[names{i}];
    load([file_name,ext]);
    LF=Remap2LF(LF_Remap);
    bigimg=ViewLightField(LF,file_name);
    all_bigimg{i}=bigimg;
    
end

[vN,uN,h,w,ch]=size(LF);

for v=1:N % v
    for y=1:h  %y
        temp=squeeze(LF(v,:,y,:,:));
%         temp=squeeze(LF(:,v,:,y,:));
        imagesc(temp);set(gca,'xtick',[],'ytick',[]);
        title(['EPI when v=',num2str(v),', y= ',num2str(y)]);
        pause(0.01)
    end
end

y_=350;
v_=1;
imshow(squeeze(LF(1,1,:,:,:)));line([1 w],[y_ y_],'color','r','linewidth',5);
set(gcf,'color',[1 1 1]);axis equal

figure;
imagesc(squeeze(LF(v_,:,y_,:,:)));
set(gca,'position',[0.1 0.1,0.8 0.8])
set(gcf,'color',[1 1 1]);
set(gca,'xtick',[],'ytick',[]);
hold off




