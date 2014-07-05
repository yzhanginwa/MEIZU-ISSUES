# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'reocar-tracker'
set :repo_url, 'git://github.com/yzhanginwa/reocar-tracker.git'
set :deploy_to, '/rails_apps/reocar-tracker'
set :scm, :git

set :rbenv_type, :user
set :rbenv_ruby, '1.9.3-p448'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :log_level, :info

set :linked_files, %w{config/database.yml config/configuration.yml}

set :linked_dirs, %w{files public/uploads bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 10

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
