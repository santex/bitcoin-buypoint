\name{initPortf}
\alias{initPortf}
\title{Initializes a portfolio object.}
\usage{
  initPortf(name = "default", symbols, initPosQty = 0,
  initDate = "1950-01-01", currency = "USD", ...)
}
\arguments{
  \item{name}{A name for the resulting portfolio object}

  \item{symbols}{A list of instrument identifiers for those
  instruments contained in the portfolio}

  \item{initPosQty}{Initial position quantity, default is
  zero}

  \item{initDate}{A date prior to the first close price
  given, used to contain initial account equity and initial
  position}

  \item{currency}{ISO currency identifier used to locate
  the portfolio currency}

  \item{\dots}{any other passthrough parameters}
}
\description{
  Constructs and initializes a portfolio object, which is
  used to contain transactions, positions, and aggregate
  level values.
}
\details{
  Initializes a portfolio object, which is constructed from
  the following: $symbols: the identifier used for each
  instrument contained in the portfolio. Use
  \code{names(Portfolio$symbols)} to get a list of symbols.
  $symbols$[symbol]$txn: irregular xts object of
  transactions data $symbols$[symbol]$posPL: regular xts
  object of positions P&L calculated from transactions
  $symbols$[symbol]$posPL.ccy: regular xts object of
  positions P&L converted to portfolio currency $summary:
  aggregated portfolio values

  Each symbol has three associated tables.  The first, txn,
  is the transactions table, an irregular time series that
  contains information about trades or other position
  adjustments with the following columns: \itemize{ \item
  Txn.Qty: the quantity, usually in units of contracts,
  changing hands. Positive values indicate a "buy"
  transaction; negative values are used to indicate a
  "sell." \item Txn.Price: the price at which the
  transaction was made, \item Txn.Fees: the sum total of
  transaction fees associated with the trade, \item
  Txn.Value: the notional value of the transaction, \item
  Avg.Txn.Cost: a calculated value for the average net
  price paid (received) per contract bought (received),
  \item Pos.Qty: the resulting position quantity of
  contracts, calculated as the sum of the current
  transaction and the prior position, \item Pos.Avg.Cost:
  the calculated average cost of the resulting position,
  and \item Realized.PL: any prot or loss realized in the
  transaction from closing out a prior position }

  The second, posPL, is a container used to store
  calculated P&L values from transactions and close prices
  within an instrument. The data series is, however, a
  regular time series. Columns of the table include:
  \itemize{ \item Pos.Qty the quantity of the position held
  in the symbol, \item Pos.Value the notional value of the
  position, \item Txn.Value the net value of the
  transactions occuring, \item Txn.Fees the total fees
  associated with transactions, \item Realized.PL any net
  prot or loss realized through transactions, \item
  Unrealized.PL any prot or loss associated with the
  remaining or open position, and \item Trading.PL the sum
  of net realized and unrealized prot and loss. }

  The third, posPL.ccy, is the same as the second but
  translated into the portfolio currency.

  For each portfolio, the summary slot contains a table
  that tracks calculated portfolio information through
  time. The table contains the following columns, held in a
  regular xts time series: \itemize{ \item Long.Value: The
  sum of the notional value of all positions held long in
  the portfolio. \item Short.Value: The sum of the notional
  value of all positions held short in the portfolio. \item
  Net.Value: The sum of the notional long and notional
  short value of the portfolio. \item Gross.Value: The sum
  of the notional long and absolute value of the notional
  short value of the portfolio. \item Txn.Fees: The sum of
  brokerage commissions, exchange and other brokerage fees
  paid by the portfolio during the period. \item
  Realized.PL: The sum of net realized prots or losses
  aggregated from the underlying positions in the
  portfolio. Gross realized prots can be calculated by
  adding Txn.Fees, the brokerage commission expenses for
  the period. \item Unrealized.PL: The sum total increase
  or decrease in unrealized profits or losses on open
  positions in the portfolio at the end of the period.
  \item Net.Trading.PL: Net realized prot or loss plus
  interest income plus change in unrealized prot or loss
  across all positions in the portfolio. } TODO: add
  $account: name of the (one) affiliated account Outputs
  Initialized portfolio structure with a start date and
  initial positions.
}
\author{
  Peter Carl
}

