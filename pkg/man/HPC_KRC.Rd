\name{HPC_KRC}
\alias{HPC_KRC}
\docType{data}
\title{
Workload data for High Performance Cluster of High Performance Data Center 
of Karelian Research Center, Russian Academy of Sciences. 
}
\description{
This is a complete data of the tasks which successfully finished executions
at HPC of HPDC KRC RAS for time period 06/03/2009 to 02/04/2011, a total of
8282 tasks. The data contains interarrival times, service times, cores that
tasks requested, cores really used (due to administrative limitations) and
delays excursed by tasks, all in seconds.  
}
\usage{data(HPC_KRC)}
\format{
  A data frame with 8281 observations on the following 5 variables.
  \describe{
    \item{\code{interarrival}}{a numeric vector}
    \item{\code{service}}{a numeric vector}
    \item{\code{cores_requested}}{a numeric vector}
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
data(HPC_KRC)
}
\keyword{datasets}
