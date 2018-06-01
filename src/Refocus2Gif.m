

function res=Refocus2Gif(name,FilePath,dt)

cd(FilePath);
cut=40;
for i=cut:257
    
    pathimg=['IM_Refoc_alpha_',num2str(i),'.jpg'];    
	img=imread(pathimg);
	imshow(img,'border','tight','initialmagnification','fit');
	axis normal
	truesize
% 	text(10,20,sprintf('i : %d',i),'fontsize',20,'color','y');
	
	%======Creat GIF =======
	n=i-cut+1;
	frame(n)=getframe(gcf); % get the frame
	image=frame(n).cdata;
	[image,map]     =  rgb2ind(image,256);  
	if n==1
		 imwrite(image,map,name,'gif');
	else
		 imwrite(image,map,name,'gif','WriteMode','append','DelayTime',dt);
	end
	%------------------------------------
	
   
end
cd('..');
        
 