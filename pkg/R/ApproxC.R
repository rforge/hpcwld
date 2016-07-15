# This gives the constant C in the inequality lambda C/mu <1 of the cluster model stability condition
ApproxC=function(s,p,depth=3){
	A=cumsum(p[s:1])
	B=p
	C=0
	for(i in 1:depth){
	C=C+sum(B[1:(s-i+1)]*A[i:s])/i
	B=convolve(B,rev(p),type="o")[1:s]
	}
	return(C)
}
