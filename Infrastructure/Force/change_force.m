function result = change_force(t,force_info,time_info)
    if force_info.enumForce == 0
        result = 0;
    elseif force_info.enumForce == 1
        result = linear_force(t,force_info,time_info);
    elseif force_info.enumForce == 2
        result = impulse_force(t,force_info,time_info);
    end
end