TARGETUSERNAME=rand
TARGETHOST=199.15.117.8
TARGETDIR=/var/www

deploy:
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site/ ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'


