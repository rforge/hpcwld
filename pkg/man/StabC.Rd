\name{StabC}
\alias{StabC}
\title{
Stability constant for a workload of a High Performance Cluster model
}
\description{
This function calculates the constant C that is used in the stability relation
of a model, which is basically the following: lambda/mu<C, where lambda
is the intensity of task arrivals, and mu is the intensity of service,
in this case it is 1/(mean service time). The constant depends only on
the number of cores in the model and the distribution of core requirement
of tasks. Note that there are three methods of calculation: two of them
calculate the exact value ("less-memory" and "more-memory"), and the third
one ("monte-carlo") returns the approximate value. The exact value may
be calculated up to a number of cores of the order of 100. The constant
is valid only for the model with simultaneous task service by cores.
}
\usage{
StabC(s, p, maxiter=10000, method = "monte-carlo")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{s}{
number of cores/servers for a HPC
}
  \item{p}{
the distribution of number of cores required by a task, a vector with values for probability of a task requiring 1..s cores
}
  \item{maxiter}{
number of iterations for Monte-Carlo method
}
  \item{method}{
monte-carlo, less-memory, more-memory (approximately 1.5 times faster, but needs more memory)
}
}
\value{
The value of a constant C in the relation lambda/mu < C is returned
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
StabC(s=2,p=c(.5,.5), method="less-memory")
# returns the constant for a 2-server model, 
# where a task needs 1 or 2 cores with equal probability
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~stability }
\keyword{ ~cluster }% __ONLY ONE__ keyword per line
