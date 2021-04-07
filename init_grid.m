% начальное распределение в ячейках сетки
function u = init_grid(Lx, Ly, xCells, yCells)
  Nx = size(xCells, 2);
  Ny = size(yCells, 1);
   
  u = zeros(Ny, Nx);
  for i=1:Ny
    for j=1:Nx
      u(i, j) = exp(-300*((xCells(i, j)-0.5*Lx)^2 + (yCells(i, j)-0.5*Ly)^2));
    end
  end
end
