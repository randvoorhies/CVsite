#!/usr/bin/env python

import jinja2
import sys

from jinja2 import meta

if len(sys.argv) != 2:
  print 'Usage:', sys.argv[0], 'filename'
  sys.exit(-1)

page = sys.argv[1]
env = jinja2.Environment(loader=jinja2.FileSystemLoader(['templates', 'pages']))
with open(page, 'r') as p:
  ast=env.parse(''.join(p.readlines()))
  dependencies = filter(lambda x: x != None, list(meta.find_referenced_templates(ast)))
  if len(dependencies) > 0:
    dependencies = ['templates/'+x for x in dependencies]
    print page.replace('pages/', 'site/') + ':', ' '.join(dependencies)
