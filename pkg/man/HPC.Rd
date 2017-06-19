\name{HPC}
\alias{HPC}
\title{
Simulator of a High Performance Cluster model
}
\description{
TBA
}
\usage{
HPC(T, S, N, m, method = "concurrent")
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
TBA
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
TBA
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~workload }
\keyword{ ~cluster }% __ONLY ONE__ keyword per line
