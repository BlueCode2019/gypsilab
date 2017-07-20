function M = hmxSparse(Mh)
%+========================================================================+
%|                                                                        |
%|               OPENHMX, H-MATRIX COMPRESSION AND ALGEBRA                |
%|              openHmx is part of GYPSYLAB toolbox - v0.20               |
%|                                                                        |
%| Copyright (c) 20015-2017, Ecole polytechnique, all rights reserved.    |
%| Licence Creative Commons BY-NC-SA 4.0, Attribution, NonCommercial and  |
%| ShareAlike (see http://creativecommons.org/licenses/by-nc-sa/4.0/).    |
%| This software is the property from Centre de Mathematiques Appliquees  |
%| de l'Ecole polytechnique, route de Saclay, 91128 Palaiseau, France.    |
%|                                                            _   _   _   |
%| Please acknowledge the GYPSILAB toolbox in programs       | | | | | |  |
%| or publications in which you use the code. For openHmx,    \ \| |/ /   |
%| we suggest as reference :                                   \ | | /    |
%| [1] : www.cmap.polytechnique.fr/~aussal/gypsilab             \   /     |
%| [2] : 13th International Conference on Mathematical           | |      |
%| and Numerical Aspects of Wave Propagation, University of      | |      |
%| Minnesota, may 2017. "OpenHmX, an open-source H-Matrix        | |      |
%| toolbox in Matlab".                                           | |      |
%|_______________________________________________________________|_|______|
%| Author(s)  : Matthieu Aussal - CMAP, Ecole polytechnique               |
%| Creation   : 14.03.17                                                  |
%| Last modif : 21.06.17                                                  |
%| Synopsis   : Convert H-Matrix to sparse matrix                         |
%+========================================================================+
    
% H-Matrix (recursion)
if (Mh.typ == 0)
    M = sparse(Mh.dim(1),Mh.dim(2));
    for i = 1:4
        M(Mh.row{i},Mh.col{i}) = hmxSparse(Mh.chd{i});
    end
    
% Compressed leaf
elseif (Mh.typ == 1)
    M = sparse(Mh.dat{1} * Mh.dat{2});
    
% Full leaf
elseif (Mh.typ == 2)
    M = sparse(Mh.dat);

% Sparse leaf
elseif (Mh.typ == 3)
    M = Mh.dat;

% Unknown type
else
    error('hmxSparse.m : unavailable case')
end

end