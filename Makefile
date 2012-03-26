TARGETUSERNAME=rand
TARGETHOST=199.15.117.8
TARGETDIR=/var/www

.PHONY: all css cv site deploy

all: site cv css

css: site/css/all.css
	
cv: site/cv.pdf

site/css/all.css: less/*.less
	cd less && lessc all.less > ../site/css/all.css

site/cv.pdf : templates/cv_raw.html pages/printablecv.html
	@wkhtmltopdf site/printablecv.html site/RandolphVoorhiesCV.pdf --zoom .8

site: templates/*.html pages/*.html
	@python util/jinjarender.py

deploy:
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site/ ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'
