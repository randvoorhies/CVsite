TARGETUSERNAME=rand
TARGETHOST=ilab1.usc.edu
TARGETDIR=/lab/rand/public_html/CVsite

upload:
	scp -r site ${TARGETUSERNAME}@${TARGETHOST}:${TARGETDIR}


