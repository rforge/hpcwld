\name{HPC_KRC2}
\alias{HPC_KRC2}
\docType{data}
\title{
Workload data for High Performance Cluster of High Performance Data Center 
of Karelian Research Center, Russian Academy of Sciences. 
}
\description{
This is a complete data of the tasks which successfully finished executions
at HPC of HPDC KRC RAS for time period 02/04/2011 to 16/04/2012, a total of
9389 tasks. The data contains interarrival times, service times, cores that
tasks used, and delays excursed by tasks, all in seconds.  
}
\usage{data(HPC_KRC2)}
\format{
  A data frame with 9389 observations on the following 3 variables.
  \describe{
    \item{\code{interarrival}}{a numeric vector}
    \item{\code{service}}{a numeric vector}
    \item{\code{cores_used}}{a numeric vector}
    \item{\code{delays}}{a numeric vector}
  }
}
\source{
http://cluster.krc.karelia.ru
}
\references{
http://cluster.krc.karelia.ru
}
\examples{
data(HPC_KRC2)
}
\keyword{datasets}
