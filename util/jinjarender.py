import jinja2
import glob
import os.path
import sys

if len(sys.argv) != 2:
  print 'Usage:', sys.argv[0], 'filename'
  sys.exit(-1)

env = jinja2.Environment(loader=jinja2.FileSystemLoader(['templates', 'pages']))

page = sys.argv[1]
basename = os.path.basename(page)
renderedfile = open(os.path.join('site', basename), 'w')
renderedfile.write(env.get_template(basename).render(pagename=basename))
