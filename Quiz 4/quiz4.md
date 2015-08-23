# Quiz 4

Muralidhar Areti  
Aug 2, 2015


Q1  
A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)
Subject    Baseline	Week 2
1	140	132
2	138	135
3	150	151
4	148	146
5	135	130
Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test.

(Hint, consider that the observations are paired.)

```r
data = data.frame(
    baseline = c(140, 138, 150, 148, 135)
    , week2 = c(132, 135, 151, 146, 130)
    )

t.test(data$baseline, data$week2, alternative="two.sided", paired = TRUE)
```

```
## 
## 	Paired t-test
## 
## data:  data$baseline and data$week2
## t = 2.2616, df = 4, p-value = 0.08652
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.7739122  7.5739122
## sample estimates:
## mean of the differences 
##                     3.4
```

Q2  
A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of μ0 that a test of H0:μ=μ0 would fail to reject the null hypothesis in a two sided 5% Students t-test?

```r
n = 9
mu = 1100
sd = 30
alpha = 0.05

t = qt(1 - alpha/2, n-1)
mu + c(-1,1) * t * sd / sqrt(n)
```

```
## [1] 1076.94 1123.06
```

Q3  
Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

```r
library(stats)
binom.test( x = 3, n = 4, p = 0.5, alt = "greater" )
```

```
## 
## 	Exact binomial test
## 
## data:  3 and 4
## number of successes = 3, number of trials = 4, p-value = 0.3125
## alternative hypothesis: true probability of success is greater than 0.5
## 95 percent confidence interval:
##  0.2486046 1.0000000
## sample estimates:
## probability of success 
##                   0.75
```

Q4  
Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?

```r
p = 1/100
n = 1787
px = 10/n

serror = sqrt(p * (1-p) / n)
z = (p - px) / serror

pnorm(z, lower.tail = FALSE)
```

```
## [1] 0.03066625
```

Q5  
Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, give a pvalue for a two sided t test.

```r
n1 = 9
n2 = 9
df = n1 + n2 - 2
treatment_mean = -3
placebo_mean = 1
treatment_sd = 1.5
placebo_sd = 1.8

pooled_var = (treatment_sd^2 * n1 + placebo_sd^2 * n2) / df
se_diff = sqrt(pooled_var/n1 + pooled_var/n2)

tstat = (treatment_mean - placebo_mean) / se_diff
tstat
```

```
## [1] -4.828573
```

```r
pvalue = 2 * pt(tstat, df = df)
pvalue
```

```
## [1] 0.0001852248
```

Q6  
Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0:μ=1,078?

```r
# No calculation is needed. We wouldn't reject because the 95% CI contains
# the 90% CI. µ = 1078 falls within the interval, so we don't reject H0.
```

Q7  
Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm^3^. Assume that the standard deviation of four year volume loss in this population is .04 mm^3^. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?

```r
n = 100
mu = 0.1 
sd = 0.4

power.t.test(n, delta=mu, sd=sd, type="one.sample", alt="one.sided")$power
```

```
## [1] 0.7989855
```

Q8  
Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm^3^. Assume that the standard deviation of four year volume loss in this population is .04 mm^3^. About what would be the value of n needded for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?

```r
power = 0.9
power.t.test(power=power, delta=mu, sd=sd, type="one.sample", alt="one.sided")$n
```

```
## [1] 138.3856
```

Q9  
As you increase the type one error rate, α, what happens to power?

```r
# As you increase the type one error rate, α, or use one-sided test instead of two-sided test,
# or increase n, power will get larger.
```

end of file
