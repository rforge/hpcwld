EnergyWorkload = function(k1=1,k2=1,num.iter=10) # Function to compare Energy and Workload for various switching thresholds
{
r=c(0.9,1.5) # Speeds 1 and 2
e0=1 # Energy consumption at idle
e=c(2,4) # Energy consumption at speeds 1 and 2

# Init
E=0 #average energy consumption
W=0 #average workload

for(i in 1:num.iter) {
	X=HPC(k1=k,k2=k,r=r)
	E=E+sum(sapply(1:(length(X$event.time)-1), function(i){ (X$event.time[i+1]-X$event.time[i])*ifelse(X$num.at.service[i]==0,e0,e[X$speed[i]]) } ))/(max(X$event.time)*num.iter)
	W=W+sum(sapply(1:(length(X$event.time)-1), function(i){Dt=X$event.time[i+1]-X$event.time[i]; Dt*X$sapply.res.job..sum.[i]-.5*X$num.at.service[i]*r[X$speed[i]]*Dt^2} ))/(max(X$event.time)*num.iter)
}
return(c(E, W))
}
