

function Allviews2Remap(filepath,LF_parameters,ext)

% 本函数将所有视角的图像拼接成原始Remap图像；
% 输入是包含所有视角的文件夹
% 例如：
% filepath='input_vincent\Mat';
% ext='mat';


addpath(filepath);
list               = dir(fullfile([filepath,'\*.',ext]))     ;
N                  = sqrt(size(list,1));
x_size             = LF_parameters.x_size                 ;
y_size             = LF_parameters.y_size                 ;
UV_diameter   = LF_parameters.UV_diameter      ;


% 重构之后的Remap图像
Remap_Construct=zeros(y_size*UV_diameter,x_size*UV_diameter,3);

for i=1:UV_diameter
    for j=1:UV_diameter
        
        n             = sub2ind([N,N],j,i);	
		filename  = [filepath, '\', list(n).name]; 
		if strcmp(ext,'jpg')||strcmp(ext,'jpeg')||strcmp(ext,'tif')...
                ||strcmp(ext,'png')||strcmp(ext,'bmp')
  			I_temp = double(imread(filename));
	    elseif ext=='mat'	
			I_temp = load(filename);
            I_temp=I_temp.data;     %与View_Generator配合使用
		end

        Remap_Construct(i:UV_diameter:y_size*UV_diameter,...
		                j:UV_diameter:x_size*UV_diameter,:)=I_temp;
        
    end
end

% imshow(Remap_Construct/max(max(Remap_Construct(:,:,1))));

imwrite(Remap_Construct/max(max(Remap_Construct(:,:,1))),'CAR_REMAP.png');

  
  