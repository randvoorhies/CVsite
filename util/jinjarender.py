import jinja2, glob, os.path

env = jinja2.Environment(loader=jinja2.FileSystemLoader(['templates', 'pages']))

pages = glob.glob('pages/*.html')

for page in pages:
  print 'Rendering ' + page
  basename = os.path.basename(page)
  renderedfile = open(os.path.join('site', basename), 'w')
  renderedfile.write(env.get_template(basename).render(pagename=basename))
