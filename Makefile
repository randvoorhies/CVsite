TARGETUSERNAME=rand
TARGETHOST=199.15.117.8
TARGETDIR=/var/www

all: css site cv

cv: site/cv.pdf
site/cv.pdf: site templates/cv_raw.html pages/printablecv.html
	@wkhtmltopdf site/printablecv.html site/RandolphVoorhiesCV.pdf #--zoom .8

css: site/css/all.css
site/css/all.css: less/*.less
	mkdir -p site/css && cd less && lessc all.less > ../site/css/all.css

site: templates/*.html pages/*.html
	@python util/jinjarender.py

deploy: all
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site/ ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'
