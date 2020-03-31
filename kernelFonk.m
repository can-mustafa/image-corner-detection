function newImg = kernelFonk(image)
  kernelA1 = [0,1,0,0,0; 0,1,0,0,0; 0,1,0,0,0; 0,1,1,1,1; 0,0,0,0,0];
  kernelA2 = [0,0,0,0,0; 0,1,1,1,1; 0,1,0,0,0; 0,1,0,0,0; 0,1,0,0,0];
  kernelA3 = [0,0,0,0,0; 1,1,1,1,0; 0,0,0,1,0; 0,0,0,1,0; 0,0,0,1,0];
  kernelA4 = [0,0,0,1,0; 0,0,0,1,0; 0,0,0,1,0; 1,1,1,1,0; 0,0,0,0,0];
  #right angle (straight)
  kernelB1 = [0,0,0,0,0; 0,0,1,0,0; 0,1,0,1,0; 1,0,0,0,1; 0,0,0,0,0];
  kernelB2 = [0,0,0,1,0; 0,0,1,0,0; 0,1,0,0,0; 0,0,1,0,0; 0,0,0,1,0];
  kernelB3 = [0,1,0,0,0; 0,0,1,0,0; 0,0,0,1,0; 0,0,1,0,0; 0,1,0,0,0];
  kernelB4 = [0,0,0,0,0; 1,0,0,0,1; 0,1,0,1,0; 0,0,1,0,0; 0,0,0,0,0];
  #acute angle
  %{
  kernelC1 = [0,0,0,0,0; 0,1,1,1,0; 1,0,0,0,1; 0,0,0,0,0; 0,0,0,0,0];
  kernelC2 = [0,0,1,0,0; 0,1,0,0,0; 0,1,0,0,0; 0,1,0,0,0; 0,0,1,0,0];
  kernelC3 = [0,0,0,0,0; 0,0,0,0,0; 1,0,0,0,1; 0,1,1,1,0; 0,0,0,0,0];
  kernelC4 = [0,0,1,0,0; 0,0,0,1,0; 0,0,0,1,0; 0,0,0,1,0; 0,0,1,0,0];
  %}
  #wide angle
  image1 = imfilter(image,kernelA1); %kernellarýn hepsi image1 üzerine peþ peþe
  image1 = imfilter(image1,kernelA2);%uygulanarak köþelerde farklý kesitler
  image1 = imfilter(image1,kernelA3);%elde edilmiþtir.
  image1 = imfilter(image1,kernelA4);
  image1 = imfilter(image1,kernelB1);
  image1 = imfilter(image1,kernelB2);
  image1 = imfilter(image1,kernelB3);
  newImg = imfilter(image1,kernelB4);
  %{
  image1 = imfilter(image1,kernelC1);
  image1 = imfilter(image1,kernelC2);
  image1 = imfilter(image1,kernelC3);
  newImg = imfilter(image1,kernelC4);
  %}
endfunction
