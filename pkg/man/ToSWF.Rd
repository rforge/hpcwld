\name{ToSWF}
\alias{ToSWF}
\title{
Convertor from a dataset to Standart Workload Format
}
\description{
This is a convertor from a correctly built dataset to a Standart Workload
Format used to share the logfiles of High Performance Clusters  
}
\usage{
ToSWF(T, S, N, D, filename="output.swf") 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{T}{
Interarrival times of tasks (a vector)
}
  \item{S}{
Service times of tasks (a vector)
}
  \item{N}{
Number of cores each task needs (a vector)
}
  \item{D}{
The delays of tasks in a queue (a vector)
}
  \item{filename}{
The file to store the converted workload (output.swf by default)
}
}
\details{
The Standart Workload Format is a single format to store and exchange
high performance cluster logs, that is used in Parallel Workload Archive.
See references for current standard. The SWF format may contain additional
data, but in this package only the 1st to 5th fields are used. One may also
need to manually fill in the header of the file in order to completely
prepare the resulting SWF file.  
}
\value{
Nothing is returned, but a file is created in the current working directory
(with default name output.swf) containing the converted data.
}
\references{
Feitelson, D.G. and Tsafrir, D. and Krakov D. 2012 Experience with the Parallel Workloads Archive.
Technical Report 2012-6, School of Computer Science and Engineering, the Hebrew University April, 2012, Jerusalem, Israel

\url{http://www.cs.huji.ac.il/labs/parallel/workload/swf.html}
}
\author{
Alexander Rumyantsev (Institute of Applied Mathematical Research, Karelian Research Centre, RAS)
}
\seealso{
\code{\link{FromSWF}},\code{\link{DataToSWF}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(HPC_KRC)
ToSWF(HPC_KRC$interarrival, HPC_KRC$service, HPC_KRC$cores_requested, HPC_KRC$delay)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~standard }
\keyword{ ~workload }
\keyword{ ~format }% __ONLY ONE__ keyword per line
