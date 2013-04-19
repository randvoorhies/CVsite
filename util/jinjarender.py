import jinja2
#import glob
import os.path
import sys

env = jinja2.Environment(loader=jinja2.FileSystemLoader(['templates', 'pages']))

#pages = glob.glob('pages/*.html')

page = sys.argv[1]
print 'Rendering ' + page
#basename = os.path.basename(page)
#renderedfile = open(os.path.join('site', basename), 'w')
#renderedfile.write(env.get_template(basename).render(pagename=basename))


#for page in pages:
#  print 'Rendering ' + page
#  basename = os.path.basename(page)
#  renderedfile = open(os.path.join('site', basename), 'w')
#  renderedfile.write(env.get_template(basename).render(pagename=basename))
