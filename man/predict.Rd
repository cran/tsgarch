% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{predict.tsgarch.estimate}
\alias{predict.tsgarch.estimate}
\alias{predict}
\title{Model Prediction}
\usage{
\method{predict}{tsgarch.estimate}(
  object,
  h = 1,
  newxreg = NULL,
  newvreg = NULL,
  nsim = 0,
  sim_method = c("parametric", "bootstrap"),
  block = 1,
  forc_dates = NULL,
  init_states = NULL,
  seed = NULL,
  ...
)
}
\arguments{
\item{object}{an object of class \dQuote{tsgarch.estimate}.}

\item{h}{the forecast horizon.}

\item{newxreg}{not currently used,}

\item{newvreg}{variance regressors rows equal to h. This can be either
a numeric or xts matrix. Only needed if the model was estimated with regressors in the
variance equation.}

\item{nsim}{the number of simulations to use for generating the simulated
predictive distribution. Defaults to zero (no simulated distribution).}

\item{sim_method}{the simulation method to use when \strong{nsim} great than zero. The \dQuote{parametric}
method samples from the model distribution whilst the \dQuote{bootstrap} from the standardized
model residuals.}

\item{block}{for the \dQuote{bootstrap} \strong{sim_method}, this allows to generate
block length samples (defaults to 1).}

\item{forc_dates}{an optional vector of forecast dates equal to h. If NULL will use the
implied periodicity of the data to generate a regular sequence of dates after the
last available date in the data.}

\item{init_states}{an optional vector of states to initialize the forecast.
If NULL, will use the last available state from the estimated model. This must
be equal to the max of the ARCH and GARCH terms.}

\item{seed}{an integer that will be used in a call to set.seed before simulating.}

\item{...}{additional arguments for future expansion options.}
}
\value{
A \dQuote{tsgarch.predict} object.
}
\description{
Prediction function for class \dQuote{tsgarch.estimate}.
}
\details{
The bootstrap method considered here, is based on re-sampling innovations
from the empirical distribution of the fitted GARCH model to generate future
realizations of the series and sigma. This only considers distributional uncertainty
and will not generate prediction intervals for the 1-step ahead sigma forecast
for which only the parameter uncertainty is relevant in GARCH type models (and
not currently implemented).
When the horizon \strong{h} is equal to 1, no simulation is performaed since there is
no uncertainty to account for.
}
\references{
\insertRef{Pascual2006}{tsgarch}
}
