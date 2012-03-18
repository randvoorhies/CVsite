watch( 'less' ) {|md| system("lessc less/all.less > site/css/all.css")}
watch( '(pages|templates)' ) {|md| system('make all') }
# vim:syntax=ruby
