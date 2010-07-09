require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "require_hooks"
    gem.summary = %Q{React to ActiveSupport loading or auto-loading a file}
    gem.description = %Q{Extend ActiveSupport to run blocks before or after a file is "require_or_load"ed into memory.}
    gem.email = "phil.h.smith@gmail.com"
    gem.homepage = "http://github.com/phs/require_hooks"
    gem.authors = ["Phil Smith"]
    gem.add_dependency "activesupport", "3.0.0.beta4"
    # gem.add_dependency "activesupport", ">= 3.0.0.rc1" # TODO: load_paths is renamed autoload_paths on next release
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "require_hooks #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
