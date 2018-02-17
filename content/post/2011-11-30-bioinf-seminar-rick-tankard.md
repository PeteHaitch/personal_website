---
title: Detection of rare variants in massively parallel sequencing data and base quality
  recalibration
author: Peter Hickey
date: '2011-11-30'
slug: bioinf-seminar-rick-tankard
categories:
  - seminar
tags: []
header:
  caption: ''
  image: ''
---

Rick Tankard, who is a research assistant in the 
[Bahlo Lab](http://www.wehi.edu.au/faculty_members/dr_melanie_bahlo) at WEHI, 
gave a seminar discussing the quality scores produced by the Illumina 
sequencing machines. He also discussed the analysis pipeline he has built, in 
conjunction with other members of the Bahlo lab, for the detection of rare 
variants in MPS experiments

The quality scores produced off the sequencer are meant to give an indication 
of the quality of the base-call (for SOLiD data the qualities measure the 
quality of the colour- or dinucleotide-call). Rick only spoke about Illumina 
HiSeq data but what follows is generally relevant regardless of the sequencing 
platform. The quality scores are Phred-encoded probabilities, e.g. a base 
quality of 30 corresponds to a 1/1000 chance that the base-call is incorrect. 
These quality scores are commonly used in the downstream analysis of aligned 
data, such as when calling variants. However it is well known that these 
quality scores frequently overestimate the quality of the base-calls.

Illumina quality scores decrease roughly exponentially (on the Phred scale) by 
base position so that the initial bases are generally much higher quality than 
the last bases of each read. Illumina recently re-jigged their base-quality 
algorithm to down-weight the first 10 or so nucleotides of every read in light 
of evidence that it was consistently over-estimating the quality of these 
positions. This has improved things somewhat, but there still seems to be a 
general overconfidence in the quality of the base-calls.

Roughly speaking, base-quality recalibration tries to adjust the 
sequencer-produced base qualities by comparing them to the observed mismatch 
frequencies in the aligned data. [`GATK`](http://www.broadinstitute.org/gsa/wiki/index.php/The_Genome_Analysis_Toolkit) 
and the [`Novoalign`](http://www.novocraft.com/main/page.php?s=novoalign) 
aligner both perform base-quality recalibration, though in slightly different 
ways and at different points in the analysis pipeline. `GATK` is more 
transparent in [how it actually does the recalibration](http://www.ncbi.nlm.nih.gov/pubmed?term=A%20framework%20for%20variation%20discovery%20and%20genotyping%20using%20next-generation%20DNA%20sequencing%20data.).

Rick also discussed aligning reads against an _ambiguous reference genome_. An 
ambiguous reference genome uses the [IUPAC DNA codes](http://www.bioinformatics.org/sms2/iupac.html) 
at positions of known variation (such as SNPs) so that reads containing the 
non-reference allele at these sites are not unduly penalised. `Novoalign` is 
able to align against an ambiguous reference but I don't believe many aligners 
are capable of this (e.g. `BWA` or `Bowtie`).

Rick studied a single sample to assess the effect of base-quality 
recalibration, using `Novoalign` and/or `GATK`, and the effect of aligning 
against an ambiguous reference (where possible) on the number of reads aligned 
and the number of variants called when using `Novoalign` or `BWA`. The overall 
conclusions were:

- Use an ambiguous reference with `Novoalign` whenever possible
- Use `GATK` recalibration with `BWA`
- Avoid `GATK` recalibration when using the default options in `Novoalign`
- Use the `-o FULLNW` option in `Novoalign` to prevent `Novoalign` artificially inflating the quality of bases at the 3' end of reads
- Don't yet know if performing `Novoalign` quality-score recalibration followed by `GATK` quality score recalibration is a good idea

In the Bahlo lab we currently use `Novoalign`'s recalibration when aligning 
with `Novoalign` and `GATK`'s recalibration when aligning with `BWA`. Whilst 
the number of variants called by each of the "best" `Novoalign` and `BWA` 
analyses were similar in Rick's study, I'd like to know which variants are 
unique to each analysis and why. Rick is pursuing this question.
