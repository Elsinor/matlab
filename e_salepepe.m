function res = e_salepepe (img, perc, grayscale)
%E_SALEPEPE (img, perc, grayscale) 
%Filtro sale pepe.
% res = E_SALEPEPE(img, perc, grayscale = false) ritorna la matrice modificata.
%  - img � l'immagine a cui viene applicato il filtro.
%  - perc � la percentuale di sale e pepe che verr� applicata.
%  - grayscale � opzionale, se 'true' converte la matrice in scala di grigi prima di
%     applicare il filtro.

% check args
if nargin < 3
    grayscale = false;
end

% assegna ad h l'altezza dell'immagine.
% assegna a w la lunghezza dell'immagine.
[h, w, ~] = size(img);

p = h * w;
% genera una permutazione random di indici della stessa dimensione
% dell'immagine.
perm = randperm(p);

% calcola il numero di pixels rispettivamente di sale e di pepe in base
% alla percentuale ricevuta in input.
perc = round(perc/2 * p / 100);

% se � stata richiesta l'immagine in scala di grigi
if (grayscale == true)
    res = e_rgb2gray(img, 'intensity');
    res( perm(1 : perc) ) = 255;
    res( perm(perc : 2*perc) ) = 0;
% altrimenti mantieni l'immagine a colori
else
    res = img;   
    % ad ogni iterazione del seguente for corrisponde 
    % il rispettivo canale rgb
    for i = 1 : 3
        % a � un singolo canale rgb temporaneo
    	a = res(:, :, i);  
        % ad ogni canale, in corrispondenza degli stessi indici della
        % permutazione, vengono assegnati valori di sale e pepe.
        a(perm(1 : perc)) = 255;
        a(perm(perc : 2*perc)) = 0;
        res(:, :, i) = a;
    end
end




