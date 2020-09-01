OLDCV=PeterFrancisHickey_CV
CV=hickey_cv
BIB1=papers
BIB2=preprints
BIB3=others
BIB4=published_preprints
BIB5=consortia_papers

cv: ${CV}.tex
	texi2pdf -c ${CV}.tex

cv_internal: ${CV}.tex
	INTERNALUSE="TRUE" texi2pdf -c ${CV}.tex

# TODO: Fix paths to bib files here and in preprocess.R
papers: ${BIB1}.bib ${BIB2}.bib ${BIB3}.bib ${BIB4}.bib ${BIB5}.bib preprocess.R
	Rscript preprocess.R

# TODO: Update
#github: cv
#	cp ${CV}.pdf ../hansenlab.github.io/files/
#	cd ../hansenlab.github.io/files/ && git commit -m "Updated CV" hansen_cv.pdf

clean:
	rm -f ${OLDCV}.log ${OLDCV}.aux ${OLDCV}.out \
	      ${OLDCV}.bbl ${OLDCV}.blg \
	      ${CV}.log ${CV}.aux ${CV}.out \
	      ${CV}.bbl ${CV}.blg \
	      ${BIB1}.aux ${BIB1}.bbl ${BIB1}.blg \
	      ${BIB2}.aux ${BIB2}.bbl ${BIB2}.blg \
	      ${BIB3}.aux ${BIB3}.bbl ${BIB3}.blg \
	      ${BIB4}.aux ${BIB4}.bbl ${BIB4}.blg \
	      ${BIB5}.aux ${BIB5}.bbl ${BIB5}.blg \
	      ${RESEARCH}.log ${RESEARCH}.aux \
	      _region_.tex
