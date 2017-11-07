clc;
clear;

%TASK 2

%Covers for watermrking process
cover1  = imread('05.png');
cover2  = imread('20.png');

%Strings to be embedded into covers
string1 = 'Hud Seidu Daannaa';

%Where n is the limit to set the "for loop" i.e. "for q=1:n" to
%limit for quantization step "q"
n = 32

%TO CHANGE ONE PARAMETER FOR TWO WATERMARK EMBEDDED IMAGES WE WILL TWEAK
%THE QUANTIZATION STEP, USING A FOR LOOPS

for q=1:n  %where coefficient list is "32"
    
    %For this embedded images we change the Quantiztion step "q"
    %where (change = quantization step "q")
    
    %First watermark
    watermark_embed_image1 = watermark_embed(cover1, string1,'Password', 'coeff_list', q);
    
    %Second watermark
    watermark_embed_image2 = watermark_embed(cover2, string1,'Password', 'coeff_list', q);
    
    %Finding the PSNR _1 of the cover and the watermarked image
    psnr_value1(q) = PSNR(cover1,watermark_embed_image1)
    
    %Finding the PSNR_2 of the cover and the watermarked image
    psnr_value2(q) = PSNR(cover2,watermark_embed_image2);
    
    %printing the resulting PSNR values for watermarks with different q
    %fprintf('%d\n',psnr_value1(q));
    %fprintf('%d\n',psnr_value2(q));
end

%PLOTS ON A GRAPTH OF 'q' TO PSNR VALUES
%Plots of the first watermark with chaning 'q'
subplot(3,2,1), plot(1:n, psnr_value1, '-*'), title('With cover1');
axis tight;
xlabel('Number of Quantization steps');
ylabel('PSNR (dB)');

%Plots of the second watermark with chaning 'q'
subplot(3,2,2), plot(1:n, psnr_value2, '-*'), title('With cover2');
axis tight;
xlabel('Number of Quantization steps');
ylabel('PSNR (dB)');

%A subplot showing covers and watermark images
subplot(3,2,3), imshow(cover1), title('cover1 (original)');
subplot(3,2,4), imshow(cover2), title('cover2 (original)');
subplot(3,2,5), imshow(watermark_embed_image1), title('watermark_ string1 embedded with cover 1');
subplot(3,2,6), imshow(watermark_embed_image2), title('watermark_ string2 embedded with cover 2');

%pause;
%_________________________________________________
