---
author: Peter Hickey
comments: true
date: 2011-11-07 14:50:47+00:00
layout: post
title: "Analysing Illumina Infinium 450k methylation arrays"
tagline: "Dr Alicia Oshlack"
category: WEHI Bioinformatics Seminars
tags: [Bioinformatics, DNA methylation, Presentation, SWAN, WEHI]

---

[Dr Alicia Oshlack](http://www.mcri.edu.au/research/core-facilities/bioinformatics/), head of Bioinformatics at the Murdoch Children's Research Institute and formerly of WEHI Bioinformatics, gave today's Bioinformatics seminar at WEHI. Her topic was "Analysing Human Infinium 450k Methylation Arrays", in particular the normalisation and quality control issues associated with them. I've fleshed out the notes I made during the seminar, below.

Alicia credited Jovana Maksimovic and Livinia Gordon (members of her lab) with most of the work she was to present today.

DNA methylation is the earliest discovered, and most widely studied, epigenetic mark (histone methylation is another example of an epigenetic mark). DNA methylation a dynamic mark in that it can be added and removed during different stages of the cell life-cycle, but importantly DNA methylation is preserved during cell mitosis (cell division).

Traditionally (dogmatically?) DNA methylation in a gene's promoter region results in repression of that gene while DNA methylation across a gene's body results in gene expression. DNA methylation 'going awry' is a hallmark of cancer.

There are several experiments/methods to study DNA methylation but all study the __proportion__ of methylated cells in the study population (this may change with single-molecule sequencing). The methods for studying DNA methylation can be broadly categorised into region-level resolution or single base-pair resolution. Some examples of region-level resolution techonologies are _MeDip-seq_ and _MBD capture-seq_, while _whole-genome bisulfite sequencing_, _reduced representation bisulfite sequencing_ (RRBS) and Illumina Infinium methylation arrays (such as the [450k beadchip](http://www.illumina.com/products/methylation_450_beadchip_kits.ilmn)) are examples of single base-pair resolution assays.

The recently released and [published](http://www.ncbi.nlm.nih.gov/pubmed/21593595) Infinium HumanMethylation450 BeadChip replaces the old 27k Infinium methylation array and provides a cheap way to study DNA methylation at 450,000 CpGs across tens of human samples. I mean 'cheap' in comparison to either whole-genome bisulfite sequencing or even RRBS, which are still prohibitively expensive for the study of a large number of samples at this time. I believe Illumina are also developing a version of the 450k chip for mouse. The CpGs targeted by the chip are gene-biased (i.e. favouring CpGs within or close to genes) and Illumina provides extensive annotation for each target. This is a BeadChip assay like Illumina's genotyping assays.

The 450k chip features two types of probes - Illumina I and Illumina II style probes. Infinium I probes assume the whole probe is methylated or unmethylated (25% of probes on the chip) while Infinium II probes contain redundant bases (R's in [IUPAC notation](http://www.bioinformatics.org/sms2/iupac.html)) at the G nucleotide in CpGs within the probe body. The Infinium I probes will obviously have binding problems at positions that are partially methylated since they assume uniform methylation status across the probe body. The Infinium probes can accomodate at most three CpGs in the probe body, so there are obviously CpGs that the 450k isn't able to assay.

There are in fact two kinds of Infinium I probes - methylated (M) probes and unmethylated (U) probes. The ratio U/M is used as the basis for estimating the methylation status at each CpG. There is only a single kind of Infinium II probe with one colour reported for methylated CpG (green, I think) and another colour reported for unmethylated CpG (red, I think). These colours are fixed and so no _dye swaps_ are possible (a common technique for estimating technical artefacts in microarrays).

Basically, the 450k chip is comprised of two very different classes of probes and these probes target different regions of the genome (owing to the assumptions/limitations required when designing the probe). Alicia then went on to discuss the normalisation of these probes.

Normalisation and quality control procedures are __essential__ when analysing genomics data to separate out the technical variation from the biological variation (the interesting stuff). The normalisation procedure proposed by Alicia is named **S**ubset quantile **W**ithin **A**rray **N**ormalisation (__SWAN__). It uses quantile normalisation on probe sets that contain the same number of CpGs, i.e. quantile normalise all probes containing one CpG in the probe body, quantile normalise all probes containing two CpG in the probe body, etc. Quantile normalisation is performed relative to the Infinium I probes and Infinium II probes in each probe set to normalise the two classes of probes and separately for the U and M channels. The quantile normalisation is the _within array_ part of the procedure; it is followed by an _across array_ normalisation.

Alicia presented several graphs showing SWAN improved the analysis of 450k chip data compared to either no normalisation or only within-array or across-array normalisation. SWAN is an R function that should soon be available in the _[minfi](http://www.bioconductor.org/packages/release/bioc/html/minfi.html)_ Bioconductor R package. _minfi_ and _[methylumi](http://www.bioconductor.org/packages/release/bioc/html/methylumi.html)_ are two packages for the downstream analysis of Illumina methylation arrays, though Alicia noted that many functions in _[limma](http://bioconductor.org/packages/release/bioc/html/limma.html)_ are also useful for analysing these arrays.
