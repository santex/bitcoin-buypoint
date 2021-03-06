\name{PortfReturns}
\alias{PortfReturns}
\title{Calculate portfolio instrument returns}
\usage{
  PortfReturns(Account, method = c("contribution"), ...,
  Dates = NULL, Portfolios = NULL)
}
\arguments{
  \item{Account}{string name of the account to generate
  returns for}

  \item{method}{for now, only 'contribution' is supported}

  \item{\dots}{any other passthru parameters (like
  \code{native} for \code{.getBySymbol}}

  \item{Dates}{xts style ISO 8601 date subset to retrieve,
  default NULL (all dates)}

  \item{Portfolios}{concatenated string vector for
  portfolio names to retrieve returns on, default NULL (all
  portfolios)}
}
\description{
  This function (for now) calculates return on initial
  equity for each instrument in the portfolio or portfolios
  that make up an account.  These columns will be additive
  to return on capital of each portfolio, or of the entire
  account.
}
\details{
  This function exists because of R/Finance community
  requests by Mark Breman and Thomas Bolton
}
\note{
  TODO handle portfolio and account in different currencies
  (not hard, just not done)

  TODO explicitly handle portfolio weights

  TODO provide additional methods of calculating returns

  TODO support additions and withdrawals to available
  capital
}

