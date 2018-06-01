%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Read .mat to LF data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function LF = Mat2LF(filepath)
% Get image list

list = dir(fullfile([filepath,'\*.','mat']));
N = sqrt(size(list,1));
temp=load([filepath,'\',list(1).name]);
temp=temp.data;
[R, C, CH] = size(temp);
LF = zeros(N,N,R,C,CH);

for i=1:N
    for j=1:N
        n = sub2ind([N,N],j,i);   
        filename = [filepath, '\', list(n).name];    
        
        I_temp = load(filename);    
        I_temp = I_temp.data;      
        LF(i,j,:,:,:) = I_temp;       % ∞¥’’––∂¡
    end
end

return;

