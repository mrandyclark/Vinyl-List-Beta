set :application, "vinyllist"

default_run_options[:pty] = true
set :use_sudo, true
set :scm, :git


set :rails_env, "production"
set :deploy_to, "/d/sites/#{application}"

set :repository,  "git@github.com:mrandyclark/Vinyl-List-Beta.git"
set :branch, "master"
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }

set :user, "ec2-user"
set :location, "ec2-50-17-243-98.compute-1.amazonaws.com"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "clarkkey.pem")]

role :app, location
role :web, location
role :db,  location, :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end