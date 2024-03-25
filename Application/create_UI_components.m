function [enumRotor,imbalanceBool,force_info_X,...
    force_info_Y,time_info] = create_UI_components(app)
    %Тип_подшипника
    if strcmp(app.BearingType.Value, 'Эллиптический(ОШИБКА)')
        enumRotor = 0;
    elseif strcmp(app.BearingType.Value, 'Сегментный')
        enumRotor = 1;
    elseif strcmp(app.BearingType.Value, 'Сегментный(снижение ст.нагрузки)')
        enumRotor = 2;
    elseif strcmp(app.BearingType.Value, 'Сегментный(без ст.нагрузки)')
        enumRotor = 3;
    end
    %Наличие_дисбаланса
    imbalanceBool = app.ImbalanceBox.Value;
    %Задание силовых значений
    force_info_X = Force_class();
    %Тип_горизонтального_нагружения
    if strcmp(app.ForceBoxX.Value, 'Отсутствует')
        force_info_X.enumForce = 0;
    elseif strcmp(app.ForceBoxX.Value, 'Линейное')
        force_info_X.enumForce = 1;
    elseif strcmp(app.ForceBoxX.Value, 'Импульсное')
        force_info_X.enumForce = 2;
    end
    %Горизонтальное_нагружение
    force_info_X.power = app.EditForceX.Value;

    force_info_Y = Force_class();
    %Тип_вертикального_нагружения
    if strcmp(app.ForceBoxY.Value, 'Отсутствует')
        force_info_Y.enumForce = 0;
    elseif strcmp(app.ForceBoxY.Value, 'Линейное')
        force_info_Y.enumForce = 1;
    elseif strcmp(app.ForceBoxY.Value, 'Импульсное')
        force_info_Y.enumForce = 2;
    end
    %Вертикальное_нагружение
    force_info_Y.power = app.EditForceY.Value;
    %Временные значения. Пока константы. 
    [time_info] = time_constant();
end
