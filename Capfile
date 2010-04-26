load 'deploy' if respond_to?(:namespace) # cap2 differentiator

default_run_options[:pty] = true

# be sure to change these
set :user, 'sofanara'
set :git_user, 'bomberstudios'
set :domain, 'img.sofanaranja.com'
set :git_domain, 'github.com'
set :application, 'poster'

# the rest should be good
set :repository,  "git@#{git_domain}:#{git_user}/#{application}.git" 
set :deploy_to, "/home/#{user}/www/#{domain}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end