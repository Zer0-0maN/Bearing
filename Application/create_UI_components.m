function [enumRotor,imbalanceBool,forceXEnum,powerX,...
    forceYEnum,powerY,Tforce,deltaT,Tmax] = create_UI_components(app)
    %Тип_подшипника
    if strcmp(app.BearingType.Value, 'Эллиптический')
        enumRotor = 0;
    elseif strcmp(app.BearingType.Value, 'Эллиптический с легким ротором')
        enumRotor = 1;  
    elseif strcmp(app.BearingType.Value, 'Эллиптический с "нулевым" ротором')
        enumRotor = 2;
    elseif strcmp(app.BearingType.Value, 'Сегментный')
        enumRotor = 3;
    elseif strcmp(app.BearingType.Value, 'Сегментный с легким ротором')
        enumRotor = 4;
    elseif strcmp(app.BearingType.Value, 'Сегментный с "нулевым" ротором')
        enumRotor = 5;
    end
    %Наличие_дисбаланса
    imbalanceBool = app.ImbalanceBox.Value;

    %Тип_горизонтального_нагружения
    if strcmp(app.ForceBoxX.Value, 'Отсутствует')
        forceXEnum = 0;
    elseif strcmp(app.ForceBoxX.Value, 'Линейное')
        forceXEnum = 1;
    elseif strcmp(app.ForceBoxX.Value, 'Импульсное')
        forceXEnum = 2;
    end
    %Горизонтальное_нагружение
    powerX = app.EditForceX.Value;

    %Тип_горизонтального_нагружения
    if strcmp(app.ForceBoxY.Value, 'Отсутствует')
        forceYEnum = 0;
    elseif strcmp(app.ForceBoxY.Value, 'Линейное')
        forceYEnum = 1;
    elseif strcmp(app.ForceBoxY.Value, 'Импульсное')
        forceYEnum = 2;
    end
    %Вертикальное_нагружение
    powerY = app.EditForceY.Value;
    %Временные значения. Пока константы. 
    [Tforce,deltaT,Tmax] = time_constant();
end
