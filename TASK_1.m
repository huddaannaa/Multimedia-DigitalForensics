clc
clear

%TASK 1
%_________________________________
%NAME          : HUD SEIDU DAANNAA
%_________________________________

%EMBEDING A STRING
%String and cover for watermark process
string = 'Hud Seidu Daannaa';
cover0  = imread('16.png');

%Embedding watermark and string
w_image_embed_1 = watermark_embed(cover0,string,'password');

%Displaying cover and watermark embedded image
subplot(2,2,1), imshow(cover0), title('Original cover image ');
subplot(2,2,2), imshow(w_image_embed_1), title('Embedded Watermarked string');

%EXTRACTING A STRING
w_string_extract = watermark_extract(w_image_embed_1, size(string,2),'password');

%Printing the extract from the watermark embeded image
fprintf('The extracted watermark is: ''%s''\n', w_string_extract);

%EMBEDING AN IMAGE
%Watermark image
image_w = imread('12.png');

%Watermark image to binary (black and white)
image_w = im2bw(image_w);


%Embed image in cover
w_image_embed_2 = watermark_embed(cover0,image_w,'password');

%Display cover and watermark embedded image
subplot(2,2,3), imshow(w_image_embed_2), title('Embedded Watermark image');

%EXTRACTING AN IMAGE
w_image_extract = watermark_extract(w_image_embed_2, size(image_w),'password');

%Showing the image extract
subplot(2,2,4),imshow(w_image_extract), title('Extracted watermark image');

%This is just to check if the extracted image is the same as what we used
%in the embedding process
if isequal(image_w,w_image_extract);
    disp('The watermark image embeded with the cover and the extracted image from the cover are the same');
else
    disp('The watermarks do not match');
end

%pause;
%_________________________________________________
