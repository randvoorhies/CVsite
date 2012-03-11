watch( 'less' ) {|md| system("lessc less/all.less > site/css/all.css")}
watch( '(pages|templates)' ) {|md| system('python util/jinjarender.py')}
# vim:syntax=ruby
