require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'fileutils'

desc 'Default: run unit tests.'
task :default => :test
 
desc 'Test the theme_support plugin.'
task :test do
  FileUtils.chdir 'test'
  sh 'rake test'
end

desc 'Generate documentation for the theme_support plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ThemeSupportPlugin'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
