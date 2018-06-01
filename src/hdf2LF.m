function [LF,LF_Remap,IM_Pinhole]=hdf2LF(file_path)

%% preprocessing to get LF_REMAP and IM_Pinhole

[pathstr,name,ext] = fileparts([file_path]);
idx=strfind(name,'_LF_Remap'); 
name=name(1:idx-1);

hinfo_data = hdf5info(file_path);
if strcmp('rx_watch',name)
    groundtruth = hdf5read(file_path,'/Depth');
else           
    groundtruth = hdf5read(file_path,'/GT_DEPTH');
end
%         LF_temp = hdf5read(input_string,'/LF');

if strcmp(file_path,'Cube') || strcmp(file_path,'Couple') 
    data = hdf5read(hinfo_data.GroupHierarchy.Datasets(3));
else
    data = hdf5read(hinfo_data.GroupHierarchy.Datasets(2));
end    

use_decode=1;

if  use_decode   
    idx_size = max(size(hinfo_data.GroupHierarchy.Attributes));
    shortname = cell(idx_size,1);
    for ids = 1:idx_size
       shortname{ids} =  hinfo_data.GroupHierarchy.Attributes(ids).Shortname;
    end

    indexcell = strfind(shortname, 'dH');
    dH_id = find(not(cellfun('isempty', indexcell)));
    indexcell = strfind(shortname, 'focalLength');
    focalLength_id = find(not(cellfun('isempty', indexcell)));    
    indexcell = strfind(shortname, 'shift');
    shift_id = find(not(cellfun('isempty', indexcell)));
    indexcell = strfind(shortname, 'xRes');
    xRes_id = find(not(cellfun('isempty', indexcell)));
    indexcell = strfind(shortname, 'yRes');
    yRes_id = find(not(cellfun('isempty', indexcell)));
    indexcell = strfind(shortname, 'hRes');
    hRes_id = find(not(cellfun('isempty', indexcell)));
    indexcell = strfind(shortname, 'vRes');
    vRes_id = find(not(cellfun('isempty', indexcell)));

    dH = hinfo_data.GroupHierarchy.Attributes(dH_id).Value;
    focalLength = hinfo_data.GroupHierarchy.Attributes(focalLength_id).Value;

    shift = hinfo_data.GroupHierarchy.Attributes(shift_id).Value;

    xRes = hinfo_data.GroupHierarchy.Attributes(xRes_id).Value;
    yRes = hinfo_data.GroupHierarchy.Attributes(yRes_id).Value;
    uRes = hinfo_data.GroupHierarchy.Attributes(hRes_id).Value;
    vRes = hinfo_data.GroupHierarchy.Attributes(vRes_id).Value;


    UV_diameter = uRes;
    UV_center = round(UV_diameter/2);
    UV_radius = UV_center - 1;
    UV_size = UV_diameter^2;
    LF_y_size = yRes * vRes;
    LF_x_size = xRes * uRes;
    y_size=yRes;
    x_size=xRes;


    LF          = permute(double(data), [5 4 3 2 1]); 
    depth       = groundtruth(:,:,UV_center,UV_center)';
    disparity   = (double(dH)*focalLength) ./ depth - double(shift);

    LF_Remap    = (reshape(permute(LF, [1 3 2 4 5]), [LF_y_size LF_x_size 3]));     
    IM_Pinhole  = (im2double(squeeze(LF(UV_center,UV_center,:,:,1:3)))); 
end