---
title: Understanding cancer neochromosome formation through integrated analysis of
  fusion and copy number data
author: Peter Hickey
date: '2011-11-15'
slug: bioinf-seminar-vincent-corbin
categories:
  - seminar
tags: []
header:
  caption: ''
  image: ''
---

# Neochromosomes

Neochromosomes (NCs) are "extra" chromosomes that are found in around 3% of 
tumour genomes. They are a hallmark of liposarcoma, which is a cancer of the 
fat cells studied by the 
[Papenfuss lab](https://www.wehi.edu.au/faculty_members/dr_tony_papenfuss) at 
WEHI in conjunction with colleagues at the Peter MacCallum Cancer Centre. 
_Circular chromosomes_ and _giant rod chromosomes_ are both examples of NCs and 
are comprised of multiple donor segments from other regions of the region that 
are frequently highly amplified.

Until now, NCs have only been studied with low resolution technologies such as 
**F**luorescence **I**n **S**itu **H**ybridisation (**FISH**) and microarrays. 
The Papenfuss lab have been studying a cell-line derived from a patient with 
liposarcoma. The DNA was flow-sorted to enrich for the NCs (which is larger 
than the regular chromosomes) and then sequenced using the Illumina HiSeq and 
GAIIx.

# Data

They generated 300 million reads across multiple sequencing runs that were 
aligned against the human reference genome. Dr Arthur Hsu, a post-doc in the 
Papenfuss lab, has been studying the sequence to estimate breakpoints in the 
neochromosome (breakpoints occur where two derived contiguous sequences are 
joined in the neochromosome) and Vincent has been using the data to estimate 
copy number variation (CNV).

The data reveals that the amplified regions of the NC contain known drivers of liposarcoma tumours. Most chromosomes contribute material to the NC and most of 
these regions are highly amplified (16x-32x), with the exception of regions 
comprising the telomere and centromere of the NC. This appears as small, highly 
amplified _islands_ in plots of copy number for each contributing chromosome. 
There is strong evidence that chromosome 12 was the origin of the NC and that 
extra material was acquired later in development. 

The breakpoints can be classified as edge-to-edge, edge-to-interval and 
interval-to-interval. Interestingly, the copy number ratio does not vary across 
edge-to-edge boundaries. All of this suggests a breakage-fusion-bridge (BFB) 
model may be appropriate for the development of the NC or, perhaps more 
plausibly, _chromothripsis_ (chromosome shattering, followed by the cell trying 
to rejoin the pieces but inevitably in the wrong order). 

# Model

Vincent is working on a mathematical model for the BFB model and simulating 
observations from the model to compare against the data. He presented three 
models for the breakpoint process:

1. Uniform
2. Small duplications/deletions
3. Large duplications/deletions.

Vincent's simulation results from the small duplications/deletions model 
closely resembled the data. There were four main criteria he used to compare 
the models against the data.

1. This model generated small, highly amplified _islands_ as seen in the data.
2. The density plot of CN distribution in the data reveals the distribution is multi-modal with the two strongest peaks at 16x and 32x. However, none of the density plots from any of the three breakpoint models resemble the data.
3. The 1:1 CN ratio across edge-to-edge breakpoints is captured by all three models, but Vincent suggested this is an artefact of the simulation process rather than evidence of a good model.
4. A [Circos](http://circos.ca/) plot of the inter-chromosomal re-arrangements. The uniform model performed better than the small duplications/deletions model.

# Summary

In summary, all features of the data can be captured by the models but no one 
model can capture all features simultaneously. The large duplications/deletions 
model is limited by the size of the NC it creates. Vincent is exploring a size 
penalty to force this model to choose smaller ring chromosomes. This penalised 
model captures (1), (2) and (4), however (2) appears and disappears over time 
(i.e. the peak-modes moves) suggesting it may be a transient effect even in the 
data.

The lesson learnt from the (ongoing) simulation study is that chromothripsis 
may not be required and BFB may be sufficient to explain the development of the 
NC. **But** the orientation of the islands changes and the circular BFB can't 
account for different orientations of the islands. Vincent posited the following 
explanations:

- _Linear_ BFB may be involved in addition to circular BFB
- The circular BFB is poorly understood and thus may still admit the possibility of islands with different orientations.
- Perhaps there was an early chromothripsis event follow by BFB. However the motifs around the breakpoints do not support this hypothesis.

The simulation model is ongoing work with current plans to extend it to include:

- Simulate acquisition of new material by the NC
- Exploring the linear BFB model
- A population based model following multiple cells across time (the current simulation follows a single cell).
