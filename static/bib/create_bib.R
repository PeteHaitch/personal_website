library(here)
library(RefManageR)

# Load files -------------------------------------------------------------------

paperpile <- ReadBib(here("static/bib/paperpile.bib"))
# Annotations adapted from http://www.hansenlab.org/cv_bibliography_tex
paperpile_annotations <- read.csv(here("static/bib/paperpile_annotations.csv"))

# TODO: Add theses

# Add extra fields -------------------------------------------------------------

# TODO: Merge .bib file(s) with annotations

# Construct output(s) ----------------------------------------------------------

# .bib for LaTeX-based CV
