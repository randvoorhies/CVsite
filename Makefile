TARGETUSERNAME=rand
TARGETHOST=r-c-v.com
TARGETDIR=/srv/www/r-c-v.com

PAGES=$(wildcard pages/*.html)
SITE_PAGES=$(subst pages/,site/,${PAGES})

content: pages css cv

########################### HTML Template Pages ###########################
pages: $(SITE_PAGES)

site/%.html: pages/%.html 
	@mkdir -p .deps
	@python util/template_deps.py $< > .deps/$*.d
	@echo "Compiling template file $<"
	@python util/jinjarender.py $<

-include .deps/*.d

########################### CSS ###########################
css: site/css/all.css
site/css/all.css: less/*.less
	@echo "Compiling CSS files"
	mkdir -p site/css && cd less && lessc all.less > ../site/css/all.css

########################### CV ###########################
cv: site/RandolphVoorhiesCV.pdf
site/RandolphVoorhiesCV.pdf: site/printablecv.html templates/cv_raw.html site/css/all.css
	@echo "Converting cv to pdf"
	@wkhtmltopdf --quiet site/printablecv.html site/RandolphVoorhiesCV.pdf


########################### Phony Targets ###########################
.PHONY: clean deploy
clean:
	rm ${SITE_PAGES}
	rm site/css/*.css

deploy: content
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site/ ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'
