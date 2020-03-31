function blurryImage = edgeSmo(image)
  binaryImage = im2bw(image);
  windowSize = 20; % 10luk da yapılabilir
  kernel = ones(windowSize) / windowSize ; 
  blurryImage = conv2(single(binaryImage), kernel, 'same'); %blurlama işlemi doubleda şekiller karışıyor
  binaryImage = blurryImage > 0.1; %rethreshold tekrar threshold yap�ld�
  %gauss filter
  %orj - gausslu
  
end
  %{
  msk = image > 30;
  props = regionprops(logical(msk), 'Area');
  allAreas = sort([props.Area]);
  msk = bwareaopen(msk, 25);
  msk = imclearborder(msk);
  bw2 = bwareafilt(msk, 1);
  hold on
  bw2 = imfill(bw2, 'holes');
  %}