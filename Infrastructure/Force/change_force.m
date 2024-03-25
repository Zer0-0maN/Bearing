function result = change_force(t,enumForce,powerX,Timpulse,deltaT)
    if enumForce == 0
        result = 0;
    elseif enumForce == 2
        result = linear_force(t,Timpulse,powerX,deltaT);
    elseif enumForce == 1
        result = impulse_force(t,Timpulse,powerX,deltaT);
    end
end