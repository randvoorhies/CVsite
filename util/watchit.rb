#watch( 'templates/resume_raw.html' ) {|md| system('wkhtmltopdf site/printableresume.html site/resume.pdf --zoom .8')}
watch( 'less' ) {|md| system("lessc less/all.less > site/css/all.css")}
watch( '(pages|templates)' ) {|md| system('make all') }
# vim:syntax=ruby
