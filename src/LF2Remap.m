function Remap_Construct=LF2Remap(LF,win_begin)

if exist('win_begin','var')
    win_begin=1;
end

LF=LF(:,:,:,:,1:3);
[UV_diameter,~,y_size,x_size,c]=size(LF);

win_end=UV_diameter-win_begin+1;     
step=UV_diameter-2*(win_begin-1);    % 窗口实际大小
Remap_Construct=zeros(y_size*step,x_size*step,3);

%% 裁剪窗口大小变成：（N-win_begin）*（N-win_begin）
% 若win_begin=1时，相当于取整个窗口


for i=win_begin:win_end
    for j=win_begin:win_end
       
        view=squeeze(LF(i,j,:,:,1:3));
        imshow(view);
        pause(eps);
        hold off;
        Remap_Construct((i-win_begin+1):step:x_size*step,...
                                     (j-win_begin+1):step:y_size*step,:)=view;
    end
end
imshow(mat2gray(Remap_Construct));



