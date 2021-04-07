% расчёт аналитического решения
function u = analytical_solve(Tk, cX, cY, Lx, Ly, xCells, yCells)
  Nx = size(xCells, 2);
  Ny = size(yCells, 1);
   
  u = zeros(Ny, Nx);
  for i=1:Ny
    for j=1:Nx
      u(i, j) = exp(-300*((xCells(i, j)-(0.5+cX*Tk)*Lx)^2 + ...
        (yCells(i, j)-(0.5+cY*Tk)*Ly)^2));
    end
  end
end
