---
title: BioC2017 Developer Day
author: Peter Hickey
date: '2017-08-07'
categories:
  - Bioconductor
  - R
  - conference
tags:
  - Bioc2017
  - Bioconductor
slug: bioc2017-developer-day
header:
  caption: ''
  image: ''
---

A couple of weeks back I was in Boston for 
[BioC2017](https://www.bioconductor.org/help/course-materials/2017/BioC2017/), 
the annual Bioconductor meeting. This is my favourite conference because I get 
to hear from and meet the awesome community that develop and use R/Bioconductor 
packages to enable research in high-throughput biology. The agenda and slides 
for the 3 days are available from [https://www.bioconductor.org/help/course-materials/2017/BioC2017/](https://www.bioconductor.org/help/course-materials/2017/BioC2017/). 
I'm drawing on 
[these notes](https://docs.google.com/document/d/16TLlFBbRY2UHe_1K9Qoclh4erqco_MVCJ12m6JaZYlQ/edit?usp=sharing) 
that I scrawled during Developer Day, the first day of the meeting.

Developer Day is a chance for members of the Bioconductor core team to give 
updates on the project as a whole and to explain key infrastructure that the 
community can leverage in their own development and research. Just as 
importantly, however, it's also an opportunity for package developers to 
showcase their latest cool ideas. And there were plenty of those! Here's a
summary of my highlights.

A major focus of the meeting was the development of infrastructure to support 
single-cell genomics. The past few months has seen frenetic and very exciting 
development in this area by members of the Bioconductor community. 
Incidentally, much of this has been organised via the new-ish Bioconductor 
Slack channel - if interested, you can sign up at 
[https://bioc-community.herokuapp.com/](https://bioc-community.herokuapp.com/). 

Martin Morgan, the Project Lead, kicked things off with an overview that 
highlighted the impressive scope of the project and its continued growth - 
there are now more than 1300 packages on Bioconductor with more than 900 
maintainers ([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/Bioc-2017-intro.pdf)). 
I find that ratio of packages to developers pretty exciting: lots of people 
are contributing their expertise while the project as a whole has 
maintained a very high level of interoperability. Martin also kicked off an 
ongoing discussion on how the project should try to integrate with and learn 
lessons from the very popular [tidyverse](https://tidyverse.org/) of R 
packages. 


[Aaron Lun](https://github.com/LTLA/) demonstrated the power and utility of 
the community effort to develop single-cell genomics infrastructure by 
presenting an analysis of [single-cell RNA-seq data of 1.3 million mouse neurons](https://community.10xgenomics.com/t5/10x-Blog/Our-1-3-million-single-cell-dataset-is-ready-to-download/ba-p/276). 
Perhaps the coolest part was that he did this all using R and Bioconductor, 
something 10X Genomics [specifically advised against (for good reason, at the time)](https://community.10xgenomics.com/t5/10x-Blog/Our-1-3-million-single-cell-dataset-is-ready-to-download/ba-p/276). 
Oh, and he did it on a desktop with 8 GB of RAM. Aaron also gave an intro to 
his cryptically named **beachmat** package 
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/Dday/AaronLun_beachmat.pdf)).
[**beachmat**](https://bioconductor.org/packages/beachmat/) 
provides a unified C++ API for R matrix (and matrix-like) data structures. This 
will be very useful to package developers as they come to grips with providing 
algorithms that work for data stored in a variety of data structures, from 
simple in-memory _matrix_ objects to file-backed data, such as data in the 
[HDF5 format](https://support.hdfgroup.org/HDF5/). 

The use of alternative 'matrix-like' data structure was a common theme 
throughout the day, spurred in large part by the incredible work of 
Bioconductor core member, Hervé Pagès. Hervé gave an overview of the 
[**DelayedArray**](https://bioconductor.org/packages/DelayedArray/) package 
and its companion, [**HDF5Array**](https://bioconductor.org/packages/HDF5Array/) 
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/Workshops/DelayedArray/Working_with_large_arrays.pdf)). A _DelayedArray_ plays a 
somewhat similar role to a _tibble_ in the tidyverse: like how a _tibble_ can 
essentially be an ordinary data frame but equally can be used to represent and 
operate on a more complex data structure such as a database table, a 
_DelayedArray_ may be basically an ordinary array or can represent a more 
complex data structure such as data stored in an HDF5 file. I've been using 
these a lot in my own work and I'm really enjoying thinking about the 
possibilities of this idea.

[Michael Lawrence](https://github.com/lawremi), R core team member, gave a 
thought-provoking talk on the 'Usability of Bioconductor Infrastructure' 
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/BOF/usability.pdf)). 
I've had many years of benefiting from Bioconductor, but I 
do still remember the challenges in the early days of familiarising myself with 
the ecosystem and then in developing packages that integrate well with the core 
infrastructure. And that was despite having several years experience using R. 
Evidently, these challenges remain - many packages submitted to Bioconductor do 
not import or depend on any Bioconductor packages and, as a result, 
reinvent many a wheel, which has obvious downsides. Michael discussed 
strategies for improving the usability of Bioconductor infrastructure, again, 
drawing comparisons to the 'tidyverse', and reducing the cognitive load on both 
users and package developers.

After lunch, [Davide Risso](http://vivo.med.cornell.edu/display/cwid-dar2062) 
led a discussion on infrastructure for efficient storage and processing of 
large-scale single-cell genomics data ([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/Day1/BOF/SCE.html), [notes](https://www.bioconductor.org/help/course-materials/2017/BioC2017/Day1/BOF/Infrastructureforefficientstorageandprocessin.html), [discussion](https://support.bioconductor.org/p/98844/)). 
There has been a flurry of recent activity by Bioconductor developers on this 
topic, including the development of the 
[**SingleCellExperiment**](https://bioconductor.org/packages/SingleCellExperiment/) 
package that aims to provide a common S4 class for storing single-cell genomics 
data to improve interoperability between packages. Several of the key 
single-cell RNA-seq packages, including 
[**scater**](https://bioconductor.org/packages/scater/), 
[**scran**](https://bioconductor.org/packages/scran), 
[**MAST**](https://bioconductor.org/packages/MAST), and 
[**zinbwave**](https://bioconductor.org/packages/zinbwave), have already made 
the switch thanks to the tireless work of their developers. The 
_SingleCellExperiment_ class builds on the _SummarizedExperiment_ class, a 
workhorse of Bioconductor, which brings immediate benefits, including the
aforementioned cool work of 
[**DelayedArray**](https://bioconductor.org/packages/DelayedArray/), 
[**HDF5Array**](https://bioconductor.org/packages/HDF5Array/), and 
[**beachmat**](https://bioconductor.org/packages/beachmat/). Davide's 
presentation also gave the opportunity for other users and developers to 
suggest improvements to the package, which are already being persued. It was 
also pointed out by 
[Raphael Gottardo](https://www.fredhutch.org/en/labs/profiles/gottardo-raphael.html)
and others that the single-cell genomics community can learn a lot from the 
flow cytometry community who have been doing single-cell analyses for several 
years and have developed Bioconductor infrastructure to support this work.

Finally, scattered throughout the day we had a large number of 5-minute 
lightning talks. So many that I couldn't even get to see them all! I love the 
lightning talk format: I think it appeals to my inner advertising guru /
nightclub promoter. I presented ongoing work on a package called 
[**DelayedMatrixStats**](https://github.com/PeteHaitch/DelayedMatrixStats) that 
aims to port the 
[**matrixStats**](https://cran.r-project.org/package=matrixStats) API to 
support _DelayedMatrix_ objects and derived objects. Amongst the other 
lightning talks, I was very excited that 
[Lucas Schiffer](https://cunyisph.org/team/lucas-schiffer/) 
has added the capability to use markdown on the 
[Bioconductor support site](https://support.bioconductor.org/). Another 
lightning talk that got me excited was by 
[Lori Shepherd](https://twitter.com/lshep712?lang=en) on 
[**BiocFileCache**](https://bioconductor.org/packages/BiocFileCache/), a 
package to manage across sessions the common resource files, such as genomic 
annotations, that are costly or difficult to create 
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/LightningTalk/SessionIII/BiocFileCache.pptx)). Lori also highlighted the 
Bioconductor Docker containers and Amazon Machine Images 
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/LightningTalk/SessionIII/BiocDockersAndAMI.pptx)), 
as well as giving an introduction to package development ([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/Workshop/MakeAPackage.html)). And [Nitesh Turaga](https://github.com/nturaga) 
pulled back the curtain on his mammoth task of transitioning the entire 
Bioconductor project from Subversion to git while preserving the complete 
history
([slides](https://www.bioconductor.org/help/course-materials/2017/BioC2017/DDay/Workshop/GitWithTheProgram.pdf)).

All the presentations on Developer Day sparked many conversations that 
continued into the evening over dinner and drinks and on into the next two days 
of the main meeting. A huge thank you to the organisers for making this such a 
fun, educational, rewarding, and welcoming meeting. Looking forward to BioC2018!
