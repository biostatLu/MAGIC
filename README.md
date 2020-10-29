# MAGIC: Measurement-error adjusted local genetic correlation method
# Introduction
MAGIC is a method for evaluating trans-ethnic genetic correlation of associated SNPs. Suppose we have yielded a set of uncorrected associated SNPs for a trait and let the estimated SNP marginal effect size on the trait be &beta;. Because of the finite sample size, &beta; trends to be intrinsic to estimation error compared to the true effect size α. To account for this uncertainty, we model &beta; within the measurement error framework with a signal-noise model: &beta;=&alpha;+ε, where ε is the measurement error which also reflects the estimation error.

Based on this modeling, MAGIC aims to assess the trans-ethnic genetic correlation, r~g=Cor(&alpha;~i,&alpha;~j), of SNP genetic effects of the same trait between populations i (e.g. EAS) and j (e.g. EUR). It needs to emphasize that Pearson’s correlation, k=Cor(&beta;i,&beta;j), calculated without the modification of the estimation error, is often biased towards zero, resulting in |κ| ≤ |rg|. This bias is also well known as correlation attenuation. The sampling error and confidence interval of rg in MAGIC are evaluated the Bootstrap approaches. As MAGIC only relies on a set of associated genetic variants, rg can be thus viewed as a local genetic correlation with respect to its global counterpart ρg that can be estimated with the popcorn method.

MAGIC is implemented in R statistical environment.
# Example





