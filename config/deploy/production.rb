role :app, %w{rails@reocar-tracker}
role :web, %w{rails@reocar-tracker}
role :db,  %w{rails@reocar-tracker}

set :stage, :production
set :branch, 'production'

