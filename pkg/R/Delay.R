Delay=function(T,S,N,s,n=length(T),init.workload=rep(0,s)) {
workload=init.workload
Delay=vector("numeric",n)
for(i in 1:n){ 
  Delay[i]=workload[N[i]]
  workload=sort(pmax((Delay[i]+S[i])*(1:s<=N[i])+workload*(1:s>N[i])-T[i], 0))}
Delay
}