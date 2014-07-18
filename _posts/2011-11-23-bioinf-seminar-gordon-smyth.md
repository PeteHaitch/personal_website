---
author: Peter Hickey
comments: true
date: 2011-11-23 09:54:27+00:00
layout: post
title: "Variance models for RNA-seq"
presenter:
  name: "Prof Gordon Smyth"
  website: "http://www.statsci.org/smyth/"
category: blog
tags: [WEHI Bioinformatics seminar, RNA-seq]

---

# Update (21/02/2014)
The `voom` method has now been [published in Genome Biology](http://genomebiology.com/2014/15/2/R29/abstract)

# Original post

[Gordon Smyth](http://www.wehi.edu.au/faculty_members/professor_gordon_smyth) is well known for his development of the [`limma` Bioconductor package](http://www.bioconductor.org/packages/release/bioc/html/limma.html) for the analysis of differential gene expression using microarrays. More recently his group has led the way in the development of software for the statistical analysis of gene expression using RNA-seq with the [`edgeR` Bioconductor package](http://bioconductor.org/packages/release/bioc/html/edgeR.html) and the `voom()` method in `limma`. Today, Gordon spoke about modeling the variance in RNA-seq data for studying gene expression, in particular using the `voom()` method, and contrasted this approach with that taken by `edgeR` (and other Poisson/Negative binomial-like methods).

## Mean-variance relationship is basically quadratic for RNA-seq counts

Gordon started by showing that the observed variance in RNA-seq experiments is comprised of two components - biological variance (i.e. the interesting stuff) and technical variance (e.g. measurement error). By comparing two biologically identical, but separately sequenced samples, Gordon showed that the technical variation is very well modelled by Poisson variation. However, the variation observed between two different biological  samples is greater than Poisson variation; in statistical terminology the biological variation displays _overdispersion_.

There have been repeated (and misguided) claims in the literature that RNA-seq allows experiments to be performed without biological replicates. I think the reasons why this misguided notion is appealing is because RNA-seq promises to provide more _precise_ estimates of gene expression than was possible with microarrays and that is interpreted as "more precise measurements means less replicates required". This simply isn't true - the technical variation may be less in RNA-seq compared to microarrays (debatable) but the large biological variation between samples still remains. This is why it is __essential__ to have biological replicates in order to derive robust inferences from the data.

The overdispersion of the variance is observed as a quadratic mean-variance relationship, as opposed to the linear mean-variance relationship implicit in a Poisson model. All the data analysed by Gordon's group clearly displays a quadratic mean-variance structure, reinforcing that methods based on a Poisson model will not suffice. This led to the development of the negative binomial model used by `edgeR` (similar models of the variance are used by `DESeq` and others).

The overdispersion parameter for gene $$ g $$, $$ \varphi_g $$, must be estimated from the data and there are several ways to do this. Once $$ \varphi_g $$ is estimated the data can be modelled using a generalised linear model (more specifically, a log linear model). One estimator of $$ \varphi_g $$ is the so-called common dispersion model where each gene has the same dispersion value $$ \varphi_g := \varphi $$. A second estimator uses empirical Bayesian methods to "squeeze" the gene wise $$ \varphi_g $$ towards the common value $$ \varphi $$. This sort of "squeezing" is necessary for the small sample sizes common to RNA-seq experiments. A third estimator is the _trend_ estimator employed in `DESeq`. The estimation of the dispersion parameter, and which estimator to use, is a field of ongoing research.

## Modelling the variation is more important than getting the distribution right

The `edgeR` work emphasised the development of _exact conditional tests_ based on the negative binomial distribution. Gordon noted that he now considers this less important than doing a good job of the mean-variance relationship. The `voom()` method is being developed to use this alternate angle to tackle differential gene expression analysis from RNA-seq data.

The read counts of gene $$ g $$ in sample $$ i $$, $$ y_{gi} $$,  do not follow a Normal distribution, however ,the transformed response variable $$ log(y_{gi} + 0.5) $$ converges quickly to normality. `voom()` models the log counts per million and fits a loess trend line to the scatterplot of variance vs. mean to create weights that are then fed into a standard `limma` analysis.

The variance model is at the observation level and the loess trend is robust against highly variable genes. Gordon presented the results of a simulation study where `voom()` bettered `edgeR`, `DESeq` and several other popular RNA-seq analysis methods. Of course, authors always display simulation results that favour their method, but it seemed like the simulation parameters were designed to favour the negative binomial-based models, such as `edgeR`, so I found the simulation results quite interesting.

## Gene-specific variation must be accounted for in the model

The idea of gene-specific variances has long been accepted in the microarray world, but is still not widely accepted for the analysis of RNA-seq data. Gordon presented several plots showing that _tagwise_ estimates of dispersion had better goodness of fit statistics than either the common or trend estimates of dispersion.

In short, __gene-specific variance exists and must be accounted for in the analysis__.

## Conclusions

To conclude, Gordon summarised the pros and cons of `edgeR` and `voom()`.

### `edgeR`

#### Pros

* Fits an intuitive model
* The biological coefficient of variation (the biological variance divided by the mean expression) is interpretable
* Excellent statistical power

#### Cons

* It treats the dispersion as known (once estimated) and so can be a little liberal
* Can't estimate the optimal prior weight (the prior weight is used in the empirical Bayes shrinking of the dispersion estimates)
* Computationally challenging to program (e.g. fitting ~30,000 GLMs, one per gene)


### `voom()`

#### Pros

* More agnostic to the mean-variance relationship
* A seemingly natural although somewhat ad-hoc fold change shrinkage
* Easily estimates the prior weight
* Holds its size since it tracks the uncertainty of the empirical Bayes estimates throughout the model
* Feeds into many existing `limma` tools
* Wins all comparisons with other methods so far...

#### Cons

* Still determining...
