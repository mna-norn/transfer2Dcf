% расчёт координат центра ячеек
function [xCenter, yCenter] = centers(xNodes, yNodes, Nx, Ny)
  xCenter = zeros(Ny, Nx);
  yCenter = zeros(Ny, Nx);
  
  for i=1:Ny
    for j=1:Nx
      xCenter(i,j) = 0.25*(xNodes(i,j)+xNodes(i+1,j)+ ...
        xNodes(i+1,j+1)+xNodes(i,j+1));
      yCenter(i,j) = 0.25*(yNodes(i,j)+yNodes(i+1,j)+ ...
        yNodes(i+1,j+1)+yNodes(i,j + 1));
    end;
  end;
end
