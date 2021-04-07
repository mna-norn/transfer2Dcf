% создание сетки
function [xNodes, yNodes] = new_grid(Lx, Ly, Nx, Ny)
  % средний шаг по x, y
  hx = Lx/Nx;
  hy = Ly/Ny;

  % макисмальное максимальный сдвиг узлов по осям
  divX = 0.2;
  divY = 0.4;

  % строим сетку
  xNodes = zeros(Ny + 1, Nx + 1);
  yNodes = xNodes;
   
  % первая строка
  xNodes(1,1) = 0;
  yNodes(1,1) = 0;
   
  for j=2:Nx
    xNodes(1,j) = ((j - 1) + 2*(rand()-0.5)*divX)*hx;
    yNodes(1,j) = 0;
  end
   
  xNodes(1,Nx+1) = Lx;
  yNodes(1,Nx+1) = 0;

  for i=2:Ny+1
    xNodes(i,1) = 0;
    yNodes(i,1) = ((i - 1) + 2*(rand()-0.5)*divY)*hy;

    for j=2:Nx
      xNodes(i,j) = ((j - 1) + 2*(rand()-0.5)*divX)*hx;
      yNodes(i,j) = ((i - 1) + 2*(rand()-0.5)*divY)*hy;
    end
 
    xNodes(i,Nx+1) = Lx;
    yNodes(i,Nx+1) = ((i - 1) + 2*(rand()-0.5)*divY)*hy;
  end
   
  % последняя строка
  xNodes(Ny+1,1) = 0;
  yNodes(Ny+1,1) = Ly;

  for j=2:Nx
    xNodes(Ny+1,j) = ((j - 1) + 2*(rand()-0.5)*divX)*hx;
    yNodes(Ny+1,j) = Ly;
  end

  xNodes(Ny+1,Nx+1) = Lx;
  yNodes(Ny+1,Nx+1) = Ly;
end
