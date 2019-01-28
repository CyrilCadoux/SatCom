function alpha = law_sine(a,b,beta,rad)
%alpha = law_sine(a,b,beta,rad)
%rad indicates if beta and alpha are in degree or in radian
%they are in degree by default
%a and b are trangle side
%beta is the corresponding angle of b
%alpha is the corresponding angle of a
    if(nargin < 3)
        error('not enough argument')
    end
    if(nargin == 3)
        rad = false;
    end
    
    if(rad)
        alpha = asin(a/b*sin(beta));
    else
        alpha = asind(a/b*sind(beta));
    end
end
