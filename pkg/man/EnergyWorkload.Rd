\name{Wld}
\alias{Wld}
\title{
Workload of a High Performance Cluster model
}
\description{
This function computes the Kiefer-Wolfowitz modified vector for a HPC
model. This vector contains the work left on each of 'm' servers of a cluster
for the time of the arival of a task. Two methods are available, one for the 
case of concurrent server release (all the servers end a single task simultaneously),
other for independent release (service times on each server are independent).  
}
\usage{
Wld(T, S, N, m, method = "concurrent")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{T}{
Interarrival times of tasks
}
  \item{S}{
Service times of tasks (a vector of length n, or a matrix nrows=n, ncols='m').
}
  \item{N}{
Number of cores each task needs
}
  \item{m}{
Number of cores/servers for a HPC
}
  \item{method}{
Independent or concurrent
}
}
\value{
A dataset is returned, containing 'delay' as a vector of delays exhibited by
each task, 'total_cores' as the total busy CPUs in time of arrival of each task,
and 'workload' as total work left at each CPU.
}
\references{
E.V. Morozov, A.Rumyantsev. Stability analysis of a multiprocessor model describing
a high performance cluster. XXIX International Seminar on Stability Problems for Stochastic
Models and V International Workshop "Applied Problems in Theory of Probabilities and 
Mathematical Statistics related to modeling of information systems". Book of Abstracts. 2011. Pp. 82--83.
}
\author{
Alexander Rumyantsev (Institute of Applied Mathematical Research, Karelian Research Centre, RAS)
}
\examples{
Wld(T=rexp(1000,1), S=rexp(1000,1), round(runif(1000,1,10)), 10)
# returns the workload, delay and total cpus used 
# for a cluster with 10 CPUs and random exponential times
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~workload }
\keyword{ ~cluster }% __ONLY ONE__ keyword per line
