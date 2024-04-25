% Load the camera man image
originalImage = imread('cameraman.tif');
%originalImage = imread('pout.tif');


% Task (a)
synthesized_image = uint8(255 * rand(256,256));
subplot(2,2,1); imshow(synthesized_image); title('Desired Image');
subplot(2,2,2); imhist(synthesized_image); title('Histogram of Desired Image');
subplot(2,2,3); imshow(originalImage); title('originalImage');
subplot(2,2,4); imhist(originalImage); title('Histogram of originalImage');


% Task (b)
brightened_image = originalImage + 100;
darkened_image = originalImage - 100;
brightened_image(brightened_image > 255) = 255;
darkened_image(darkened_image < 0) = 0;

% Display the orginal, brightened, and darkened images.
figure;
subplot(2, 3, 1);
imshow(originalImage);
title('Original Image');
subplot(2, 3, 2);
imshow(brightened_image);
title('Brightened Image');
subplot(2, 3, 3);
imshow(darkened_image);
title('Darkened Image');

% Display the histograms of the orginal, brightened, and darkened images.
subplot(2, 3, 4);
imhist(originalImage);
title('Histogram of original Image');
subplot(2, 3, 5);
imhist(brightened_image);
title('Histogram of Brightened Image');
subplot(2, 3, 6);
imhist(darkened_image);
title('Histogram of Darkened Image');

% Display the output transforms for the original, brightened, and darkened images.
figure;
subplot(1, 3, 1);
plot(0:255, 0:255);
title('Original Image Output Transform');
xlabel('Input Pixel Values');
ylabel('Output Pixel Values');
subplot(1, 3, 2);
plot(0:255, 100:355);
title('Brightened Image Output Transform');
xlabel('Input Pixel Values');
ylabel('Output Pixel Values');
subplot(1, 3, 3);
plot(0:255, -100:155);
title('Darkened Image Output Transform');
xlabel('Input Pixel Values');
ylabel('Output Pixel Values');

%Part D:


% Convert the image to grayscale if it is in RGB format
if size(originalImage, 3) == 3
    originalImage = rgb2gray(originalImage);
end

% Perform histogram equalization on the grayscale image
eq_img = histeq(originalImage);

% Display the original image and the equalized image side by side
figure('Name', 'Original and Equalized Images');
subplot(1,2,1);
imshow(originalImage);
title('Original Image');
subplot(1,2,2);
imshow(eq_img);
title('Equalized Image');

% Display the histograms of the original image and the equalized image side by side
figure('Name', 'Histograms of Grayscale and Equalized Images');
subplot(1,2,1);
imhist(originalImage);
title('Histogram of Grayscale Image');
subplot(1,2,2);
imhist(eq_img);
title('Histogram of Equalized Image');

% Display the Transform Function of Original Image and the equalized image side by side
[counts, bins] = imhist(originalImage);
pdf = counts / sum(counts);
cdf = cumsum(pdf);
[enh_counts, enh_bins] = imhist(eq_img);
enh_pdf = enh_counts / sum(enh_counts);
enh_cdf = cumsum(enh_pdf);
figure('Name', 'Transform Functions of Original and Enhanced Images');
subplot(1,2,1);
plot(bins, cdf);
title('Transform Function of Original Image');
xlabel('Input Intensity');
ylabel('Output Intensity');
xlim([0 255]);
ylim([0 1]);
subplot(1,2,2);
plot(enh_bins, enh_cdf);
title('Transform Function of Enhanced Image');
xlabel('Input Intensity');
ylabel('Output Intensity');
xlim([0 255]);
ylim([0 1]);
