\name{ergod.test.lsd}
\alias{ergod.test.lsd}
\title{
Stationarity and ergodicity tests
}
\description{
Perform a set of stationarity and ergodicity tests useful for simulation model data. The included tests are: Augmented Dickey-Fuller test (ADF), Phillips-Perron test (PP),  Kwiatkowski-Phillips-Schmidt-Shin test (KPSS), Brock-Dechert-Scheinkman test (BDS), Kolmogorov-Smirnov k-sample test (KS), Anderson-Darling k-sample test (AD) and Wald-Wolfowitz k-sample test (WW).
}
\usage{
ergod.test.lsd( data, vars, start.period = 0, signif = 0.05,
                digits = 2, ad.method = "asymptotic" )
}
\arguments{
  \item{data}{
a three-dimensional array, as the ones produced by \code{\link[LSDinterface]{read.3d.lsd}}, organized as (time steps x variables x Monte Carlo instances).
}
  \item{vars}{
a vector of the variable names (as strings) contained in \code{data} for which the tests will be performed.
}
  \item{start.period}{
integer: the first time step in \code{data} to be considered for the tests. The default value is 0 (all time steps considered).
}
  \item{signif}{
numeric in [0, 1]: statistical significance to evaluate the tests rejection of the null-hyphotesis. The default value is 0.05 (5\%).
}
  \item{digits}{
integer: the number of significant digits to show in results. The default is 2.
}
  \item{ad.method}{
a string in \code{c("asymptotic", "simulated", "exact")} defining the methods to be used by \code{\link[kSamples]{ad.test}}. The default is \code{"asymptotic"}.
}
}
\details{
This function is a wrapper to the functions \code{\link[tseries]{adf.test}}, \code{\link[tseries]{kpss.test}} and \code{\link[tseries]{bds.test}} in \code{tseries} package, \code{\link[stats]{PP.test}} and \code{\link[stats]{ks.test}} in \code{\link[stats]{stats-package}} and \code{\link[kSamples]{ad.test}} in \code{\link[kSamples]{kSamples-package}}.
}
\value{
The function returns a data frame presenting both the average test statistics and the frequency of test null-hyphotesis rejections for all the variables selected in \code{vars}.
}
\author{
\packageAuthor{LSDsensitivity}
}
\seealso{
\code{\link[LSDinterface]{read.3d.lsd}}

\code{\link[tseries]{adf.test}}, \code{\link[tseries]{kpss.test}}, \code{\link[tseries]{bds.test}},

\code{\link[stats]{PP.test}}, \code{\link[stats]{ks.test}} in \code{\link[stats]{stats-package}},

\code{\link[kSamples]{ad.test}} in \code{\link[kSamples]{kSamples-package}}
}
\examples{
# Examples require the data files produced by LSD, please check the package
# notes and LSD documentation on how to generate you simulation results files

# Steps to use this function:
# 1. load data from a LSD simulation saved results using a read.xxx.lsd
#    function from LSDinterface package (read.3d.lsd, for instance)
# 2. use ergod.test.lsd to apply the tests on the relevant variables,
#    replacing "var1", "var2" etc. with your data

\donttest{
# read data from 3 Monte Carlo runs
library( LSDinterface )
dataSet <- read.3d.lsd( c( "Sim1_1.res", "Sim1_2.res", "Sim1_3.res" ) )

tests <- ergod.test.lsd( dataSet,              # the data set to use
                         c( "var1", "var2" ),  # the variables to test
                         signif = 0.01,        # use 1\% significance
                         digits = 4 )          # show results using 4 digits

print( tests )
}
}
\keyword{ models }
\keyword{ htest }
