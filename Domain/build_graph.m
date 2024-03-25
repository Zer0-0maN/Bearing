function build_graph(x,xd,y,yd,t,string,typeEnum)
    %Свойство печати
    set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Times New Roman');    
    tiledlayout(2,1)
    %График для оси X
    graf1 = nexttile;
    plot(graf1,t,x,'r-',t,xd,'b-')
    title(graf1,'В плоскости Х')  
    ylabel(graf1,'Перемещение')
    xlabel(graf1,string)
    legend(graf1,'Цапфа','Диск')
    grid on;
    %График для оси Y
    graf2 = nexttile;
    plot(graf2,t,y,'r-',t,yd,'b-');
    title(graf2,'В плоскости Y')  
    ylabel(graf2,'Перемещение')
    xlabel(graf2,string)
    legend(graf2,'Цапфа','Диск')
    grid on;
    %Имя графика
    if typeEnum == 0 % Для эллиптического подшипника 
        set(gcf,'Name', 'Эллиптический подшипник');
    end
    if typeEnum == 1 % Для сегментного подшипника 
        set(gcf,'Name', 'Сегментный подшипник');
    end
    set(gcf,'Units', 'normalized', 'OuterPosition', [0 0.1 1 0.9]);
end

