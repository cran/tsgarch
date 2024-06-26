% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{tsfilter.tsgarch.estimate}
\alias{tsfilter.tsgarch.estimate}
\alias{tsfilter}
\alias{tsfilter.tsgarch.spec}
\title{Model Filtering}
\usage{
\method{tsfilter}{tsgarch.estimate}(object, y = NULL, newxreg = NULL, newvreg = NULL, ...)

\method{tsfilter}{tsgarch.spec}(object, y = NULL, newxreg = NULL, newvreg = NULL, ...)
}
\arguments{
\item{object}{an object of class \dQuote{tsgarch.estimate} or \dQuote{tsgarch.spec}.}

\item{y}{an xts vector of new values to filter. Can also be NULL in which case the}

\item{newxreg}{not currently used,}

\item{newvreg}{variance regressors with the same number of rows as y. This can be either
a numeric or xts matrix. Only needed if the model was estimated with regressors in the
variance equation.}

\item{...}{additional arguments for future expansion.}
}
\value{
A \dQuote{tsgarch.estimate} object with updated information.
}
\description{
Filters new data based on an already estimated model or filters data
based on a specification object.
}
\details{
The method filters new data and updates the object with this new information
so that it can be called recursively as new data arrives. It is also possible to use
a specification object with fixed parameters, by appropriately setting the values
of the \dQuote{parmatrix} object in the specification slot. In this case, the returned object
will also be of classs \dQuote{tsgarch.estimate}.
If an object of \dQuote{tsgarch.spec} is used with y not NULL, then the method will
first filter the values of the data in the object, generating an object of
\dQuote{tsgarch.estimate} and then call the method again on this new object and the
new y values (and optionally any newvreg values). In this way, using either object
classes will return the exact same results. The timestamp indices of y must be
strictly greater than the maximum timestamp index of the data within the object (i.e.
we only filter on new data).
}
