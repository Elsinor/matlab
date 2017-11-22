function new_t = grayScaleLightnessCorrection(t)
    if t > power(6/29, 3)
        new_t = power(t, 1/3);
    else
        new_t = ((power(29/6,2)/3)*t) + 4/29;
    end
end
