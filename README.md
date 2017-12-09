# asymmetric_common_value_auctions
Code accompanying paper "Information Asymmetries in Common Value Auctions with Discrete Signals"

# Description of files

## Core functions

### Core equilibrium computation and utility calculation
- equilibrium.m: the main algorithm for computing a representation of the equilibrium in an asymmetric
  common value auction, based on the recurrence relation and the two pass algorithm of the paper
- calculate\_all\_utilities.m: takes as input the representation of the equilibrium and calculates
  the expected utility of each of the two players conditional on any signal
    * calculate\_utililty.m: calculates the expected utility of some player conditional on some signal
- expected\_utilities.m: simply calls the equilibrium and the calculate utilities functions to return 
  the expected utilities for some input signal and prior setting.
- single\_general\_instance.m: solves the equilibrium of a single instance and then plots the equilibrium
  CDFs of the two bidders
- plot\_all\_cdfs.m: plot the equilibrium cdfs associated with an equilibrium representation computed by 
  the algorithm
    * plot\_cdf.m: plot the cdf of some bidder conditional on some signal

### Related to information acquisition
- utilities\_of\_all\_outcomes.m: computes the equilibrium expected utilities for all possible outcomes
  of a selling process of an extra signal, i.e. of Y gets the signal, if Z gets the signal, if both get
  it and if none gets it.

## Example calls of the core functions

### Equilibrium calculation for single instances
- main.m: several examples of calling the core functions so as to plot the equilibrium bid strategies

### Equilibrium utilities as a function of the prior
- binary\_symmetric.m: both players have binary signals. Swipe over some parameter range and plot utilities
  as a function of the prior. 
- binary\_symmetric\_single\_instance.m: for the binary signal case for a single instance of the parameters
  plot the utilities as a function of the prior.
- many\_value\_signals.m: one player is completely informed, the other player gets an almost continuous
  signal

### Information acquisition related examples
- compare\_outcomes\_for\_all\_priors.m: for fixed signals of the two bidders and for a fixed extra available
  signal, what are the equilibrium utilities of the players as a function of the prior probability of V=1?
- compare_outcomes.m: swipe over all possible signal qualities of two symmetric bidders, all signal
  qualities of an extra signal, and all priors of V=1, and check whether it is optimal to sell exclusively
  the signal exclusively to one bidder (i.e. selling exclusively generates higher sum of utilities than
  all other outcomes)
