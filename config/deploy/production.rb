set :repository, "git://github.com/yzhanginwa/reocar-tracker.git"
set :application_servers, %w(reocar-tracker)
set :migration_server, "reocar-tracker"
set :user, "rails"
set :rails_env, "production"
set :branch, "production"
set :deploy_via, :remote_cache
set :application, "reocar-tracker"
ssh_options[:port] = 22

load File.dirname(__FILE__) + "/shared_code"

task :assets_precompile, :roles => [:app] do
  run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile 2>/dev/null"
end

after "deploy:update_code", :assets_precompile
