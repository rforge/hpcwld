\name{DMC}
\alias{DMC}
\title{
Distributional Measure of Correlation
}
\description{
This is a suggested by Dror Feitelson measure of correlation for dependent
variables, that may be successfully used to examine the datasets from a
High Performance Cluster logs    
}
\usage{
DMC(X, Y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
First variable (vector)
}
  \item{Y}{
Second variable (vector)
}
}
\value{
One value between -1 and 1, characterizing the dependence between the variables  
}
\references{
\url{http://interstat.statjournals.net/YEAR/2004/abstracts/0412001.php?Name=412001}
}
\author{
Alexander Rumyantsev (Institute of Applied Mathematical Research, Karelian Research Centre, RAS)
}
\examples{
data(HPC_KRC)
DMC(HPC_KRC$service[1:1000], HPC_KRC$cores_requested[1:1000])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~correlation }
\keyword{ ~cluster }% __ONLY ONE__ keyword per line
