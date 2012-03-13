TARGETUSERNAME=rand
TARGETHOST=ilab1.usc.edu
TARGETDIR=/lab/rand/public_html/CVsite

deploy:
	@echo "Deploying to ${TARGETHOST}"
	@rsync -arvuz site ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR} --exclude '.git'


