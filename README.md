# MAGIC: Measurement-error adjusted marginal genetic correlation method
# Introduction
**MAGIC** is a method for evaluating trans-ethnic marginal correlation of associated SNPs. Suppose we have yielded a set of uncorrected associated SNPs for a trait and let the estimated marginal per-allele SNP effect size on the trait be &beta;. Because of the finite sample size, &beta; trends to be intrinsic to estimation error compared to the true effect size α. To account for this uncertainty, we model &beta; within the measurement error framework with a signal-noise model: &beta;=&alpha;+ε, where ε is the measurement error which also reflects the estimation error.

Based on this modeling, MAGIC aims to assess the trans-ethnic marginal correlation, r<sub>m</sub>=Cor(&alpha;<sub>i</sub>,&alpha;<sub>j</sub>), of SNP genetic effects of the same trait between populations i (e.g. EAS) and j (e.g. EUR). It needs to emphasize that Pearson’s correlation, κ=Cor(&beta;<sub>i</sub>,&beta;<sub>j</sub>), calculated without the modification of the estimation error, is often biased towards zero, resulting in |κ| ≤ |r<sub>m</sub>|. This bias is also well known as correlation attenuation. The sampling error and confidence interval of rm in MAGIC are evaluated the Bootstrap approaches. 

MAGIC is implemented in the R statistical environment.
# Required input data
MAGIC requires two types of input data:

SNP-level summary ststistics of two populations in terms of effect size and their standard error are required as inputs.

r0 means the correlation between &beta;<sub>i</sub> and &beta;<sub>j</sub> for a set of SNPs that are not associated with the trait in neither population. In practice, following previous work, we calculate r0 via null SNPs of the trait in both populations with p values larger than 0.01 for each protein coding gene and employ the average across all the genes.

1.Summary statistics, e.g.,
```ruby
               BETA.x      SE.x        BETA.y      SE.y
rs1000096      0.003636    0.004739    -0.0144     0.0018
rs10008104     0.003372    0.003579    0.0111      0.0018
rs1000940      0.008676    0.003615    0.0154      0.0018
...

```
The summary statistics file should be at least four columns (i.e. BETA.x, SE.x, BETA.y and SE.y). BETA.x is the effect size of SNPs in one population and SE.x is their standard error; BETA.y is the effect size of SNPs in the other population and SE.y is their standard error. Note that the names of four columns should be BETA.x, SE.x, BETA.y and SE.y).

2.r0, e.g.,
```ruby
r0=0.09833 #We calculate r0 via null SNPs of the trait in both populations with p values larger than 0.01 for each protein coding gene and employ the average across all the genes.
```
In practice, we calculate r0 via null SNPs of the trait in both populations with p values larger than 0.01 for each protein coding gene and employ the average across all the genes.

# Example
```ruby
source("MAGIC_function.R")
BMI <- read.table("BMI.txt",sep="\t",header=T)

MAGIC(BMI,r0=0.09833)
#Here, note that, the sampling error and confidence interval of rm are evaluated the Bootstrap approaches.

$rm
   m1       k           rm          r0            PB1         PB2         se_k        se_rm     
   968      0.81382     0.89119     0.09833       0.86438     0.91686     0.01265     0.01372           

#m1 is the number of the independent associated SNPs
#k is the Pearson’s correlation
#rm is the trans-ethnic genetic correlation
#r0 is the correlation for a set of SNPs that are not associated with the trait in neither population. In practice, following previous work, we calculate r0 via null SNPs of the trait in both populations with p values larger than 0.01 for each protein coding gene and employ the average across all the genes.
#PB1-PB2 is 95% confidence intervals
#se_k is the standard error of Pearson’s correlation
#se_rm is the standard error of trans-ethnic genetic correlation

```

# Cite
Haojie Lu<sup>$</sup>, Ting Wang<sup>$</sup>, Jinhui Zhang, Shuo Zhang, Shuiping Huang and Ping Zeng<sup>#</sup> (2021). Evaluating marginal genetic correlation of associated loci for complex diseases and traits between European and East Asian populations. Human Genetics, in press. [DOI: 10.1007/s00439-021-02299-8](https://link.springer.com/article/10.1007/s00439-021-02299-8)

# Contact
We are very grateful to any questions, comments, or bugs reports; and please contact [Ping Zeng](https://github.com/biostatpzeng) via zpstat@xzhmu.edu.cn.
