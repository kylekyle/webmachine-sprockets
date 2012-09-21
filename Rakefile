require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << Gem.loaded_specs['sprockets'].gem_dir + '/test'
end
