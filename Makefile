TARGETUSERNAME=rand
TARGETHOST=199.15.117.8
TARGETDIR=/var/www

all: site resume

resume: site/resume.pdf
site/resume.pdf : templates/resume_raw.html pages/printableresume.html
	@wkhtmltopdf site/printableresume.html site/resume.pdf --zoom .8

site: templates/*.html pages/*.html
	@python util/jinjarender.py

deploy:
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site/ ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'
