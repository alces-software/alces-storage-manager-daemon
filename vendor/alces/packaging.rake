#!/usr/bin/env rake
namespace :alces do
  namespace :package do
    CODE = {}

    desc "Prepare for packaging"
    task :prep do
      commands = []
      CODE.each do |dir, repo|
        repo.each do |r|
          # clone the repo
          commands << "git clone http://grover.alces-software.com/git/#{r} #{dir}/#{r}"
          # remove the .git directory
          commands << "rm -rf #{dir}/#{r}/.git"
        end
      end
      cmd = "cd #{File.dirname(__FILE__)}; #{commands.join(';')}"
      puts "Executing: #{cmd}"
      system(cmd)
    end
  end
end
