
function LF=Remap2LF(Remap)


[height, width,~]=size(Remap);

views=[9,9];
% ImLittle=zeros(height/view(1),width/view(2),3);

LF=zeros(views(1),views(2),height/views(1),width/views(2),3);

for i=1:views(1)
    for j=1:views(2)
        
        ImLittle=Remap(i:views(1):height,j:views(2):width,:);                                      
        LF(i,j,:,:,:)=ImLittle;
    end
end

