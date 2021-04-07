% численное решение
function uN = numerical_solve(uN, Tk, Nx, Ny, cX, cY, xNodes, yNodes, tau)
  % массивы предыдущих и следующих индексов ячеек
  indexes = (1:Nx);
  x_next = circshift(indexes, -1, 2);
  x_prev = circshift(indexes,  1, 2);

  indexes = (1:Ny);
  y_next = circshift(indexes, -1, 2);
  y_prev = circshift(indexes,  1, 2);
   
  % рассчёт площади ячеек
  cellS = calc_square(xNodes, yNodes, Nx, Ny);
   
  % рассчёт вектора нормали к сеточным линиям в центрах ячеек
  [nxCx, nxCy, nyCx, nyCy] = normals(xNodes, yNodes, Nx, Ny);
  
  t = 0;   
   
  while (t < Tk)
    for i=1:Ny
      for j=1:Nx
            
        % предыдущие и последующие индексы по i,j для текущей ячейки
        prevXidx = x_prev(j);
        nextXidx = x_next(j);
        prevYidx = y_prev(i);
        nextYidx = y_next(i);
 
        % проекция вектора скорости на нормаль и расчет потока
        % в центре ячейки в направлении Х
        cLoc = cX*nyCx(i, j) + cY*nyCy(i, j);
        if (cLoc < 0)
          flowX = cLoc*(uN(i, nextXidx)-uN(i,j));
        else
          flowX = cLoc*(uN(i, j)-uN(i,prevXidx));
        end
            
        % проекция вектора скорости на нормаль и расчет потока
        % в центре ячейки в направлении Y   
        cLoc = cX*nxCx(i, j) + cY*nxCy(i, j);
        if (cLoc < 0)
          flowY   = cLoc*(uN(nextYidx,j)-uN(i,j));
        else
          flowY   = cLoc*(uN(i, j)-uN(prevYidx,j));
        end
         
        % вычисление значения функции в центре ячейки на новом временном
        % слое
        uNp1(i,j) = uN(i,j)-tau/cellS(i,j)*(flowX+flowY);
      end
    end
     
    uN = uNp1;
    t = t+tau;
  end
