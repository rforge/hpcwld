hpc <-
function(lambda = 1, mu=1, n=100, totalServ=1, k1=5, k2=5,  r=c(0.5,2), NServ = sample(1:totalServ, n, replace=TRUE, prob=rep(1/totalServ,totalServ) ), JobSize = rexp(n, mu), ArrivalTime = c(0,cumsum(rexp(n-1, lambda ))),  switching_mode="other")
{
  event=vector() # Type of event: A=arrival, D=departure, S=switch
  event.task=vector() # Task related to event, if any
  event.time=vector() # 
  counter.of.events=vector()
  task.inthesystem=list()
  res.job=list()
  num.at.service=vector()
  speed=vector()
  sum.workload = vector()
  waiting.time=vector()
  service.time=vector()
  task.delay=vector()
  lost.job = vector()
  start.service.time=vector()
  
  # Initialize the recursion
  i=1
  event[i] = "A"
  event.task[i]=1
  event.time[i]=0
  counter.of.events["A"]=1
  counter.of.events["D"]=counter.of.events["S"]=0
  res.job[[1]] = JobSize[1]
  task.inthesystem[[1]] = 1
  num.at.service[1] = 1
  speed[1]=ifelse(JobSize[1]>k2,2,1)
  lost.job[1] = 0
  sum.workload[i]=0 
  # response.time[i]=0
  waiting.time[i]=0
  #task.delay[i]=0
  
  
  # Perform the recursion  
  while(counter.of.events["D"]<n){
    # First we determine the ongoing event. We find the nearest between the three events: A, D or S  
    nearest.arrival=ifelse(counter.of.events["A"]<n,ArrivalTime[counter.of.events["A"]+1],Inf)
    nearest.departure = ifelse(num.at.service[i]>0,event.time[i] + min(unlist(res.job[[i]])[ 1:num.at.service[i] ])/r[speed[i]],Inf)
    if(switching_mode=="arrivals" || switching_mode=="arr_and_dep") nearest.switch=Inf
    else if(switching_mode=="other") nearest.switch = ifelse(speed[i]==2,(sum(res.job[[i]])-k1)/r[speed[i]] + event.time[i],Inf)
    
    i=i+1 # Now we make the step
    
    event.time[i] = min(nearest.arrival, nearest.departure, nearest.switch)
    
    # Now we set up the current variables
    if(event.time[i] == nearest.arrival) {
      event.task[i] = which(ArrivalTime==nearest.arrival) # номер приходящей
      event[i] = "A"
    }
    if(event.time[i] == nearest.departure) {
      event.task[i] = (task.inthesystem[[i-1]])[which.min(unlist(res.job[[i-1]])[1:num.at.service[i-1]] )]
      #response.time[j1]=nearest.departure-ArrivalTime[current.task] #MEAN WAITING TIME 
      event[i] = "D"
    }
    if(event.time[i] == nearest.switch)
    {
      event[i] = "S"
    }   
    counter.of.events[event[i]]=counter.of.events[event[i]]+1
    
    res.job[[i]]=(res.job[[i-1]]-(event.time[i]-event.time[i-1])*r[speed[i-1]]*(1:length(task.inthesystem[[i-1]])<=num.at.service[i-1]))
    
    if(event[i]=="A"){
      sum.workload[counter.of.events["A"]]=sum(res.job[[i]])
      task.inthesystem[[i]]=c(task.inthesystem[[i-1]],event.task[i])
      res.job[[i]]=c(res.job[[i]],JobSize[event.task[i]])           
      if(sum(res.job[[i]]) > k2) speed[i] = 2
      else if(sum(res.job[[i]]) < k1) speed[i] = 1
      else speed[i] = speed[i-1]
    }
    
    if(event[i]=="D"){
      speed[i] = speed[i-1]
      if(switching_mode=="arr_and_dep") {
        if(sum(res.job[[i]])<k1) speed[i]=1
      }
      task.inthesystem[[i]]=setdiff(task.inthesystem[[i-1]],event.task[i]) 
      res.job[[i]]=res.job[[i]][-which(task.inthesystem[[i-1]]==event.task[i])]
    }
    
    if(event[i]=="S"){
      speed[i] = 1
      task.inthesystem[[i]]=task.inthesystem[[i-1]]
    }
    num.at.service[i]=sum(cumsum(NServ[task.inthesystem[[i]]])<=totalServ)  
    
    start.service.time[setdiff(task.inthesystem[[i]][1:num.at.service[i]],task.inthesystem[[i-1]][1:num.at.service[i-1]])]=event.time[i]
    
    lost.job[i] = speed[i-1]*(event.time[i]-event.time[i-1])*(totalServ - sum(NServ[num.at.service[i]]) )*(length(task.inthesystem[[i]])>totalServ)
    
  }
 
  return(list(event, event.time,  speed, start.service.time, num.at.service, lost.job, sapply(res.job, sum)))
}

x=hpc()


#**************************

#Energy consumption & Workload

energy_workload = function(k=1,num.iter=10)
{
r=c(0.5,2) # Speeds 1 and 2
e0=1 # Energy consumption at idle
e=c(2,5.5) # Energy consumption at speeds 1 and 2

# Init
E=0 #average energy consumption
W=0 #average workload

for(i in 1:num.iter) {
	X=hpc(k1=k,k2=k,r=r)
	E=E+sum(sapply(1:(length(X[[2]])-1), function(i){ (X[[2]][i+1]-X[[2]][i])*ifelse(X[[5]][i]==0,e0,e[X[[3]][i]]) } ))/(max(X[[2]])*num.iter)
	W=W+sum(sapply(1:(length(X[[2]])-1), function(i){Dt=X[[2]][i+1]-X[[2]][i]; Dt*X[[7]][i]-.5*X[[5]][i]*r[X[[3]][i]]*Dt^2} ))/(max(X[[2]])*num.iter)
}
return(c(E, W))
}

#response time for each task
response.time = x[[2]][which(x[[1]]=="D")] - x[[2]][which(x[[1]]=="A")]
#the time spent in the queue for each task
waiting.time = x[[4]]-x[[2]][which(x[[1]]=="A")]

task.delay=response.time/waiting.time

#усреднение траекторий
res=sapply(0:50,energy_workload)

##график энергии

pdf(file="Energy_stable_try.pdf", width = 4,height=4)
plot(0:50,res[1,],type="l",xlab="k",ylab="E(k)" )
dev.off()

##график работы

pdf(file="Work_stable_try.pdf", width = 4,height=4)
plot(0:50,res[2,],type="l",xlab="k",ylab="W(k)" )
dev.off()
