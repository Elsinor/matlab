function rotate( img, alpha )
    [w, h, ~] = size(img);
    
    %estremi = [1 1; 1 w; h 1; h w];
    
    xEstremi = [1, w, 1, w];
    yEstremi = [1, 1, h, h];
    
    % ruoto i 4 estremi
    estremiRuotati = ...
    [rotationSys(xEstremi(1), yEstremi(1), alpha), ...
        rotationSys(xEstremi(2), yEstremi(2), alpha), ...
        rotationSys(xEstremi(3), yEstremi(3), alpha), ...
        rotationSys(xEstremi(4), yEstremi(4), alpha)];
    
    for i=1:4
       xRotEstremi(i) = estremiRuotati(i,1);
       yRotEstremi(i) = estremiRuotati(i,2);
    end
    
    % trovo il massimo e minimo delle ordinate
    minY = min(yRotEstremi);
    maxY = max(yRotEstremi);
    
    % trovo il massimo e minimo delle ascisse
    minx = min(xRotEstremi);
    maxX = max(xRotEstremi);

    % trovo le dimensioni della nuova immagine
    % come la distanza tra i minimi e i massimi
    H = pdist([minY, maxY]);
    W = pdist([minX, maxX]);
    
    new_img = zeros(H, W);
    
    for Y = 1:H
        for X=1:W
            new_img(x-w/2, y-h/2) = ...
                img(Y-H/2, X-W/2);
        end
    end
    
    figure; imshow(new_img);
end


function [soly, solx] = rotationSys(x, y, alpha)
    syms X Y
    eqn1 = X * cos(alpha) - Y * sin(alpha) == x;    
    eqn2 = Y * cos(alpha) - X * sin(alpha) == y;

    sol = solve([eqn1, eqn2], [X, Y]);
    
    solx = sol.x;
    soly = sol.y;
end
