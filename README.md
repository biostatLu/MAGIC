# MAGIC: Measurement-error adjusted local genetic correlation method
# Introduction
MAGIC is a method for evaluating trans-ethnic genetic correlation of associated SNPs. Suppose we have yielded a set of uncorrected associated SNPs for a trait and let the estimated SNP marginal effect size on the trait be &beta;. Because of the finite sample size, &beta; trends to be intrinsic to estimation error compared to the true effect size α. To account for this uncertainty, we model &beta; within the measurement error framework with a signal-noise model: &beta;=&alpha;+ε, where ε is the measurement error which also reflects the estimation error.

Based on this modeling, MAGIC aims to assess the trans-ethnic genetic correlation, r<sub>g</sub>=Cor(&alpha;<sub>i</sub>,&alpha;<sub>j</sub>), of SNP genetic effects of the same trait between populations i (e.g. EAS) and j (e.g. EUR). It needs to emphasize that Pearson’s correlation, κ=Cor(&beta;<sub>i</sub>,&beta;<sub>j</sub>), calculated without the modification of the estimation error, is often biased towards zero, resulting in |κ| ≤ |r<sub>g</sub>|. This bias is also well known as correlation attenuation. The sampling error and confidence interval of rg in MAGIC are evaluated the Bootstrap approaches. As MAGIC only relies on a set of associated genetic variants, r<sub>g</sub> can be thus viewed as a local genetic correlation with respect to its global counterpart ρ<sub>g</sub> that can be estimated with the popcorn method.

MAGIC is implemented in R statistical environment.
# Required input data
MAGIC requires two types of input data:

SNP-level summary ststistics of two populations in terms of effect size and their standard error as inputs.




# Example
```ruby
source("MAGIC_function.R")
BMI <- read.table("BMI.txt",sep=""),head=T)

MAGIC(BMI,r0=0.5,r01=0.5)

$rg
   m1       k           rg_mean     rg_median     r0_mean     r0_median     BCa1       BCa2        PB1         PB2         se_k        se_rg_mean     se_rg_median
   968      0.81382     0.86679     0.86679       0.5         0.5           0.8203     0.86245     0.84141     0.89332     0.01264     0.0132         0.0132



```

