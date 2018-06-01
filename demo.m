addpath(genpath(pwd));


%% Step 1: load LF data
% if you do not have LF data, please download before.

% uncomment either of the following two lines.
% load 'data/buddha2_LF_data.mat'
% [LF,LF_Remap,IM_Pinhole]=hdf2LF('data/Buddha2.h5');

LF=mat2gray(LF);
ViewLightField(LF);


[vN,uN,h,w,ch]=size(LF);

%% Step 2: Horizontal EPI (fix v & y)

y_=490;
v_=4;

% EPI line in central-sub-view image
figure;
img=squeeze(LF(5,5,:,:,:));
imshow(img,'border','tight','initialmagnification','fit');
axis normal;
truesize;
line([1 w],[y_ y_],'color','r','linewidth',5);
set(gcf,'color',[1 1 1]);axis equal;
% saveas(gca,'buddha2_epi_line.jpg','jpg');

% draw EPI
figure;
imagesc(squeeze(LF(v_,:,y_,:,:)));
% set(gca,'position',[0.1 0.1,0.8 0.8])
set(gcf,'pos',[421,298,966,152])
set(gcf,'color',[1 1 1]);
set(gca,'xtick',[],'ytick',[]);
hold off

% saveas(gcf,'buddha2_epi.jpg');

%% Step 3: Vertical EPI (fix u & x)

x_=500;
u_=4;

% EPI line in central-sub-view image
figure;
img=squeeze(LF(5,5,:,:,:));
imshow(img,'border','tight','initialmagnification','fit');
axis normal
truesize
line([x_ x_],[h 1],'color','g','linewidth',5);
set(gcf,'color',[1 1 1]);axis equal

% draw EPI
figure;
imagesc(permute(squeeze(LF(:,u_,:,x_,:)),[2 1 3]));
% set(gca,'position',[0.1 0.1,0.8 0.8])
set(gcf,'pos',[582 -14 159 818])
set(gcf,'color',[1 1 1]);
set(gca,'xtick',[],'ytick',[]);
hold off

%saveas(gcf,'buddha2_epi.jpg');

%% Step 4: Show Angular Patches(AP) 

% pos is the coordinates in central view
% result image is the corresponding AP in light field.
pos=[477 500];
ImshowAP(pos,LF)

pos=[600 265];
ImshowAP(pos,LF)

pos=[458 55];
ImshowAP(pos,LF)



