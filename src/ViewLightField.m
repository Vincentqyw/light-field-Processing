%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2018.06.01 Vincent qin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function fn_ViewLightField

% input : 5D light field image structure (t,s,y,x,ch), 
% single type pixel intensities.


function ViewLightField(LF)

fprintf('ViewLightField...');
save_gif = 1;
out_name = 'all_views';
dt=0.3;

ns = size(LF,1);
nt = size(LF,2);
h = size(LF,3);
w = size(LF,4);

% keyboard;

bigimg = zeros(h*nt,w*ns,3);
cnt=1;
for t=1:nt
	ts = (t-1)*h+1;
    te = t*h;
    for s=1:ns
        ss = (s-1)*w+1;
        se = s*w;    
        img = squeeze(LF(t,s,:,:,:));
        % bigimg(ts:te,ss:se,:) = img;
        bigimg(ts:te,ss:se,1) = img(:,:,1);
        bigimg(ts:te,ss:se,2) = img(:,:,2);
        bigimg(ts:te,ss:se,3) = img(:,:,3);        
             
        figure(1); imshow(img,'border','tight','initialmagnification','fit');     
        axis normal;
        truesize;
%         set(gcf,'pos',[727   298   338   338]);
        text(10,30,sprintf('u : %d, v : %d',s,t),'fontsize',20,'color','y');
        if save_gif==1
            n=cnt;
            frame(n)=getframe(gcf); % get the frame
            image=frame(n).cdata;
            [image,map]     =  rgb2ind(image,256);
            if n==1
    %              imwrite(image,map,outname,'gif');
                 imwrite(image,map,[out_name '.gif'],'gif','Loopcount',inf);
            else
                 imwrite(image,map,[out_name '.gif'],'WriteMode','append','DelayTime',0.2);
            end
        end
%         title(sprintf('u : %d, v : %d',s,t));
        pause(0.05);
        cnt = cnt + 1; 
    end
end

% bigimg = imresize(bigimg);
figure; imshow(bigimg);
imwrite(bigimg,'bigimg.jpg','jpg');
fprintf('View Light Field done.\n');
