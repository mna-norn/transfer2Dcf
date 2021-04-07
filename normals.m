% рассчёт вектора нормали к сеточным линиям в центрах ячеек
function [nxCx, nxCy, nyCx, nyCy] = normals(xNodes, yNodes, Nx, Ny)
  nxCx = zeros(Ny,Nx);
  nxCy = zeros(Ny,Nx);
  nyCx = zeros(Ny,Nx);
  nyCy = zeros(Ny,Nx);
   
  for i = 1:Ny
    for j = 1:Nx
      nxCx(i,j) = 0.5*(yNodes(i+1,j)+yNodes(i,j)-yNodes(i,j+1)- ...
        yNodes(i+1,j+1));
      nxCy(i,j) = -0.5*(xNodes(i+1,j)+xNodes(i,j)-xNodes(i,j+1)- ...
        xNodes(i+1,j+1));
      nyCx(i,j) = 0.5*(yNodes(i+1,j)+yNodes(i+1,j+1)-yNodes(i,j)- ...
        yNodes(i,j+1));
      nyCy(i,j) = -0.5*(xNodes(i+1,j)+xNodes(i+1,j+1)-xNodes(i,j)- ...
        xNodes(i,j+1));
    end;
  end;
end;