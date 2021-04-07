% Решение двумерного уравнения переноса с помощью простой противопотоковой схемы
% на регулярных, неортогональных сетках

function main()
  clc;
  clear;
  close all;

  % размеры области
  Lx = 1.0;
  Ly = 1.0;

  % разбиение области по осям
  Nx = 100;
  Ny = 100;

  % конечный момент времени
  Tk = 0.2;
   
  % величины скорости переноса по осям
  cX = 0.5;
  cY = -1.0;
   
  % шаг по времени
  tau = 1e-3;
   
  % инициализация сетки
  [xNodes, yNodes] = new_grid(Lx, Ly, Nx, Ny);

  % вычисление координат центров ячеек
  [xCenter, yCenter] = centers(xNodes, yNodes, Nx, Ny);

  % начальное распределение
  uN = init_grid(Lx, Ly, xCenter, yCenter);

  % построение начального распределения
  figure;
  surf(xCenter,yCenter,uN);
  title('Начальное распределение');

  % построение численного решения в конечный момент времени
  uN = numerical_solve(uN, Tk, Nx, Ny, cX, cY, xNodes, yNodes, tau);
  figure;
  surf(xCenter, yCenter, uN);
  title ('Численное решение');
      
  % построение аналитического решения в конечный момент времени
  uNa = analytical_solve(Tk,cX,cY,Lx, Ly, xCenter, yCenter);
  figure;
  surf(xCenter, yCenter, uNa);
  title('Аналитическое решение');
    
  % построение абсолютной ошибки численного решения 
  figure;
  surf(xCenter, yCenter, uN-uNa);
  title('Абсолютная ошибка');   
end
