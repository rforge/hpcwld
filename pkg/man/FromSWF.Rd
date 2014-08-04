\name{FromSWF}
\alias{FromSWF}
\title{
Convertor to a dataset from a Standart Workload Format
}
\description{
This is a convertor from a Standart Workload Format
(used to share the logfiles of High Performance Clusters) 
to an internally used in a package dataset format  
}
\usage{
FromSWF(filename)
}
\arguments{
  \item{filename}{
A mandatory field containing the path to SWF file
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
A dataset is returned, containing 'delay' as a vector of delays exhibited by
each task, 'total_cores' as the total busy CPUs in time of arrival of each task,
and 'workload' as total work left at each CPU.
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
\code{\link{ToSWF}},\code{\link{DataToSWF}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~standard }
\keyword{ ~workload }
\keyword{ ~format }% __ONLY ONE__ keyword per line
