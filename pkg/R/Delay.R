Delay=function(T,S,N,s) {
n=length(T)
workload=rep(0,s)
Delay=rep(0,n)

for(i in 1:n){
	Delay[i]=workload[N[i]]
	for(j in 1:N[i])
		workload[j]=max(Delay[i]+S[i]-T[i],0)
	if(N[i]<s)
		for(j in (N[i]+1):s)
			workload[j]=max(workload[j]-T[i],0)
	workload=sort(workload)
	}
Delay
}
