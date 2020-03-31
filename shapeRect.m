function shapeRect(image)
  figure(1);
  imshow(image);
  title("Orjinal Image");
  if size(image, 3) == 3
    image = rgb2gray(image);
  end
  thresh = graythresh(image);
  image = im2bw(image, thresh);
  %%image = ~image;
  image = bwareaopen(image,100);
  pause(1);
  %%-----
  sizecntarr = [];
  tmpdeger = [];
  shArea = [];
  cnvArea  = [];
  [kenar, Lbound] = bwboundaries(image);
  figure(2);
  imshow(image);
  [rNum,cNum,~] = size(image);
  [L Ne] = bwlabel(image);
  propied = regionprops(L, "BoundingBox");
  %%imshow(image);
  
%------------convexHull-------------------------
for k = 1:length(kenar)
  boundary = kenar{k};
   sizeB = size(boundary);
   x1Arr = [boundary(1,2)];
   y1Arr = [boundary(1,1)];
   for i = 1:sizeB(1,1)
      y = boundary(i,1);
      x = boundary(i,2);
      asdy = boundary(1,1);
      asdx = boundary(1,2);
      x1Arr = [x1Arr, x];
      y1Arr = [y1Arr, y];
    end
    ss = convhull(x1Arr, y1Arr); 
    shArea = [shArea, polyarea(x1Arr,y1Arr)]; %kenarlar ve convexhulldan itibaren alanları hesapladım
    cnvArea = [cnvArea, polyarea(x1Arr(ss), y1Arr(ss))]; %aralarındaki farkın büyük olması yıldız olduğunu belirtir.
end
%%--------------------------------------------------------------
  
  for n = 1:size(propied,1)
    a = int64(propied(n).BoundingBox);
    %%a(1,2) = a(1,2) + 1;
    %%rect = rectangle("Position", a,"EdgeColor","g","LineWidth",2);
    %%circ = rectangle("Position", a,"Curvature",[1 1],"EdgeColor","r","LineWidth",1);
    %%scirc
    %%temp = (propied(n).BoundingBox(1,1) + propied(n).BoundingBox(1,3)) * (propied(n).BoundingBox(1,2) + propied(n).BoundingBox(1,4));
    %%areas = uint64([areas, temp]);
    x = a(1,1);
    y = a(1,2);
    xLast = x + a(1,3);
    yLast = y + a(1,4);
    xVector = a(1,3)/2;
    yVector = a(1,4)/2;
    xKosegenCenter = (x + xLast) / 2 ;
    yKosegenCenter = (y + yLast) / 2 ;
    xKosegenCenter
    yKosegenCenter
    kosegenCenter = [xKosegenCenter, yKosegenCenter];
    centerX = x + xVector;
    centerY = y + yVector;
    center = [centerX,centerY];
    radius = xVector;
    
    [xx,yy] = ndgrid((1:rNum)-yKosegenCenter,(1:cNum)-xKosegenCenter);
    mask = (xx.^2 + yy.^2) < radius^2;
    %// Mask the original image
    image(mask) = double(0);
    [labeledimage Numberofarea] = bwlabel(image);
    newpropeid = regionprops(labeledimage, "BoundingBox");
    alansayisi = size(newpropeid);
    sizecntarr = [sizecntarr, alansayisi(1,1)];  %% alan sayıları array içine atıldı
    %%sizecntarr
    
    %%imshow(mask);
    hold on
    %%fill(circ,'g','facealpha',1);
    dcirc = drawCircle(kosegenCenter, radius);
    axis equal;
  end
  figure(3);
  imshow(image);
  sekilsayisi = size(sizecntarr);
  %%  sizecntarr(1,1) = sizecntarr(1,1) - sizecnt(1,2)
  for i = 1:sekilsayisi(1,2)
    sizecntarr(1,i) = sizecntarr(1,i) - 10; %her bir alan sayısından 10 çıkarıldı. (Toplam şekil sayısını en basta eklediğini için o silindi.)
  end
  tmpdeger = [tmpdeger, sizecntarr(1,1)];
  
  for i = 1:sekilsayisi(1,2)-1
    tmpdeger = [tmpdeger, sizecntarr(1,i+1) - sizecntarr(1,i)]; % alan sayılarını toplayarak yazdığı için birbirinden çıkarıldı.
  end
  tmpdeger
  %%int32(shArea)
  %%int32(cnvArea)
  for k = 1:length(kenar)
    if abs(cnvArea(1,k) - shArea(1,k)) > 10000
      if tmpdeger(1,k) >= 4
        disp(k); disp("sekiz yildiz");
      else
        disp(k); disp("bes yildiz");
      end
    elseif tmpdeger(1,k) >= 1 && tmpdeger(1,k) < 3
      disp(k); disp("ucgen");
    elseif tmpdeger(1,k) >= 3 && tmpdeger(1,k) <= 4
      disp(k); disp("dortgen");
    elseif tmpdeger(1,k) == 5
      disp(k); disp("besgen");
    elseif tmpdeger(1,k) == 6 || tmpdeger(1,k) == 0
      disp(k); disp("altigen");
    elseif tmpdeger(1,k) >= 7 && tmpdeger(1,k) <= 8
      disp(k); disp("sekizgen");
    else
      disp(k); disp("daire");
  end
end
 %-----------------------------------------------------------------

     
pause(1);
hold off
end