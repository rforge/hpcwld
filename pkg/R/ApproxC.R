 ApproxC=function(s,p){ C=sum(cumsum(p[s:1])*p)+0.5*sum(sapply(2:s, function(k) { sum(p[1:(k-1)]*p[(k-1):1])})*cumsum(p[s:2]) ); 1/C }
