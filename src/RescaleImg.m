
function Res=RescaleImg(LF)

%---Rescale for 8-bit display---
if( isfloat(LF) )
    Res = uint8(LF ./ max(LF(:)) .* 255);
else
    Res = uint8(LF.*(255 / double(intmax(class(LF)))));
end