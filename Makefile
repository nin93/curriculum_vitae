NAME_EN=elia_franzella_cv_dev

all: pdf-en opengraph-image

pdf-en:
	latexmk -pdf ${NAME_EN}.tex

opengraph-image: pdf-en
	magick -density 150 ${NAME_EN}.pdf -flatten -crop x40%+0+0 +repage opengraph-image.jpg

clean:
	rm -f \
		${NAME_EN}.aux ${NAME_EN}.bbl ${NAME_EN}.bcf ${NAME_EN}.fls ${NAME_EN}.fdb_latexmk \
		${NAME_EN}.log ${NAME_EN}.out ${NAME_EN}.blg ${NAME_EN}.toc ${NAME_EN}.run.xml \
	  *\~

distclean: clean
	rm -f ${NAME_EN}.pdf
