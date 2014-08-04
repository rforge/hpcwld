\name{DataToSWF}
\alias{DataToSWF}
\title{
Convertor from a dataframe to Standart Workload Format
}
\description{
Note that this is only a wrapper for the ToSWF command with a dataframe
argument. It needs a correctly built dataframe and converts it to a Standart Workload
Format used to share the logfiles of High Performance Clusters  
}
\usage{
DataToSWF(Frame, filename="output.swf") 
}
\arguments{
  \item{Frame}{
A dataframe containing the variables needed by ToSWF function.
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
\code{\link{FromSWF}},\code{\link{ToSWF}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(HPC_KRC)
tmp=data.frame(T=HPC_KRC$interarrival, S=HPC_KRC$service, N=HPC_KRC$cores_used, D=HPC_KRC$delay)
DataToSWF(tmp)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~standard }
\keyword{ ~workload }
\keyword{ ~format }% __ONLY ONE__ keyword per line
