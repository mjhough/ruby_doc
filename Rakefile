require "bundler/gem_tasks"
task :default => :spec

require_relative './config/environment'

task :console do
  Pry.start
end

def reload!
  load "./config/environment.rb"
end