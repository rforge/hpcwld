\name{hpcwld-package}
\alias{hpcwld-package}
\alias{hpcwld}
\docType{package}
\title{
Model and data for High Performance Cluster workload
}
\description{
This package contains several models describing the behavior of workload 
	and queue on a High Performance Cluster and computing GRID under FIFO 
	service discipline basing on modified Kiefer-Wolfowitz recursion. 
	Also sample data for inter-arrival times, service times, number of 
	cores per task and waiting times of HPC of Karelian Research Centre 
	are included, measurements took place from 06/03/2009 to 02/30/2011.
	The stability condition of the model can be verified either exactly,
	or approximately.
}
\details{
\tabular{ll}{
Package: \tab hpcwld\cr
Type: \tab Package\cr
Version: \tab 0.5\cr
Date: \tab 2015-02-14\cr
License: \tab GNU GPL\cr
LazyLoad: \tab yes\cr
}
}
\author{
Alexander Rumyantsev (Institute of Applied Mathematical Research, Karelian Research Centre, RAS)
}
\references{
E.V. Morozov, A.Rumyantsev. Stability analysis of a multiprocessor model describing
a high performance cluster. XXIX International Seminar on Stability Problems for Stochastic
Models and V International Workshop "Applied Problems in Theory of Probabilities and 
Mathematical Statistics related to modeling of information systems". Book of Abstracts. 2011. Pp. 82--83.

A. Rumyantsev. Simulating Supercomputer Workload with hpcwld package for R 
// Proceedings of 2014 15th International Conference on Parallel and Distributed Computing, 
Applications and Technologies. IEEE, 2014. P. 138-143. URL: http://conferences.computer.org/pdcat/2014/papers/8334a138.pdf

A. Rumyantsev. Evaluating the stability of supercomputer workload model 
// Journal on Selected Topics in Nano Electronics and Computing, Vol. 2, No. 2, December 2014. P. 36-39.

\url{http://cluster.krc.karelia.ru}
}
\keyword{ package }
\examples{
Wld(T=rexp(1000,1), S=rexp(1000,1), round(runif(1000,1,10)), 10)
# returns the workload, delay and total cpus used 
# for a cluster with 10 CPUs and random exponential times
}
