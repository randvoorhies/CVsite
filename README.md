This site is built using the Jinja2 templating system. The site's develoment environment is split up into the following directories:

*  __CVsite/less__ : The _less_ css template files.
*  __CVsite/pages__: Jinja2 templates which get rendered directly into pages.
*  __CVsite/template__: Jinja2 templates which are included by those in __CVsite/pages__.
*  __CVsite/site__: The rendered website.
*  __CVsite/util__: Utilities for development of this site:
  * __watchit.rb__: A watchr config file used to automatically rebuild the site when changes are detected during development
  * __jinjarender.py__: A python script that envokes Jinja2 to build all of the site's templates.