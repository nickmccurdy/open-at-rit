# Deploy to Heroku in production
task deploy: ['deploy:push', 'deploy:migrate']

namespace :deploy do
  APP = 'openatrit'

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push -f git@heroku.com:#{APP}.git master`
  end

  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart --app #{APP}`
  end

  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku run rake db:migrate --app #{APP}`
  end

  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on --app #{APP}`
  end

  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off --app #{APP}`
  end

end
