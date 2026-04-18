NAME=elia_franzella_cv_dev

all: pdf opengraph-image

pdf:
	latexmk -pdf ${NAME}.tex

opengraph-image: pdf
	convert -density 100 -flatten ${NAME}.pdf opengraph-image.jpg
	convert -crop x445+0+0 +repage opengraph-image.jpg opengraph-image.jpg

clean:
	rm -f ${NAME}.aux ${NAME}.bbl ${NAME}.bcf ${NAME}.fdb_latexmk ${NAME}.fls ${NAME}.log ${NAME}.out ${NAME}.run.xml ${NAME}.blg ${NAME}.toc *\~

distclean: clean
	rm -f ${NAME}.pdf
