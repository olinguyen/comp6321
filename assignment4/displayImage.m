function [  ] = displayImage( img )
    new_img = uint8(img);
    new_img = reshape(new_img, 407, 516, 3);
    image(flipdim(imrotate(new_img, -90), 2));
end