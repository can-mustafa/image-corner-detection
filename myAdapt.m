function bw = myAdapt(im,ws,c,tm)
  im = mat2gray(im);
  if tm == 0
    mim = imfilter(im,fspecial('average', ws),'replicate');
  else
    mim = medfilt2(im,[ws,ws]);
endif
sim = mim-im-c;
bw = im2bw(sim,0);
endfunction
%{
default threshold fonksiyonunun yeterli olmadýðý zamanlar
image üzerine (bölgesel) adaptive threshold uygulamak
için kullanýlabilecek fonksiyon
%}
