function convFonk(image)
  [kenar, L] = bwboundaries(image);
  x1Arr = [];
  y1Arr = [];
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
      %axis ([-3.05, 3.05, -0.05, 1.05]);
      ss = convhull(x1Arr, y1Arr);  %convhull fonksiyonu ile birlikte þeklin 
      shArea = polyarea(x1Arr,y1Arr); %köþeleri etrafýnda çizim yapýlmýþtýr
      cnvArea = polyarea(x1Arr(ss), y1Arr(ss)); %(yýldýz ve diðer cisimleri
      plot(x1Arr(ss), y1Arr(ss), "b-", x1Arr, y1Arr, "r+"); % ayýrt etmede kullanýþlýdýr)
      hold on  
      fill(x1Arr(ss),y1Arr(ss),'g','facealpha', 1);
      axis equal;
      hold on
      
      %disp(asdx); disp(asdy); disp(num2str(k)); disp(num2str(shArea)); disp(num2str(cnvArea)); 
      
  end
end  
hold off