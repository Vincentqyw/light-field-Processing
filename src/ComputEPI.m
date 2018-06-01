function EPI_New=ComputEPI(filepath)
% filepath包含49个视角的图像！

filepath='all views\original';

filepath='all views\compensated';

list = dir(fullfile([filepath,'\*.','jpg']));

N = sqrt(size(list,1));

[R, C, CH] = size(imread([filepath,'\',list(1).name]));

LF_EPI=zeros(R,N*N,C,CH);
EPI_New=zeros(N,N,R,C,CH);%EPI(t,y,N,C,CH)

for i=1:N*N
    file = [filepath, '\', list(i).name];
    I_temp = imread(file);
    temp_{i}=double(I_temp);
end

temp_1=cell2mat(temp_);


% for k=1:R
%     
%     t1=reshape(temp_1(k,:,:),[C,N*N,CH]);
%     LF_EPI(k,:,:,:)=permute(t1,[2,1,3])/255;
%     imshow(squeeze(LF_EPI(k,:,:,:)));    
%     title(['EPI slice row=',num2str(k)]);
%     pause(0.01)
% end% all views

for m=1:N
    for k=1:R  %y
        t1=squeeze(temp_1(k,:,:));
        for j=1:N %t
            t2=t1((j-1)*C+1:(j*C),:);
            EPI_New(m,j,k,:,1)=t2(:,1)';
            EPI_New(m,j,k,:,2)=t2(:,2)';
            EPI_New(m,j,k,:,3)=t2(:,3)';
        end
    imshow(squeeze(EPI_New(m,:,k,:,:))/373);
    title(['EPI when t=',num2str(m),', y= ',num2str(k)]);
    
    pause(0.01)
    end
end

imshow(IM_Pinhole)
line([1 317],[100 100],'color','r','LineWidth',2);
line([1 317],[140 140],'color','b','LineWidth',2);
line([1 317],[200 200],'color','g','LineWidth',2);







